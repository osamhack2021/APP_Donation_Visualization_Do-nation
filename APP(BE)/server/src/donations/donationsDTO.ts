import { Donation } from "../entity/donation";
export interface DonationCreationDTO {
  donor_name: string;
  message: string;
  phone: string;
  pay_won: number;
  password: string;
  targetId: number;
}

export interface DonationDeleteDTO {
  donor_name: string;
  phone: string;
  password: string;
  targetId: number;
}

export interface DonationResponseDTO {
  id: number;
  donor_name: string;
  message: string;
  pay_won: number;
  targetId: number;
  x1_coord: number;
  y1_coord: number;
  x2_coord: number;
  y2_coord: number;
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
    x1_coord,
    y1_coord,
    x2_coord,
    y2_coord,
  }: Donation) => ({
    id,
    donor_name,
    message,
    pay_won,
    targetId,
    x1_coord,
    y1_coord,
    x2_coord,
    y2_coord,
  });
  return unwrap(donation);
};
