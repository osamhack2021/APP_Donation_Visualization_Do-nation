import { Goal } from "../entity/goal";

export interface TargetCreationDTO {
  lat: number;
  lng: number;
  objective_won: number;
  image_url: string;
  name: string;
  description: string;
}

export interface TargetInfoDTO {
  id: number;
  lat: number;
  lng: number;
  objective_won: number;
  current_won: number;
  image_url: string;
  name: string;
  description: string;
  isFinished: boolean;
  goals: Goal[];
}
