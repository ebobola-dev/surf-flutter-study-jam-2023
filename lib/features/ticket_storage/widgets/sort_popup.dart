import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/config/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/sorting/sorting_options.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';

class SortPopup extends StatelessWidget {
  final ITicketStorageWM ticketStorageWM;
  const SortPopup({super.key, required this.ticketStorageWM});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortingOptions>(
      icon: SvgPicture.asset(
        IconPaths.sort,
        width: 20.0,
        colorFilter: ColorFilter.mode(
          ticketStorageWM.iconColor,
          BlendMode.srcIn,
        ),
      ),
      onSelected: ticketStorageWM.onSortingOptionTap,
      itemBuilder: (context) => allSotrignOptions
          .map(
            (option) => PopupMenuItem(
              value: option,
              child: StateNotifierBuilder(
                  listenableState: ticketStorageWM.sortingOptions,
                  builder: (context, currentSortingOption) {
                    return Row(
                      children: [
                        Text(
                          option.type.name,
                          style: ticketStorageWM.bodyStyle.copyWith(
                            color: currentSortingOption == option
                                ? Colors.green
                                : null,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        const Spacer(),
                        if (currentSortingOption == option)
                          SvgPicture.asset(
                            IconPaths.success,
                            width: 20.0,
                            colorFilter: ColorFilter.mode(
                              Colors.green,
                              BlendMode.srcIn,
                            ),
                          ),
                        const SizedBox(width: 12.0),
                        SvgPicture.asset(
                          option.reversed
                              ? IconPaths.sortUp
                              : IconPaths.sortDown,
                          colorFilter: ColorFilter.mode(
                            currentSortingOption == option
                                ? Colors.green
                                : ticketStorageWM.iconColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          )
          .toList(),
    );
  }
}
