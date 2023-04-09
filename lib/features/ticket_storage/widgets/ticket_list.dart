import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
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
    return StateNotifierBuilder(
      listenableState: ticketStorageWM.ticketList,
      builder: (_, ticketList) {
        final ticketListisEmpty = ticketList!.isEmpty;
        if (ticketListisEmpty) {
          return Center(
            child: Text(
              "Нет билетов",
              style: ticketStorageWM.emptyTicketListStyle,
            ),
          );
        }
        return ListView.separated(
          itemCount: ticketList.length,
          itemBuilder: (context, index) {
            return TicketCard(
              ticket: ticketList[index],
              nameStyle: ticketStorageWM.ticketCardNameStyle,
              iconsColor: ticketStorageWM.ticketCardIconsColor,
              onDownloadTap: () => ticketStorageWM.onDownloadTicketTap(
                ticketList[index].url,
              ),
              downloadingColor: ticketStorageWM.ticketCardDownloadingIconColor,
              downloadedColor: ticketStorageWM.ticketCardDownloadedIconColor,
              progressStyle: ticketStorageWM.ticketProgressStyle,
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
        );
      },
    );
  }
}
