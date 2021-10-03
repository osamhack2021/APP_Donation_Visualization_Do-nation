import {
  Route,
  Controller,
  Get,
  Body,
  Path,
  Post,
  SuccessResponse,
} from "tsoa";
import { Target } from "../entity/target";
import { TargetsService, TargetCreationParams } from "./targetsService";

@Route("targets")
export class TargetsController extends Controller {
  @Get("{targetId}")
  public async getTarget(@Path() targetId: number): Promise<Target> {
    const t = await new TargetsService().get(targetId);
    return t || new Target();
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
