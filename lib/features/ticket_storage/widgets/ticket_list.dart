import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';

class TicketList extends StatelessWidget {
  final ITicketStorageWM ticketStorageWM;
  const TicketList({
    super.key,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      listenableState: ticketStorageWM.ticketList,
      builder: (_, ticketListState) {
        final tickedListisEmpty = ticketListState!.isEmpty;
        if (tickedListisEmpty) {
          return Center(
            child: Text(
              "Нет билетов",
              style: ticketStorageWM.emptyTicketListStyle,
            ),
          );
        }
        //TODO show ticket list
        return Container();
      },
    );
  }
}
