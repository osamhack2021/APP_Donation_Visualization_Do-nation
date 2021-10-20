import {
  Route,
  Controller,
  Get,
  Body,
  Path,
  Post,
  SuccessResponse,
  Query,
  Response
} from "tsoa";
import { Target } from "../entity/target";
import { TargetCreationDTO, TargetInfoDTO } from "./targetsDTO";
import { TargetsService } from "./targetsService";

@Route("targets")
export class TargetsController extends Controller {
  @SuccessResponse("200")
  @Get()
  public async getAllTarget(
    @Query() isFinished?: boolean
  ): Promise<TargetInfoDTO[]> {
    const targets = await new TargetsService().getAll(isFinished);
    if(targets.length === 0){
      this.setStatus(204);
    } else{
      this.setStatus(200);
    }
    return targets;
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
