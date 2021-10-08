import 'package:get/get_connect.dart';

const hostname = "https://997d-104-43-10-237.ngrok.io";
const apiPrefix = "api/v1";

class TargetProvider extends GetConnect {
  Future<Response> getAllTargets() => get("$hostname/$apiPrefix/targets");
}
