import 'package:get/get_connect.dart';

const hostname = "https://2c48-52-187-32-145.ngrok.io";
const apiPrefix = "api/v1";

class TargetProvider extends GetConnect {
  Future<Response> getAllTargets() => get("$hostname/$apiPrefix/targets");
}
