import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/icons_paths.dart';
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
        IconButton(
          onPressed: ticketStorageWM.onDownloadAllTap,
          icon: SvgPicture.asset(
            IconPaths.downloadAll,
            width: 22.0,
            colorFilter: ColorFilter.mode(
              ticketStorageWM.iconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
