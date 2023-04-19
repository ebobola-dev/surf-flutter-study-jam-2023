import 'package:elementary/elementary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';
import 'package:surf_flutter_study_jam_2023/features/common/widgets/scale_on_create.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/downloading_status/downloading_status.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_wm.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/widgets/ticket_card/downloading_progress.dart';
import 'package:surf_flutter_study_jam_2023/utils/animated_switcher_transition.dart';
import 'package:surf_flutter_study_jam_2023/utils/file_util.dart';

class TicketInfoDialog extends StatelessWidget {
  final String ticketUrl;
  final ITicketStorageWM ticketStorageWM;
  const TicketInfoDialog({
    Key? key,
    required this.ticketUrl,
    required this.ticketStorageWM,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dialogWidth = MediaQuery.of(context).size.width * .75;
    return StateNotifierBuilder(
      listenableState: ticketStorageWM.ticketList,
      builder: (context, ticketList) {
        final currentTicket =
            ticketList!.firstWhere((ticket) => ticket.url == ticketUrl);
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleOnCreate(
              child: SizedBox(
                width: dialogWidth,
                child: AlertDialog(
                  actionsAlignment: MainAxisAlignment.center,
                  contentPadding: const EdgeInsets.all(12.0),
                  titlePadding: const EdgeInsets.all(16.0),
                  actionsPadding: EdgeInsets.zero,
                  insetPadding: EdgeInsets.zero,
                  scrollable: true,
                  title: Text(
                    'Билет "${currentTicket.name}"',
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Ссылка на файл: ',
                              style: ticketStorageWM.bodyStyle,
                            ),
                            TextSpan(
                              text: currentTicket.url,
                              style: ticketStorageWM.bodyStyle.copyWith(
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Размер файла: ',
                              style: ticketStorageWM.bodyStyle,
                            ),
                            TextSpan(
                              text: FileUtil.getFileSizeString(
                                bytes: currentTicket.totalSize,
                                decimals: 1,
                              ),
                              style: ticketStorageWM.bodyStyle.copyWith(
                                color: ticketStorageWM.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Статус скачивания: ',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4.0),
                      AnimatedSwitcher(
                        duration: Animations.mediumSpeed,
                        switchInCurve: Animations.curve,
                        switchOutCurve: Animations.curve,
                        transitionBuilder: scaleTransitionBuilder,
                        child: Builder(
                          builder: (context) {
                            switch (currentTicket.downloadingStatus) {
                              case DownloadingStatus.notStarted:
                                return Text(
                                  "Скачивание ещё не начато",
                                  textAlign: TextAlign.center,
                                  style: ticketStorageWM.bodyStyle.copyWith(
                                    color: ticketStorageWM.primaryColor,
                                  ),
                                );
                              case DownloadingStatus.inProgress:
                                return TicketDownloadingProgress(
                                  ticket: currentTicket,
                                  ticketStorageWM: ticketStorageWM,
                                  maxLineWidth: dialogWidth - 12.0 * 2,
                                );
                              case DownloadingStatus.downloaded:
                                return Text(
                                  "Успешно скачано",
                                  textAlign: TextAlign.center,
                                  style: ticketStorageWM.bodyStyle.copyWith(
                                    color: Colors.green,
                                  ),
                                );
                              case DownloadingStatus.canceledByUser:
                                return Text(
                                  "Вы отменили скачивание",
                                  textAlign: TextAlign.center,
                                  style: ticketStorageWM.bodyStyle.copyWith(
                                    color: ticketStorageWM.primaryColor,
                                  ),
                                );
                              case DownloadingStatus.hasError:
                                return Text(
                                  "При скачивании произошка ошибка",
                                  textAlign: TextAlign.center,
                                  style: ticketStorageWM.bodyStyle.copyWith(
                                    color: Colors.red,
                                  ),
                                );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Закрыть".toUpperCase()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
