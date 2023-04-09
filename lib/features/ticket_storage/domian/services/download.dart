import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class DownloadService {
  final Dio _dio;
  const DownloadService(this._dio);

  //? Возращаем true, если успешно скачано, иначе false
  //? Тут тоже лучше сделать кастомные варианты результата выполенения функции, как в TicketRepository
  Future<bool> downloadFile({
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
      return true;
    } catch (e) {
      log(
        "Error on dowloading: $e",
        name: 'DownloadService | downloadFile',
      );
      return false;
    }
  }
}
