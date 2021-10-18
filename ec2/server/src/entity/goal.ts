import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  BaseEntity,
  JoinColumn,
} from "typeorm";
import { Target } from "./target";

@Entity()
export class Goal extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 100 })
  goal: string;

  @Column({ type: "int" })
  objective_won: number;

  @Column({ type: "int" })
  targetId: number;

  @ManyToOne(() => Target, (target) => target.donations)
  @JoinColumn({ name: "targetId" })
  target: Target;
}
