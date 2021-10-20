import 'package:app/util/get_server_url.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

class DonationProvider extends GetConnect {
  Future<http.Response> findByTargetId(int targetId) =>
      http.get(Uri.parse(getAPIUrl("donations?targetId=$targetId")));

  Future<http.Response> save(Map data) =>
      http.post(Uri.parse(getAPIUrl("donations")), body: data);

  Future<http.Response> deleteDonation(Map data) =>
      http.delete(Uri.parse(getAPIUrl("donations")), body: data);
}
