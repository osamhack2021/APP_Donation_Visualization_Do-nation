import {
  Route,
  Controller,
  Get,
  Body,
  Path,
  Post,
  SuccessResponse,
} from "tsoa";
import { Target } from "./target";
import { TargetCreationParams, TargetsService } from "./targetsService";

@Route("targets")
export class TargetsController extends Controller {
  @Get("{targetId}")
  public async getUser(@Path() targetId: number): Promise<Target> {
    return new TargetsService().get(targetId);
  }

  @SuccessResponse("201", "Created") // Custom success response
  @Post()
  public async createTarget(
    @Body() requestBody: TargetCreationParams
  ): Promise<void> {
    this.setStatus(201); // set return status 201
    new TargetsService().create(requestBody);
    return;
  }
}
