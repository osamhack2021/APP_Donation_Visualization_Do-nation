import 'package:app/util/get_server_url.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

class FeedbackProvider extends GetConnect {
  Future<http.Response> findByTargetId(int targetId) =>
      http.get(Uri.parse(getAPIUrl("feedbacks?targetId=$targetId")));

  Future<http.Response> save(Map data) =>
      http.post(Uri.parse(getAPIUrl("feedbacks")), body: data);

  Future<http.Response> deleteFeedback(Map data) =>
      http.delete(Uri.parse(getAPIUrl("feedbacks")), body: data);
}
