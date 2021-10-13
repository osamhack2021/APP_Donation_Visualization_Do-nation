import 'package:app/util/get_server_url.dart';
import 'package:get/get_connect.dart';

class DonationProvider extends GetConnect {
  Future<Response> findByTargetId(int targetId) =>
      get(getAPIUrl("donations?targetId=$targetId"));

  Future<Response> save(Map data) => post(getAPIUrl("donations/"), data);

  Future<Response> deleteDonation(Map data) =>
      request(getAPIUrl("donations/"), 'DELETE', body: data);
}
