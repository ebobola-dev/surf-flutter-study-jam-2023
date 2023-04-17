import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/tickets.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/ticket_card.dart';

class TicketList extends StatelessWidget {
  final ITicketStorageWM ticketStorageWM;
  const TicketList({
    super.key,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    return MultiListenerRebuilder(
      listenableList: [
        ticketStorageWM.isInitialization,
        ticketStorageWM.ticketList,
      ],
      builder: (_) {
        final isInitialization = ticketStorageWM.isInitialization.value!;
        final ticketList = ticketStorageWM.ticketList.value!;
        final ticketListIsEmpty = ticketList.isEmpty;
        if (isInitialization) {
          return Center(
            child: Text(
              "Чтение сохранённых билетов...",
              style: ticketStorageWM.bodyStyle,
            ),
          );
        }
        if (ticketListIsEmpty) {
          return Center(
            child: Text(
              TicketsStrings.ticketListIsEmpty,
              style: ticketStorageWM.bodyStyle,
            ),
          );
        }
        return ListView.separated(
          itemCount: ticketList.length,
          itemBuilder: (context, index) {
            return TicketCard(
              ticket: ticketList[index],
              ticketStorageWM: ticketStorageWM,
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
        );
      },
    );
  }
}
