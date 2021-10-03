import { Donation } from "../entity/donation";

export interface DonationResponseDTO {
  id: number;
  donor_name: string;
  message: string;
  pay_won: number;
  targetId: number;
}

export const getDonationResponseDTO = (
  donation: Donation
): DonationResponseDTO => {
  const unwrap = ({
    id,
    donor_name,
    message,
    pay_won,
    targetId,
  }: Donation) => ({
    id,
    donor_name,
    message,
    pay_won,
    targetId,
  });
  return unwrap(donation);
};
