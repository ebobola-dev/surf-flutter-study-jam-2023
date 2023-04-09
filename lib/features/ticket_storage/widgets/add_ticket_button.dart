import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';

class AddTicketButton extends StatelessWidget {
  final ITicketStorageWM ticketStorageWM;
  const AddTicketButton({
    super.key,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: ticketStorageWM.onAddTicketTap,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SvgPicture.asset(
          IconPaths.plus,
          colorFilter: ColorFilter.mode(
            ticketStorageWM.addTicketButtonIconColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
