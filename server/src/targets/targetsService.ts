import { Target } from "../entity/target";

export type TargetCreationParams = Omit<Target, "id">;

export class TargetsService {
  public get(id: number): Target {
    return {
      id,
      lat: 37.5,
      lng: 127,
      objective_won: 500000,
      image_url: "assets/test_img.jpg",
      name: "test target",
      description: "testtesttesttesttesttesttesttesttesttesttesttesttest",
    };
  }

  public create(userCreationParams: TargetCreationParams): Target {
    return {
      id: Math.floor(Math.random() * 10000), // Random
      ...userCreationParams,
    };
  }
}
