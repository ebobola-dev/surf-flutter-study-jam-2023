import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/config/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/ticket_card/downloading_progress.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/ticket_card/menu.dart';
import 'package:surf_flutter_study_jam_2023/utils/animated_switcher_transition.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final ITicketStorageWM ticketStorageWM;
  const TicketCard({
    super.key,
    required this.ticket,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    final downloadingIconColor =
        ticketStorageWM.ticketDownloadingIcons[ticket.downloadingStatus]!;
    return Card(
      child: Material(
        color: Colors.transparent,
        borderRadius: ticketStorageWM.ticketCardBorderRadius,
        child: InkWell(
          onTap: () => ticketStorageWM.onTicketCardTap(ticket.url),
          borderRadius: ticketStorageWM.ticketCardBorderRadius,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconPaths.ticket,
                            colorFilter: ColorFilter.mode(
                              ticketStorageWM.iconColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              ticket.name,
                              style: ticketStorageWM.ticketCardNameStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: !ticket.downloaded
                          ? () =>
                              ticketStorageWM.onTicketDownloadIconTap(ticket)
                          : null,
                      icon: AnimatedSwitcher(
                        duration: Animations.mediumSpeed,
                        switchInCurve: Animations.curve,
                        switchOutCurve: Animations.curve,
                        transitionBuilder: scaleTransitionBuilder,
                        child: downloadingIconColor,
                      ),
                    ),
                  ],
                ),

                ///? Прогресс скачивания
                TicketDownloadingProgress(
                  ticket: ticket,
                  ticketStorageWM: ticketStorageWM,
                ),

                ///? Меню действий с билетом
                TicketMenu(
                  ticket: ticket,
                  ticketStorageWM: ticketStorageWM,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
