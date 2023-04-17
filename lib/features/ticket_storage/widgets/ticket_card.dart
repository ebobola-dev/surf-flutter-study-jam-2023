import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/config/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';
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
    var downloadIconColor = ticketStorageWM.iconColor;
    if (!ticket.canDownload)
      downloadIconColor = ticketStorageWM.ticketCardDownloadingIconColor;
    return Card(
      child: Stack(
        children: [
          //? Background progress
          if (ticket.isDownloading)
            Positioned.fill(
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Animations.fastSpeed,
                    width: ticketStorageWM.ticketCardWidth *
                        math.min(ticket.downloadingProgress * 0.01, 1.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.36),
                      borderRadius: ticketStorageWM.ticketCardBorderRadius,
                    ),
                  ),
                ],
              ),
            ),
          Material(
            color: Colors.transparent,
            borderRadius: ticketStorageWM.ticketCardBorderRadius,
            child: InkWell(
              onTap: ticket.downloaded ? () {} : null,
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
                          onPressed: ticket.canDownload
                              ? () => ticketStorageWM
                                  .onDownloadTicketTap(ticket.url)
                              : null,
                          icon: AnimatedSwitcher(
                            duration: Animations.slowSpeed,
                            switchInCurve: Animations.curve,
                            switchOutCurve: Animations.curve,
                            transitionBuilder: scaleTransitionBuilder,
                            child: Builder(
                              builder: (context) {
                                final icon = ticket.downloaded
                                    ? IconPaths.downloaded
                                    : IconPaths.download;
                                return SvgPicture.asset(
                                  icon,
                                  key: ValueKey(icon),
                                  colorFilter: ColorFilter.mode(
                                    ticket.downloaded
                                        ? ticketStorageWM
                                            .ticketCardDownloadedIconColor
                                        : downloadIconColor,
                                    BlendMode.srcIn,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: Animations.mediumSpeed,
                      curve: Animations.curve,
                      child: ticket.isDownloading || ticket.hasDownloadingError
                          ? Text(
                              ticket.hasDownloadingError
                                  ? 'Ошибка при скачивании'
                                  : 'Скачивание ${ticketStorageWM.getSizeAsString(ticket.downloadedSize)} / ${ticketStorageWM.getSizeAsString(ticket.totalSize)}...',
                              style:
                                  ticketStorageWM.ticketProgressStyle.copyWith(
                                color: ticket.hasDownloadingError
                                    ? Colors.red
                                    : null,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
