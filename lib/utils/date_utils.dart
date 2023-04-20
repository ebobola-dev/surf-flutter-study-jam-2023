import 'package:intl/intl.dart';

class DateUtil {
  ///? Конвертирование даты в строку
  static String dateToString(DateTime date) => date.toIso8601String();

  ///? Конвертирование строки в дату
  static DateTime dateFromString(String strDate) => DateTime.parse(strDate);

  ///? Форматирование даты для отображения пользователю
  static String formatDate(DateTime date) =>
      DateFormat("dd.MM в HH:mm").format(date);
}
