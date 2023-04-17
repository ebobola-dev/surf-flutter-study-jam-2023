import 'dart:io';
import 'dart:math' as math;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileUtil {
  static String getFilenameFromFilepath(String filepath) {
    File file = File(filepath);
    return basename(file.path);
  }

  static String getFilenameWithoutExt(String filepath) {
    File file = File(filepath);
    return basenameWithoutExtension(file.path);
  }

  static String getFileExtFromFilepath(String filepath) {
    File file = File(filepath);
    return extension(file.path);
  }

  static Future<bool> fileIsExists(String filepath) async {
    return await File(filepath).exists();
  }

  static Future<bool> dirIsExists(String dirpath) async {
    return await Directory(dirpath).exists();
  }

  static Future<void> createFolderInTemporaryDir(String dirname) async {
    final temproraryFolder = await getTemporaryDirectory();
    final folder = Directory("${temproraryFolder.path}/$dirname");
    if (!(await folder.exists())) {
      folder.create();
    }
  }

  //* Взято отсюда: https://stackoverflow.com/questions/74568656/how-to-convert-my-file-size-to-mb-kb-gb-etc-in-flutter
  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["б", "кб", "мб", "гб", "тб"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (math.log(bytes) / math.log(1024)).floor();
    return ((bytes / math.pow(1024, i)).toStringAsFixed(decimals)) +
        suffixes[i];
  }

  static Future<void> deleteFile(String filepath) async {
    final file = File(filepath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  //? Удаление папки
  static Future<void> deleteDirectory(String dirpath) async {
    final dir = Directory(dirpath);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }

  //? Удаление всех файлов в папке
  static Future<void> clearDirectory(String dirpath) async {
    final dir = Directory(dirpath);
    if (await dir.exists()) {
      dir.list(recursive: true).listen((sysEntity) async {
        if (sysEntity is File) await sysEntity.delete();
      });
    }
  }
}
