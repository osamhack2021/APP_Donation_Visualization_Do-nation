import {
  Route,
  Controller,
  Get,
  Body,
  Path,
  Post,
  SuccessResponse,
} from "tsoa";
import {
  DonationCreationParams,
  DonationDTO,
  DonationsService,
} from "./donationsService";

@Route("donations")
export class DonationsController extends Controller {
  @Get("{targetId}")
  public async getUser(@Path() targetId: number): Promise<DonationDTO[]> {
    return new DonationsService().get(targetId);
  }

  @SuccessResponse("201", "Created") // Custom success response
  @Post()
  public async createDonation(
    @Body() requestBody: DonationCreationParams
  ): Promise<void> {
    this.setStatus(201); // set return status 201
    new DonationsService().create(requestBody);
    return;
  }
}
