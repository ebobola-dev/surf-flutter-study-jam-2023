import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/tickets.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/ticket_card/ticket_card.dart';
import 'package:surf_flutter_study_jam_2023/utils/animated_switcher_transition.dart';

class TicketList extends StatelessWidget {
  final ITicketStorageWM ticketStorageWM;
  const TicketList({
    super.key,
    required this.ticketStorageWM,
  });

  @override
  Widget build(BuildContext context) {
    return MultiListenerRebuilder(
      listenableList: [
        ticketStorageWM.isInitialization,
        ticketStorageWM.ticketList,
      ],
      builder: (_) {
        final isInitialization = ticketStorageWM.isInitialization.value!;
        final ticketList = ticketStorageWM.ticketList.value!;
        final ticketListIsEmpty = ticketList.isEmpty;
        final Widget child;
        if (isInitialization) {
          //? Инициализация данных
          child = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Чтение сохранённых билетов...",
                style: ticketStorageWM.bodyStyle,
              ),
              const SizedBox(height: 24.0),
              const LinearProgressIndicator(),
            ],
          );
        } else if (ticketListIsEmpty) {
          //? Список билетов пустой
          child = Center(
            child: Text(
              TicketsStrings.ticketListIsEmpty,
              style: ticketStorageWM.bodyStyle,
            ),
          );
        } else {
          //? Список билетов
          child = ListView.separated(
            itemCount: ticketList.length,
            itemBuilder: (context, index) {
              return TicketCard(
                ticket: ticketList[index],
                ticketStorageWM: ticketStorageWM,
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
          );
        }
        return AnimatedSwitcher(
          duration: Animations.mediumSpeed,
          switchInCurve: Animations.curve,
          switchOutCurve: Animations.curve,
          transitionBuilder: scaleTransitionBuilder,
          child: child,
        );
      },
    );
  }
}
