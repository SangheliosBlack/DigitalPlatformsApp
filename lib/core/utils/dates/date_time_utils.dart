import 'package:intl/intl.dart';

class DateTimeUtils {
  /// Configura la localización para español
  static void initialize() {
    Intl.defaultLocale = 'es_ES';
  }

  /// Formato: `05 marzo 2025`
  static String formatFullDate(DateTime date) {
    return DateFormat('dd MMMM yyyy', 'es_ES').format(date.toLocal());
  }

  /// Formato: `05/03/2025`
  static String formatShortDate(DateTime date) {
    return DateFormat('dd/MM/yyyy', 'es_ES').format(date.toLocal());
  }

  /// Formato: `05 marzo 2025, 18:45`
  static String formatDateWithTime(DateTime date) {
    return DateFormat('dd MMMM yyyy, HH:mm', 'es_ES').format(date.toLocal());
  }

  /// Formato: `miércoles, 5 de marzo de 2025`
  static String formatCompleteDate(DateTime date) {
    return DateFormat("EEEE, d 'de' MMMM 'de' yyyy", 'es_ES').format(date.toLocal());
  }

  /// Formato ISO 8601 con hora local `2025-03-05T18:45:30`
  static String formatISO(DateTime date) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(date.toLocal());
  }
}
