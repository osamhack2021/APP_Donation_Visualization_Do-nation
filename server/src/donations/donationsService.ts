import { Donation } from "../entity/donation";

export type DonationCreationParams = Omit<Donation, "id">;
export type DonationDTO = Omit<Donation, "password">;

export class DonationsService {
  public get(target_id: number): DonationDTO[] {
    return [
      {
        id: 1,
        target_id,
        donor_name: "minjun",
        message: "test donation",
        phone: "+82 10-0000-0000",
        pay_won: 5000,
      },
      {
        id: 2,
        target_id,
        donor_name: "hanwoo",
        message: "test donation2",
        phone: "+82 10-0000-0000",
        pay_won: 10000,
      },
      {
        id: 3,
        target_id,
        donor_name: "test",
        message: "test donation3",
        phone: "+82 10-0000-0000",
        pay_won: 15000,
      },
    ];
  }

  public create(donationCreationParams: DonationCreationParams): Donation {
    return {
      id: Math.floor(Math.random() * 10000), // Random
      ...donationCreationParams,
    };
  }
}
