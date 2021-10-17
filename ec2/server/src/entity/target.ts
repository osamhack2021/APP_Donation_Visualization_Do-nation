import {
  BaseEntity,
  Column,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Donation } from "./donation";
import { Feedback } from "./feedback";

@Entity()
export class Target extends BaseEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column("double")
  lat: number;

  @Column("double")
  lng: number;

  @Column({ type: "int" })
  objective_won: number;

  @Column()
  image_url: string;

  @Column({ length: 100 })
  name: string;

  @Column("text")
  description: string;

  @Column()
  isFinished: boolean;

  @OneToMany(() => Donation, (donation) => donation.target)
  donations: Donation[];

  @OneToMany(() => Feedback, (feedback) => feedback.target)
  feedbacks: Feedback[];
}
