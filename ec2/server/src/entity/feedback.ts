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
export class Feedback extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 100 })
  name: string;

  @Column()
  message: string;

  @Column()
  password: string;

  @Column({ nullable: true })
  image_url?: string;

  @Column({ type: "int" })
  targetId: number;

  @ManyToOne(() => Target, (target) => target.donations)
  @JoinColumn({ name: "targetId" })
  target: Target;
}
