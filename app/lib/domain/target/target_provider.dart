import 'package:app/util/get_server_url.dart';
import 'package:get/get_connect.dart';

class TargetProvider extends GetConnect {
  Future<Response> getAllTargets(bool isFinished) {
    return get(
      getAPIUrl("targets"),
      query: {'isFinished': isFinished.toString()},
    );
  }
}
