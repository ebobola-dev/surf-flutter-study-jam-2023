import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/tickets.dart';
import 'package:surf_flutter_study_jam_2023/assets/themes/paddings.dart';
import 'package:surf_flutter_study_jam_2023/config/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/features/common/widgets/my_snackbar.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/downloading_status/downloading_status.dart';
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
  late final StateNotifier<bool> _isInitialization;
  late final StateNotifier<String?> _activeTicketCard;

  @override
  void initWidgetModel() {
    _ticketList = StateNotifier(initValue: model.ticketList);
    _isInitialization = StateNotifier(initValue: false);
    _activeTicketCard = StateNotifier();
    model.ticketDataChanged.listen(_ticketsDataChangedHandler);
    model.errorsOnDownloading.listen(_errorOnDownloadingHandler);
    _initialize();
    super.initWidgetModel();
  }

  //* Internal functions
  Future<void> _initialize() async {
    _isInitialization.accept(true);
    _ticketList.accept(await model.initialize());
    _isInitialization.accept(false);
  }

  void _ticketsDataChangedHandler(List<Ticket> newTicketList) {
    _ticketList.accept(newTicketList);
  }

  void _errorOnDownloadingHandler(String error) {
    MySnackBar.showError(context, error: error);
  }

  Widget _createIcon(String path, Color color) => SvgPicture.asset(
        path,
        key: ValueKey(path),
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      );

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
    if (_ticketList.value!.isEmpty) {
      MySnackBar.showWarning(
        context,
        message: TicketsStrings.ticketListIsEmpty,
      );
    }
    await model.deleteAllTickets();
  }

  @override
  Future<void> onTicketDownloadIconTap(Ticket ticket) async {
    if (ticket.isDownloading) {
      await model.cancelDownloading(ticket.url);
      return;
    }
    if (ticket.canDownload) {
      await model.downloadTicket(ticket.url);
    }
  }

  @override
  Future<void> onDownloadAllTap() async {
    if (_ticketList.value!.isEmpty) {
      MySnackBar.showWarning(
        context,
        message: TicketsStrings.ticketListIsEmpty,
      );
      return;
    }
    if (_ticketList.value!.where((ticket) => ticket.canDownload).isEmpty) {
      MySnackBar.showWarning(
        context,
        message: TicketsStrings.ticketListForDownloadingIsEmpty,
      );
    }
    await model.downloadAllTickets();
  }

  @override
  void onTicketCardTap(String ticketUrl) async {
    if (_activeTicketCard.value == ticketUrl) {
      _activeTicketCard.accept(null);
      return;
    }
    _activeTicketCard.accept(ticketUrl);
  }

  //* ------------- GETTERS -------------

  //* Ui styles
  @override
  TextStyle get headerStyle => Theme.of(context).textTheme.titleMedium!;

  @override
  TextStyle get bodyStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  TextStyle get ticketCardNameStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  TextStyle get ticketProgressStyle =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).primaryColor,
          );

  @override
  TextStyle get ticketMenuButtonStyle =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).primaryColor,
          );

  @override
  Color get primaryColor => Theme.of(context).colorScheme.primary;

  @override
  Color get disabledColor => Theme.of(context).dividerColor;

  @override
  Color get iconColor => Theme.of(context).colorScheme.secondary;

  @override
  Color get addTicketButtonIconColor =>
      Theme.of(context).colorScheme.background;

  @override
  double get maxProgressWidth =>
      getScreenSize(context).width - defaultPadding * 2 - 8.0 - 12.0 * 2;

  @override
  BorderRadius get ticketCardBorderRadius => BorderRadius.circular(7.5);

  @override
  BorderRadius get ticketMenuButtonBorderRadius => BorderRadius.circular(7.5);

  @override
  Map<DownloadingStatus, Widget> get ticketDownloadingIcons => {
        DownloadingStatus.notStarted: _createIcon(
          IconPaths.download,
          iconColor,
        ),
        DownloadingStatus.inProgress: _createIcon(
          IconPaths.crossCircle,
          Colors.red,
        ),
        DownloadingStatus.downloaded: _createIcon(
          IconPaths.downloaded,
          Colors.green,
        ),
        DownloadingStatus.hasError: _createIcon(
          IconPaths.download,
          iconColor,
        ),
      };

  //* States
  @override
  StateNotifier<bool> get isInitialization => _isInitialization;

  @override
  StateNotifier<List<Ticket>> get ticketList => _ticketList;

  @override
  StateNotifier<String?> get activeTicketCard => _activeTicketCard;
}

abstract class ITicketStorageWM extends IWidgetModel {
  //* Functions
  String getSizeAsString(int bytes);
  Future<void> onAddTicketTap();
  Future<void> onDownloadAllTap();
  Future<void> onDeleteAllTap();
  Future<void> onTicketDownloadIconTap(Ticket ticket);
  void onTicketCardTap(String ticketUrl);

  //* Ui styles
  TextStyle get headerStyle;
  TextStyle get bodyStyle;
  TextStyle get ticketCardNameStyle;
  TextStyle get ticketProgressStyle;
  TextStyle get ticketMenuButtonStyle;
  Color get iconColor;
  Color get disabledColor;
  Color get primaryColor;
  Color get addTicketButtonIconColor;
  double get maxProgressWidth;
  BorderRadius get ticketCardBorderRadius;
  BorderRadius get ticketMenuButtonBorderRadius;
  Map<DownloadingStatus, Widget> get ticketDownloadingIcons;

  //* States
  StateNotifier<bool> get isInitialization;
  StateNotifier<List<Ticket>> get ticketList;
  StateNotifier<String?> get activeTicketCard;
}
