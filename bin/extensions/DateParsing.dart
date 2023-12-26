import '../handle_exception/ParseDateException.dart';

extension DateParsing on String {
  bool isValidDateFormat() {
    RegExp dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    return dateRegex.hasMatch(this);
  }

  DateTime? parseToDate() {
    if (isValidDateFormat()) {
      try {
        return DateTime.parse(this);
      } catch (_) {
        return null;
      }
    } else {
      throw ParseDateException("Incorrect format yyyy-mm-dd. Please input as the format yyyy-mm-dd");
    }
  }
}
