import { Target } from "../entity/target";

export type TargetCreationParams = Omit<Target, "id">;

export class TargetsService {
  public async get(id: number): Promise<Target | undefined> {
    return await Target.findOne(id);
  }

  public async create(
    TargetCreationParams: TargetCreationParams
  ): Promise<Target> {
    const t = Object.assign(new Target(), TargetCreationParams);
    await t.save();
    return t;
  }
}
