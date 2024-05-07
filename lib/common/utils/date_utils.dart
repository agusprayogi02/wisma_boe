import 'package:intl/intl.dart';

class DateCommonUtils {
  static const String formatLang = 'id_ID';

  static Duration compareTime(String afterDate) {
    DateTime now = DateTime.now();
    DateTime after = DateTime.parse(afterDate);
    return now.difference(after);
  }

  static String formatDate(DateTime? dateTime) {
    if (dateTime == null) return '-';
    return DateFormat('dd MMM yyyy', formatLang).format(dateTime.toLocal());
  }

  static String formatNotification(DateTime param) {
    DateTime dateTime = param.toLocal();
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

    if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day) {
      return 'Hari ini';
    } else if (dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day) {
      return 'Kemarin';
    }
    return DateFormat('dd MMM yyyy', formatLang).format(dateTime.toLocal());
  }

  static DateTime fromString(String dateTime) {
    final split = dateTime.split('-');
    return DateTime(int.parse(split.last), int.parse(split[1]), int.parse(split.first));
  }

  static String timeSpent(DateTime startTime) {
    Duration duration = DateTime.now().difference(startTime.toLocal());
    return '${duration.inHours.abs()} jam ${(duration.inMinutes - (duration.inHours * 60)).abs()} menit';
  }

  static String timeSpentEnd(DateTime startTime) {
    Duration duration = DateTime.now().difference(startTime.toLocal());
    if (duration.inMinutes < 1) {
      return '${duration.inSeconds.abs()} detik yang lalu';
    }
    if (duration.inDays > 0) return '${duration.inDays.abs()} hari yang lalu';
    if (duration.inHours < 1) {
      return '${duration.inMinutes.abs()} menit yang lalu';
    }
    return '${duration.inHours.abs()} jam ${(duration.inMinutes - (duration.inHours * 60)).abs()} menit yang lalu';
  }

  static Duration timeSpentDuration(DateTime startTime) {
    return DateTime.now().difference(startTime.toLocal());
  }

  static Duration timeCountDown(DateTime endTime) {
    return endTime.toLocal().difference(DateTime.now());
  }
}
