import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/config/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/ticket_card/menu_button.dart';

///? Отображение прогресса скачивания
class TicketMenu extends StatelessWidget {
  final Ticket ticket;
  final ITicketStorageWM ticketStorageWM;
  const TicketMenu({
    super.key,
    required this.ticket,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Animations.mediumSpeed,
      curve: Animations.curve,
      child: StateNotifierBuilder(
        listenableState: ticketStorageWM.activeTicketCard,
        builder: (context, activeUrl) {
          if (activeUrl == null || activeUrl != ticket.url) {
            return SizedBox();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ticket.isDownloading) SizedBox(height: 12.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TicketMenuButton(
                      show: ticket.downloaded,
                      iconPath: IconPaths.eye,
                      text: 'Открыть',
                      textStyle: ticketStorageWM.ticketMenuButtonStyle,
                      borderRadius:
                          ticketStorageWM.ticketMenuButtonBorderRadius,
                      color: ticketStorageWM.primaryColor,
                      disabledColor: ticketStorageWM.disabledColor,
                      rightMargin: 3.0,
                      onTap: () => ticketStorageWM.onOpenTicketTap(ticket),
                    ),
                    TicketMenuButton(
                      show: ticket.downloaded,
                      iconPath: IconPaths.refresh,
                      text: 'Загрузить\nзаново',
                      textStyle: ticketStorageWM.ticketMenuButtonStyle,
                      borderRadius:
                          ticketStorageWM.ticketMenuButtonBorderRadius,
                      color: ticketStorageWM.primaryColor,
                      disabledColor: ticketStorageWM.disabledColor,
                      rightMargin: 3.0,
                      onTap: () =>
                          ticketStorageWM.onRedownloadTicketTap(ticket),
                    ),
                    TicketMenuButton(
                      iconPath: IconPaths.delete,
                      text: 'Удалить',
                      textStyle: ticketStorageWM.ticketMenuButtonStyle,
                      borderRadius:
                          ticketStorageWM.ticketMenuButtonBorderRadius,
                      color: ticketStorageWM.primaryColor,
                      disabledColor: ticketStorageWM.disabledColor,
                      rightMargin: 3.0,
                      onTap: () => ticketStorageWM.onDeleteTicketTap(ticket),
                    ),
                    TicketMenuButton(
                      iconPath: IconPaths.info,
                      text: 'Инфо',
                      textStyle: ticketStorageWM.ticketMenuButtonStyle,
                      borderRadius:
                          ticketStorageWM.ticketMenuButtonBorderRadius,
                      color: ticketStorageWM.primaryColor,
                      disabledColor: ticketStorageWM.disabledColor,
                      onTap: () => ticketStorageWM.onInfoTicketTap(ticket),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
