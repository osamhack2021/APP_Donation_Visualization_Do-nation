import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  BaseEntity,
} from "typeorm";
import { Target } from "./target";

@Entity()
export class Donation extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column("int")
  target_id: number;

  @Column({ length: 100 })
  donor_name: string;

  @Column()
  message: string;

  @Column()
  phone: string;

  @Column("int")
  pay_won: number;

  @Column()
  password: string;

  @ManyToOne(() => Target, (target) => target.donations)
  target: Target;
}
