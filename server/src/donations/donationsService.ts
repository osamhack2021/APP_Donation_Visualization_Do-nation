import { Donation } from "../entity/donation";
import {
  DonationCreationDTO,
  DonationDeleteDTO,
  DonationResponseDTO,
  getDonationResponseDTO,
} from "./donationsDTO";

export class DonationsService {
  public async getByTargetId(targetId: number): Promise<DonationResponseDTO[]> {
    const donations = await Donation.find({ where: { targetId } });
    return donations.map((d) => getDonationResponseDTO(d));
  }

  public async getById(id: number): Promise<DonationResponseDTO> {
    const donation = await Donation.findOneOrFail({ where: { id } });
    return getDonationResponseDTO(donation);
  }

  public async create(
    donationCreationDTO: DonationCreationDTO
  ): Promise<Donation> {
    const d = Donation.create(donationCreationDTO);
    await d.save();
    return d;
  }

  public async delete(donationDeleteDTO: DonationDeleteDTO): Promise<void> {
    const { password, ...deleteCondition } = donationDeleteDTO;
    const needDelete = await Donation.find({ where: deleteCondition });
    if (needDelete && needDelete[0].password === password) {
      await needDelete[0].remove();
    }
  }
}
