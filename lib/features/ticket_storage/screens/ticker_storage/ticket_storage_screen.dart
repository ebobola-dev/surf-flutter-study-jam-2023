import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/paddings.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/header.dart';

class TicketStorageScreen extends ElementaryWidget<TicketStorageWM> {
  const TicketStorageScreen({
    super.key,
    WidgetModelFactory wmFactory = createTicketStorageWM,
  }) : super(wmFactory);

  @override
  Widget build(ITicketStorageWM wm) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(ticketStorageWM: wm),
            ],
          ),
        ),
      ),
    );
  }
}
