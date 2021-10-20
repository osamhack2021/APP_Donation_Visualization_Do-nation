import {
  Route,
  Controller,
  Get,
  Body,
  Path,
  Post,
  SuccessResponse,
  Delete,
  Query,
} from "tsoa";
import {
  DonationCreationDTO,
  DonationDeleteDTO,
  DonationResponseDTO,
} from "./donationsDTO";
import { DonationsService } from "./donationsService";

@Route("donations")
export class DonationsController extends Controller {
  @Get()
  public async getDonationsByTargetId(
    @Query() targetId: number
  ): Promise<DonationResponseDTO[]> {
    return new DonationsService().getByTargetId(targetId);
  }

  @Get("{id}")
  public async getDonationById(
    @Path() id: number
  ): Promise<DonationResponseDTO> {
    return new DonationsService().getById(id);
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
