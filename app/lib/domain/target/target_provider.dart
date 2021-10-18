import 'package:app/util/get_server_url.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

class TargetProvider extends GetConnect {
  // Future<Response> getAllTargets(bool isFinished) {
  //   return get(
  //     getAPIUrl("targets"),
  //     query: {'isFinished': isFinished.toString()},
  //   );
  // }

  Future<http.Response> getAllTargets(bool isFinished) {
    return http.get(Uri.parse(getAPIUrl("targets?isFinished=${isFinished}")));
  }
}
