import 'package:intl/intl.dart';

class CardDateParser {
  static const _short = 'MM/yy';
  static const _long = 'MM/yyyy';

  DateTime? parse(String value) {
    const patterns = [_short, _long];

    for (final pattern in patterns) {
      try {
        final date = DateFormat(pattern).parse(value);
        return date.year < 1000 ? DateTime(DateTime.now().year ~/ 100 * 100 + date.year, date.month) : date;
      } catch (e) {
        continue;
      }
    }
    return null;
  }
}
