import {
  Route,
  Controller,
  Get,
  Body,
  Path,
  Post,
  SuccessResponse,
  Delete,
} from "tsoa";
import {
  DonationCreationDTO,
  DonationDeleteDTO,
  DonationResponseDTO,
} from "./donationsDTO";
import { DonationsService } from "./donationsService";

@Route("donations")
export class DonationsController extends Controller {
  @Get("{targetId}")
  public async getUser(
    @Path() targetId: number
  ): Promise<DonationResponseDTO[]> {
    return new DonationsService().get(targetId);
  }

  @SuccessResponse("201", "Created") // Custom success response
  @Post()
  public async createDonation(
    @Body() requestBody: DonationCreationDTO
  ): Promise<void> {
    this.setStatus(201); // set return status 201
    new DonationsService().create(requestBody);
    return;
  }

  @SuccessResponse("200", "Deleted") // Custom success response
  @Delete()
  public async deleteDonation(
    @Body() requestBody: DonationDeleteDTO
  ): Promise<void> {
    this.setStatus(200);
    await new DonationsService().delete(requestBody);
    return;
  }
}
