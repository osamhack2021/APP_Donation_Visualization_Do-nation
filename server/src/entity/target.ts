import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

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
}
