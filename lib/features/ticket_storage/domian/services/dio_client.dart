import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/entities/download_result/download_result.dart';
import 'package:surf_flutter_study_jam_2023/utils/delays.dart';

class DioClient {
  final Dio _dio;
  const DioClient(this._dio);

  ///? Получить размер файла без скачивания
  Future<int?> getFileSize(String url) async {
    try {
      final response = await _dio.head(url);
      final strSize = response.headers["content-length"]?.first;
      if (strSize == null) {
        log(
          '',
          error: 'Unable to get size from url: ${url} (size is null)',
          name: 'DioClient | getFileSize',
        );
      }
      final size = int.tryParse(strSize!);
      if (size == null) {
        log(
          '',
          error:
              'Unable to get size from url: ${url} (size string is not number -> "${size}")',
          name: 'DioClient | getFileSize',
        );
      }

      ///? Фейковая задержка
      await DelayUtil.fakeDelay();
      return size;
    } catch (e) {
      if (e is DioError) {
        log(
          '',
          error: "Unexcepted Dio Error (${e.type})",
          name: 'DioClient | downloadFile',
        );
        log(
          '',
          error: e,
          name: 'DioClient | downloadFile',
        );
      } else {
        log(
          '',
          error: 'Unexcepted error on dowloading: $e',
          name: 'DioClient | downloadFile',
        );
      }
    }
    return null;
  }

  ///? Скачивание файла
  Future<DownloadResult> downloadFile({
    required String url,
    required String savePath,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
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
            name: 'DioClient | downloadFile',
          );
          return CanceledByUser();
        }
        log(
          '',
          error: "Unexcepted Dio Error (${e.type})",
          name: 'DioClient | downloadFile',
        );
        log(
          '',
          error: e,
          name: 'DioClient | downloadFile',
        );
      } else {
        log(
          '',
          error: 'Unexcepted error on dowloading: $e',
          name: 'DioClient | downloadFile',
        );
      }
      return FailedDownload(error: e.toString());
    }
  }
}
