import 'package:app/controller/dto/feedback_creation_dto.dart';
import 'package:app/controller/dto/feedback_delete_dto.dart';
import 'package:app/domain/feedback/feedback.dart';
import 'package:app/domain/feedback/feedback_provider.dart';
import 'package:app/util/convert_utf8.dart';
import 'package:http/http.dart' as http;

class FeedbackRepository {
  final FeedbackProvider _feedbackProvider = FeedbackProvider();

  Future<Feedback> save(FeedbackCreationDTO creationDTO) async {
    http.Response response = await _feedbackProvider.save(creationDTO.toJson());
    dynamic convertBody = convertUtf8ToObject(response);
    Feedback feedback = Feedback.fromJson(convertBody);
    return feedback;
  }

  Future<List<Feedback>> findByTargetId(int targetId) async {
    http.Response response = await _feedbackProvider.findByTargetId(targetId);
    List<dynamic> convertBody = convertUtf8ToObject(response);
    List<Feedback> feedbacks =
        convertBody.map((feedback) => Feedback.fromJson(feedback)).toList();
    return feedbacks;
  }

  Future<void> deleteFeedback(FeedbackDeleteDTO deleteDTO) async {
    http.Response response =
        await _feedbackProvider.deleteFeedback(deleteDTO.toJson());
  }
}
