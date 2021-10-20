import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:intl/intl.dart';

String formatCurrency(int price, {String symbol = ""}) {
  final formatCurrency = NumberFormat.currency(
      locale: "ko_KR", name: "", decimalDigits: 0, symbol: symbol);
  return formatCurrency.format(price);
}

final krPhoneCode = CountryWithPhoneCode(
    phoneCode: '82',
    countryCode: 'KR',
    exampleNumberMobileNational: '010 1234 5678',
    exampleNumberFixedLineNational: '052 123 4567',
    phoneMaskMobileNational: '+00 000 0000 0000',
    phoneMaskFixedLineNational: '+00 000 000 0000',
    exampleNumberMobileInternational: '+82 10 1234 5678',
    exampleNumberFixedLineInternational: '+82 52 123 4567',
    phoneMaskMobileInternational: '+00 00 0000 0000',
    phoneMaskFixedLineInternational: '+00 00 000 0000',
    countryName: "REPUBLIC OF KOREA");
