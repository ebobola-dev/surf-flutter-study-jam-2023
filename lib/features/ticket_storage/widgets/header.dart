import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/popup_actions/popup_actions.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';

class Header extends StatelessWidget {
  final ITicketStorageWM ticketStorageWM;
  const Header({
    super.key,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Хранение билетов",
          style: ticketStorageWM.headerStyle,
        ),
        Spacer(),
        PopupMenuButton<PopupAction>(
          icon: Icon(
            Icons.more_vert_rounded,
            color: ticketStorageWM.iconColor,
          ),
          onSelected: (popupAction) {
            switch (popupAction) {
              case PopupAction.downloadAll:
                ticketStorageWM.onDownloadAllTap();
                break;
              case PopupAction.deleteAll:
                ticketStorageWM.onDeleteAllTap();
                break;
            }
          },
          itemBuilder: (context) => PopupAction.values
              .map(
                (popupAction) => PopupMenuItem(
                  value: popupAction,
                  child: Text(popupAction.description),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
