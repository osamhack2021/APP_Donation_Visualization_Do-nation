import 'package:app/controller/dto/feedback_creation_dto.dart';
import 'package:app/controller/dto/feedback_delete_dto.dart';
import 'package:app/domain/feedback/feedback.dart';
import 'package:app/domain/feedback/feedback_repository.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  final FeedbackRepository _feedbackRepository = FeedbackRepository();
  final feedbacks = <Feedback>[].obs;

  Future<void> save(FeedbackCreationDTO dto) async {
    await _feedbackRepository.save(dto);
  }

  Future<List<Feedback>> findByTargetId(int targetId) async {
    List<Feedback> feedbacks =
        await _feedbackRepository.findByTargetId(targetId);
    this.feedbacks.value = feedbacks;
    return feedbacks;
  }

  Future<void> deleteFeedback(FeedbackDeleteDTO dto, int targetId) async {
    await _feedbackRepository.deleteFeedback(dto);
    await findByTargetId(targetId);
  }
}
