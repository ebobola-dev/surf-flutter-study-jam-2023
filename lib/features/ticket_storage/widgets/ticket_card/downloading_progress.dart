import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/downloading_status/downloading_status.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';

import 'dart:math' as math;

///? Отображение прогресса скачивания
class TicketDownloadingProgress extends StatelessWidget {
  final Ticket ticket;
  final ITicketStorageWM ticketStorageWM;
  const TicketDownloadingProgress({
    super.key,
    required this.ticket,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Animations.mediumSpeed,
      reverseDuration: Animations.mediumSpeed,
      curve: Animations.curve,
      child: Builder(
        builder: (context) {
          if (ticket.downloaded ||
              ticket.downloadingStatus == DownloadingStatus.notStarted) {
            return SizedBox();
          }
          if (ticket.hasDownloadingError)
            return Text(
              'Ошибка при скачивании',
              style: ticketStorageWM.ticketProgressStyle.copyWith(
                color: Colors.red,
              ),
            );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Скачивание ${ticketStorageWM.getSizeAsString(ticket.downloadedSize)} / ${ticketStorageWM.getSizeAsString(ticket.totalSize)}...',
                style: ticketStorageWM.ticketProgressStyle,
              ),
              const SizedBox(height: 6.0),
              Container(
                width: ticketStorageWM.maxProgressWidth,
                height: 5.0,
                decoration: BoxDecoration(
                  color: ticketStorageWM.disabledColor.withOpacity(.32),
                  borderRadius: ticketStorageWM.ticketCardBorderRadius,
                ),
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: Animations.fastSpeed,
                  width: ticketStorageWM.maxProgressWidth *
                      math.min(ticket.downloadingProgress * 0.01, 1.0),
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: ticketStorageWM.ticketCardBorderRadius,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
