abstract class MyFunctions {
  static String getFormattedTimerTime(int ticks) {
    final buffer = StringBuffer();
    final minutes = (ticks / 60).floor();
    if (minutes < 10) {
      buffer.write('0');
    }
    buffer.write(minutes);
    buffer.write(':');
    final seconds = (ticks % 60).floor();
    if (seconds < 10) {
      buffer.write('0');
    }
    buffer.write(seconds);
    return buffer.toString();
  }

  static String formatBirthDate(DateTime? date) {
    return date != null
        ? '${date.day < 10 ? '0${date.day}' : date.day}.${date.month < 10 ? '0${date.month}' : date.month}.${date.year}'
        : '';
  }

  static String formatPhone(String phone) {
    return '${phone.substring(0, 4)} (${phone.substring(4, 6)}) ${phone.substring(6, 9)}-${phone.substring(9, 11)}-${phone.substring(11, 13)}';
  }
}
