import { Target } from "../entity/target";
import { TargetCreationDTO } from "./targetsDTO";

export class TargetsService {
  public async get(id: number): Promise<Target | undefined> {
    return await Target.findOne(id);
  }

  public async create(targetCreationDTO: TargetCreationDTO): Promise<Target> {
    const defaultParams = { isFinished: false };
    const t = Target.create({ ...defaultParams, ...targetCreationDTO });
    await t.save();
    return t;
  }
}
