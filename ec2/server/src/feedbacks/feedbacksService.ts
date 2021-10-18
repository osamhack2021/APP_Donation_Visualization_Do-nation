import { Feedback } from "../entity/feedback";
import {
  FeedbackCreationDTO,
  FeedbackDeleteDTO,
  FeedbackResponseDTO,
  getFeedbackResponseDTO,
} from "./feedbacksDTO";

export class FeedbacksService {
  public async getByTargetId(targetId: number): Promise<FeedbackResponseDTO[]> {
    const feedbacks = await Feedback.find({ where: { targetId } });
    return feedbacks.map((f) => getFeedbackResponseDTO(f));
  }

  public async create(
    feedbackCreationDTO: FeedbackCreationDTO
  ): Promise<Feedback> {
    const f = Feedback.create(feedbackCreationDTO);
    await f.save();
    return f;
  }

  public async delete(feedbackDeleteDTO: FeedbackDeleteDTO): Promise<void> {
    const { id, password } = feedbackDeleteDTO;
    const feedbackToDelete = await Feedback.findOne(id);
    if (feedbackToDelete?.password === password) {
      await feedbackToDelete.remove();
    }
  }
}
