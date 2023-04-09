import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_model.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_screen.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/add_ticket_dialog.dart';

TicketStorageWM createTicketStorageWM(BuildContext context) =>
    TicketStorageWM(TicketStorageModel());

class TicketStorageWM
    extends WidgetModel<TicketStorageScreen, TicketStorageModel>
    implements ITicketStorageWM {
  TicketStorageWM(super.model);

  late final StateNotifier<List<Ticket>> _ticketList;

  @override
  void initWidgetModel() {
    _ticketList = StateNotifier(initValue: model.ticketList);
    super.initWidgetModel();
  }

  //* Internal functions

  //* Ui functions
  @override
  Future<void> onAddTicketTap() async {
    final addResult = await showDialog<String>(
      context: context,
      builder: (context) => const AddTicketDialog(),
    );
  }

  //* ------------- GETTERS -------------

  //* Ui styles
  @override
  TextStyle get headerStyle => Theme.of(context).textTheme.titleMedium!;

  @override
  TextStyle get emptyTicketListStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  Color get addTicketButtonIconColor =>
      Theme.of(context).colorScheme.background;

  //* States
  @override
  StateNotifier<List<Ticket>> get ticketList => _ticketList;
}

abstract class ITicketStorageWM extends IWidgetModel {
  //* Functions
  Future<void> onAddTicketTap();

  //* Ui styles
  TextStyle get headerStyle;
  TextStyle get emptyTicketListStyle;
  Color get addTicketButtonIconColor;

  //* States
  StateNotifier<List<Ticket>> get ticketList;
}
