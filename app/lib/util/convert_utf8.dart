import 'dart:convert';
import 'package:http/http.dart' as http;

dynamic convertUtf8ToObject(http.Response response) {
  dynamic convertBody = jsonDecode(utf8.decode(response.bodyBytes));
  return convertBody;
}
