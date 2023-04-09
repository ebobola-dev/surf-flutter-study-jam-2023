import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/assets/themes/paddings.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/utils/animated_switcher_transition.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';
import 'package:surf_flutter_study_jam_2023/utils/screen_sizes.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final VoidCallback? onDownloadTap;
  final TextStyle nameStyle;
  final TextStyle progressStyle;
  final Color iconsColor;
  final Color downloadingColor;
  final Color downloadedColor;
  const TicketCard({
    super.key,
    required this.ticket,
    required this.onDownloadTap,
    required this.nameStyle,
    required this.progressStyle,
    required this.iconsColor,
    required this.downloadingColor,
    required this.downloadedColor,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(7.5);
    final cardWidth = getScreenSize(context).width - defaultPadding * 2 - 8.0;
    final canDownload = !ticket.downloadStarted;
    final isDownloading = ticket.downloadStarted &&
        !ticket.downloaded &&
        !ticket.errorOnDownloading;
    var downloadIconColor = iconsColor;
    if (!canDownload) downloadIconColor = downloadingColor;
    final downloaedView = '${FileUtil.getFileSizeString(
      bytes: ticket.downloadedSize,
      decimals: 1,
    )} / ${FileUtil.getFileSizeString(
      bytes: ticket.totalSize,
      decimals: 1,
    )}';
    return Card(
      child: Stack(
        children: [
          //? Background progress
          if (isDownloading)
            Positioned.fill(
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Animations.fastSpeed,
                    width: cardWidth *
                        math.min(ticket.downloadingProgress * 0.01, 1.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.36),
                      borderRadius: borderRadius,
                    ),
                  ),
                ],
              ),
            ),
          Material(
            color: Colors.transparent,
            borderRadius: borderRadius,
            child: InkWell(
              onTap: ticket.downloaded ? () {} : null,
              borderRadius: borderRadius,
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
                                  iconsColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Flexible(
                                child: Text(
                                  ticket.name,
                                  style: nameStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: canDownload ? onDownloadTap : null,
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
                                        ? downloadedColor
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
                      child: isDownloading
                          ? Text(
                              'Скачивание $downloaedView...',
                              style: progressStyle,
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
