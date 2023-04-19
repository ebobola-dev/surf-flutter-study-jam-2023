import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/config/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';
import 'package:surf_flutter_study_jam_2023/utils/animated_switcher_transition.dart';

class AddTicketButton extends StatelessWidget {
  final ITicketStorageWM ticketStorageWM;
  const AddTicketButton({
    super.key,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
        listenableState: ticketStorageWM.isInitialization,
        builder: (context, isInitialization) {
          return AnimatedSwitcher(
            duration: Animations.mediumSpeed,
            switchInCurve: Animations.curve,
            switchOutCurve: Animations.curve,
            transitionBuilder: scaleTransitionBuilder,
            child: Builder(builder: (context) {
              if (isInitialization!) return SizedBox(key: ValueKey(false));
              return FloatingActionButton(
                key: ValueKey(true),
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
            }),
          );
        });
  }
}
