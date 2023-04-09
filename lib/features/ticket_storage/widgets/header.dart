import 'package:flutter/material.dart';
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
      ],
    );
  }
}
