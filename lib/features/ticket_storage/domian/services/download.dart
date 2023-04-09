import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class DownloadService {
  final Dio _dio;
  const DownloadService(this._dio);

  Future<void> downloadFile({
    required String url,
    required String savePath,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(
        url,
        onReceiveProgress: onReceiveProgress,
        options: Options(responseType: ResponseType.bytes),
      );
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      log(
        "Error on dowloading",
        name: 'DownloadService | downloadFile',
      );
    }
  }
}
