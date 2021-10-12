import 'package:intl/intl.dart';

String formatCurrency(int price, {String symbol = ""}) {
  final formatCurrency = NumberFormat.currency(
      locale: "ko_KR", name: "", decimalDigits: 0, symbol: symbol);
  return formatCurrency.format(price);
}
