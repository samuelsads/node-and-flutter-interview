import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
class DateHelper {
  
  static String formatDate(DateTime date) {
    Intl.defaultLocale = 'es';
    String formattedDate = DateFormat('EEEE d MMMM yyyy', 'es').format(date);
    return formattedDate;
  }
}