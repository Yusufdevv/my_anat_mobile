import 'package:jiffy/jiffy.dart';

abstract class MyFunctions {
  static String safeDateFormat(String date, String pattern){
    try{
      return Jiffy(date).format(pattern);
    }catch(e){
      print('$e date parse error');
      return date;
    }
  }


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

  static String getPublishedDate(String date) {
    if (Jiffy(date).isSame(DateTime.now(), Units.DAY)) {
      return 'Bugun, ${Jiffy(date).format('HH:mm')}';
    } else if (Jiffy(date).diff(DateTime.now(), Units.DAY) == 1 || Jiffy(date).diff(DateTime.now(), Units.DAY) == -1) {
      return 'Kecha, ${Jiffy(date).format('HH:mm')}';
    } else {
      return '${Jiffy(date).date} ${getMonth(Jiffy(date).month)}, ${Jiffy(date).year}';
    }
  }

  static String getMonth(int month) {
    switch (month) {
      case 1:
        return 'Yanvar';
      case 2:
        return 'Fevral';
      case 3:
        return 'Mart';
      case 4:
        return 'Aprel';
      case 5:
        return 'May';
      case 6:
        return 'Iyun';
      case 7:
        return 'Iyul';
      case 8:
        return 'Avgust';
      case 9:
        return 'Sentyabr';
      case 10:
        return 'Oktyabr';
      case 11:
        return 'Noyabr';
      case 12:
        return 'Dekabr';
      default:
        return '';
    }
  }

  static String getFormatCostFromInt(int price) {
    if (price == 0) {
      return '0 UZS';
    } else {
      final oldCost = StringBuffer(price.toString());
      final newCost = StringBuffer();

      for (var i = 0; i < oldCost.length; i++) {
        if ((oldCost.length - i) % 3 == 0 && i != 0) newCost.write(' ');
        newCost.write(oldCost.toString()[i]);
      }
      return '$newCost UZS';
    }
  }
}
