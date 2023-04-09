import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_model.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_screen.dart';

TicketStorageWM createTicketStorageWM(BuildContext context) =>
    TicketStorageWM(TicketStorageModel());

class TicketStorageWM
    extends WidgetModel<TicketStorageScreen, TicketStorageModel>
    implements ITicketStorageWM {
  TicketStorageWM(super.model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  TextStyle get headerStyle => Theme.of(context).textTheme.titleMedium!;
}

abstract class ITicketStorageWM extends IWidgetModel {
  TextStyle get headerStyle;
}
