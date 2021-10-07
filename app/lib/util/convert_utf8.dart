import 'dart:convert';

dynamic convertUtf8ToObjec(dynamic body) {
  String responseBody = jsonEncode(body);
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}
