import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    final formaterNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(number);
    return formaterNumber;
  }

  static String date() {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.EEEE('es').add_d();
    final String day = dateFormat.format(DateTime.now());
    final formaterDay = '${day[0].toUpperCase()}${day.substring(1)}';

    return formaterDay;
  }
}
