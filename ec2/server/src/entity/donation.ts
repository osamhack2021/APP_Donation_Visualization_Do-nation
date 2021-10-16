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
export class Donation extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

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

  @Column("float")
  x1_coord: number;
  @Column("float")
  y1_coord: number;

  @Column("float")
  x2_coord: number;
  @Column("float")
  y2_coord: number;

  @Column({ type: "int" })
  targetId: number;

  @ManyToOne(() => Target, (target) => target.donations)
  @JoinColumn({ name: "targetId" })
  target: Target;
}
