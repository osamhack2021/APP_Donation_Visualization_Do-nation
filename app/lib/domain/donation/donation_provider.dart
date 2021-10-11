import 'package:app/util/get_server_url.dart';
import 'package:get/get_connect.dart';

class DonationProvider extends GetConnect {
  Future<Response> findByTargetId(int targetId) =>
      get(getAPIUrl("donations/$targetId"));
  Future<Response> save(Map data) {
    print(data);
    return post(getAPIUrl("donations/"), data);
  }
}
