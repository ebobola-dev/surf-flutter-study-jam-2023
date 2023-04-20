import 'package:intl/intl.dart';

class DateUtil {
  ///? Конвертирование даты в строку
  static String dateToString(DateTime date) => date.toIso8601String();

  ///? Конвертирование строки в дату
  static DateTime dateFromString(String strDate) => DateTime.parse(strDate);

  ///? Форматирование даты для отображения пользователю
  static String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final messageDay = DateTime(date.year, date.month, date.day);
    if (messageDay == yesterday) {
      return 'Вчера в ${DateFormat.Hm().format(date)}';
    }
    if (messageDay == today) {
      return DateFormat('в HH:mm').format(date);
    }
    if (date.year != now.year) {
      return DateFormat('dd.MM.yyyy в HH:mm').format(date);
    }
    return DateFormat('dd.MM в HH:mm').format(date);
  }
}
