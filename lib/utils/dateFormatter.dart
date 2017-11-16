

import 'package:intl/intl.dart';

/*
This is to manage the potentially unstable Intl library..
 */
class DateFormatter {
  static String formatUS(int year, int month, int day) {

    Intl intl = new Intl();
    DateFormat format = intl.date('MM/dd/yyyy');
    String text = format.format(new DateTime(year, month, day));
    return text;
  }
}