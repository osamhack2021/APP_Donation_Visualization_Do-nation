import {
  Route,
  Controller,
  Get,
  Body,
  Path,
  Post,
  SuccessResponse,
  Query,
} from "tsoa";
import { Target } from "../entity/target";
import { TargetCreationDTO, TargetInfoDTO } from "./targetsDTO";
import { TargetsService } from "./targetsService";

@Route("targets")
export class TargetsController extends Controller {
  @Get()
  public async getAllTarget(
    @Query() isFinished: boolean | undefined
  ): Promise<TargetInfoDTO[]> {
    return new TargetsService().getAll(isFinished);
  }

  @Get("{targetId}")
  public async getTarget(@Path() targetId: number): Promise<Target> {
    const t = await new TargetsService().get(targetId);
    return t || new Target();
  }

  @SuccessResponse("201", "Created") // Custom success response
  @Post()
  public async createTarget(
    @Body() requestBody: TargetCreationDTO
  ): Promise<void> {
    this.setStatus(201); // set return status 201
    new TargetsService().create(requestBody);
    return;
  }
}
