import { Feedback } from "../entity/feedback";

export interface FeedbackCreationDTO {
  name: string;
  message: string;
  password: string;
  image_url?: string;
  targetId: number;
}

export interface FeedbackDeleteDTO {
  id: number;
  password: string;
}

export interface FeedbackResponseDTO {
  id: number;
  name: string;
  message: string;
  image_url?: string;
  targetId: number;
}

export const getFeedbackResponseDTO = (
  feedback: Feedback
): FeedbackResponseDTO => {
  const unwrap = ({ id, name, message, targetId, image_url }: Feedback) => ({
    id,
    name,
    message,
    targetId,
    image_url,
  });
  return unwrap(feedback);
};
