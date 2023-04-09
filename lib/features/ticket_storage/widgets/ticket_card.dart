import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/utils/animated_switcher_transition.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final VoidCallback? onDownloadTap;
  final TextStyle nameStyle;
  final Color iconsColor;
  final Color downloadingColor;
  final Color downloadedColor;
  const TicketCard({
    super.key,
    required this.ticket,
    required this.onDownloadTap,
    required this.nameStyle,
    required this.iconsColor,
    required this.downloadingColor,
    required this.downloadedColor,
  });

  @override
  Widget build(BuildContext context) {
    final canDownload = !ticket.downloadStarted;
    final isDownloading = ticket.downloadStarted && !ticket.downloaded;
    var downloadIconColor = iconsColor;
    if (!canDownload) downloadIconColor = downloadingColor;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
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
            AnimatedSize(
              duration: Animations.mediumSpeed,
              curve: Animations.curve,
              child: isDownloading
                  ? Text(
                      '${ticket.downloadingProgress}%',
                      style: nameStyle,
                    )
                  : const SizedBox(),
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
                        ticket.downloaded ? downloadedColor : downloadIconColor,
                        BlendMode.srcIn,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
