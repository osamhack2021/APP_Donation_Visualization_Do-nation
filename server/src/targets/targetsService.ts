import { Target } from "../entity/target";
import { TargetCreationDTO, TargetInfoDTO } from "./targetsDTO";

export class TargetsService {
  public async get(id: number): Promise<Target | undefined> {
    return await Target.findOne(id, { relations: ["donations"] });
  }
  public async getAll(): Promise<TargetInfoDTO[]> {
    const targets = await Target.find({ relations: ["donations"] });
    const targetInfos = targets.map((t) => ({
      id: 1,
      name: t.name,
      description: t.description,
      lat: t.lat,
      lng: t.lng,
      image_url: t.image_url,
      isFinished: t.isFinished,
      objective_won: t.objective_won,
      current_won: t.donations.reduce(
        (prev, current) => prev + current.pay_won,
        0
      ),
    }));
    return targetInfos;
  }

  public async create(targetCreationDTO: TargetCreationDTO): Promise<Target> {
    const defaultParams = { isFinished: false };
    const t = Target.create({ ...defaultParams, ...targetCreationDTO });
    await t.save();
    return t;
  }
}
