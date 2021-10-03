import { Donation } from "../entity/donation";
import { DonationResponseDTO, getDonationResponseDTO } from "./donationsDTO";

export type DonationCreationParams = Omit<Donation, "id">;

export class DonationsService {
  public async get(targetId: number): Promise<DonationResponseDTO[]> {
    const donations = await Donation.find({ where: { targetId } });
    return donations.map((d) => getDonationResponseDTO(d));
  }

  public create(donationCreationParams: DonationCreationParams): Donation {
    return {
      id: Math.floor(Math.random() * 10000), // Random
      ...donationCreationParams,
    };
  }
}
