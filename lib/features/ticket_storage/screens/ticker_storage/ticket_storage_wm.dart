import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_study_jam_2023/assets/themes/paddings.dart';
import 'package:surf_flutter_study_jam_2023/features/common/widgets/my_snackbar.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/errors/added_ticket_error.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/ticket/ticket.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/repositories/ticket_repository.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/download.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_model.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_screen.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/add_ticket_dialog.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';
import 'package:surf_flutter_study_jam_2023/utils/screen_sizes.dart';

TicketStorageWM createTicketStorageWM(BuildContext context) =>
    TicketStorageWM(TicketStorageModel(
      ticketRepository: TicketRepository(context.read<DownloadService>()),
    ));

class TicketStorageWM
    extends WidgetModel<TicketStorageScreen, TicketStorageModel>
    implements ITicketStorageWM {
  TicketStorageWM(super.model);

  late final StateNotifier<List<Ticket>> _ticketList;

  @override
  void initWidgetModel() {
    _ticketList = StateNotifier(initValue: model.ticketList);
    model.ticketDataChanged.listen(_ticketsDataChangedHandler);
    model.errorsOnDownloading.listen(_errorOnDownloadingHandler);
    _initializeSavedTickets();
    super.initWidgetModel();
  }

  //* Internal functions
  Future<void> _initializeSavedTickets() async {
    _ticketList.accept(await model.initializeSavedTickets());
  }

  void _ticketsDataChangedHandler(List<Ticket> newTicketList) {
    _ticketList.accept(newTicketList);
  }

  void _errorOnDownloadingHandler(String error) {
    MySnackBar.showError(context, error: error);
  }

  //* Ui functions
  @override
  String getSizeAsString(
    int bytes, {
    int decimals = 1,
  }) =>
      FileUtil.getFileSizeString(
        bytes: bytes,
        decimals: decimals,
      );

  @override
  Future<void> onAddTicketTap() async {
    final newTicketUrl = await showDialog<String>(
      context: context,
      builder: (context) => const AddTicketDialog(),
    );
    if (newTicketUrl == null) return;
    try {
      final newTicketList = model.addTicket(newTicketUrl);
      _ticketList.accept(newTicketList);
      // ignore: use_build_context_synchronously
      MySnackBar.showSuccess(
        context,
        message: 'Билет "$newTicketUrl" успешно добавлен',
      );
    } on AddedTicketError catch (addedTicketError) {
      // ignore: use_build_context_synchronously
      MySnackBar.showError(
        context,
        error: addedTicketError.message,
      );
    }
  }

  @override
  Future<void> onDeleteAllTap() async {
    await model.deleteAllTickets();
  }

  @override
  Future<void> onDownloadTicketTap(String ticketUrl) async {
    await model.downloadTicket(ticketUrl);
  }

  @override
  Future<void> onDownloadAllTap() async {
    await Future.wait(model.ticketList.map(
      (ticket) => model.downloadTicket(ticket.url),
    ));
  }

  //* ------------- GETTERS -------------

  //* Ui styles
  @override
  TextStyle get headerStyle => Theme.of(context).textTheme.titleMedium!;

  @override
  TextStyle get emptyTicketListStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  TextStyle get ticketCardNameStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  TextStyle get ticketProgressStyle =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).primaryColor,
          );

  @override
  Color get addTicketButtonIconColor =>
      Theme.of(context).colorScheme.background;

  @override
  Color get iconColor => Theme.of(context).colorScheme.secondary;

  @override
  Color get ticketCardDownloadingIconColor => Colors.blue;

  @override
  Color get ticketCardDownloadedIconColor => Colors.green;

  @override
  double get ticketCardWidth =>
      getScreenSize(context).width - defaultPadding * 2 - 8.0;

  @override
  BorderRadius get ticketCardBorderRadius => BorderRadius.circular(7.5);

  //* States
  @override
  StateNotifier<List<Ticket>> get ticketList => _ticketList;
}

abstract class ITicketStorageWM extends IWidgetModel {
  //* Functions
  String getSizeAsString(int bytes);
  Future<void> onAddTicketTap();
  Future<void> onDownloadTicketTap(String ticketUrl);
  Future<void> onDownloadAllTap();
  Future<void> onDeleteAllTap();

  //* Ui styles
  TextStyle get headerStyle;
  TextStyle get emptyTicketListStyle;
  TextStyle get ticketCardNameStyle;
  TextStyle get ticketProgressStyle;
  Color get addTicketButtonIconColor;
  Color get iconColor;
  Color get ticketCardDownloadingIconColor;
  Color get ticketCardDownloadedIconColor;
  double get ticketCardWidth;
  BorderRadius get ticketCardBorderRadius;

  //* States
  StateNotifier<List<Ticket>> get ticketList;
}
