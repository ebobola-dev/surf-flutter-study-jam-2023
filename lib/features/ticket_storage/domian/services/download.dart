import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/download_result/download_result.dart';

class DownloadService {
  final Dio _dio;
  const DownloadService(this._dio);

  //? Возращаем true, если успешно скачано, иначе false
  //? Тут тоже лучше сделать кастомные варианты результата выполенения функции, как в TicketRepository
  Future<DownloadResult> downloadFile({
    required String url,
    required String savePath,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(
        url,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(responseType: ResponseType.bytes),
      );
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return SuccessfullyDownloaded();
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.cancel) {
          log(
            'Downoading canceled by user',
            name: 'DownloadService | downloadFile',
          );
          return CanceledByUser();
        }
        log(
          '',
          error: "Unexcepted Dio Error (${e.type})",
          name: 'DownloadService | downloadFile',
        );
        log(
          '',
          error: e,
          name: 'DownloadService | downloadFile',
        );
      } else {
        log(
          '',
          error: 'Unexcepted error on dowloading: $e',
          name: 'DownloadService | downloadFile',
        );
      }
      return FailedDownload(error: e.toString());
    }
  }
}
