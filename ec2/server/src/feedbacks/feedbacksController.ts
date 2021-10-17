import {
  Route,
  Controller,
  Get,
  Body,
  Post,
  SuccessResponse,
  Delete,
  Query,
} from "tsoa";
import {
  FeedbackCreationDTO,
  FeedbackDeleteDTO,
  FeedbackResponseDTO,
} from "./feedbacksDTO";
import { FeedbacksService } from "./feedbacksService";

@Route("feedbacks")
export class FeedbacksController extends Controller {
  @Get()
  public async getFeedbacksByTargetId(
    @Query() targetId: number
  ): Promise<FeedbackResponseDTO[]> {
    return new FeedbacksService().getByTargetId(targetId);
  }

  @SuccessResponse("201", "Created") // Custom success response
  @Post()
  public async createFeedback(
    @Body() requestBody: FeedbackCreationDTO
  ): Promise<void> {
    this.setStatus(201); // set return status 201
    new FeedbacksService().create(requestBody);
    return;
  }

  @SuccessResponse("200", "Deleted") // Custom success response
  @Delete()
  public async deleteFeedback(
    @Body() requestBody: FeedbackDeleteDTO
  ): Promise<void> {
    this.setStatus(200);
    await new FeedbacksService().delete(requestBody);
    return;
  }
}
