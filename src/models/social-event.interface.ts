/**
  

model SocialEvents {
  id                  Int                   @id @default(autoincrement())
  title               String                @db.VarChar(255)
  description         String
  avatar              String                @map("avatar_image") @db.VarChar(255)
  banner              String                @map("banner_image") @db.VarChar(255)
  rating              Float
  type                type?                 @default(Online)
  socialEventSchedule SocialEventSchedule[]
  performer           Artists               @relation(fields: [performerId], references: [id])
  performerId         Int                   @map("performer_id")

  @@map("social_events")
}

model Artists {
  id           Int            @id @default(autoincrement())
  firstName    String         @map("first_name") @db.VarChar(255)
  lastName     String         @map("last_name") @db.VarChar(255)
  email        String         @unique @db.VarChar(255)
  age          Int
  SocialEvents SocialEvents[]
}

model Schedules {
  id                  Int                   @id @default(autoincrement())
  datetime            DateTime
  socialEventSchedule SocialEventSchedule[]
}

model SocialEventSchedule {
  id            Int          @id @default(autoincrement())
  socialEvent   SocialEvents @relation(fields: [socialEventId], references: [id])
  schedule      Schedules    @relation(fields: [scheduleId], references: [id])
  socialEventId Int          @map("social_event_id")
  scheduleId    Int          @map("schedule_id")
  remaining     Int
  enabled       Boolean      @default(true)
  price         Int
  orders        Orders[]

  @@map("social_event_schedule")
}

model Orders {
  id                    Int                 @id @default(autoincrement())
  user                  Users               @relation(fields: [userId], references: [id])
  userId                Int                 @map("user_id")
  socialEventSchedule   SocialEventSchedule @relation(fields: [socialEventScheduleId], references: [id])
  socialEventScheduleId Int                 @map("social_event_schedule_id")
  quantity              Int
  price                 Float
  createdAt             DateTime            @default(now()) @map("created_at")
  updatedAt             DateTime            @updatedAt @map("updated_at")

  @@map("orders")
}

model Users {
  id        Int      @id @default(autoincrement())
  email     String   @unique @db.VarChar(255)
  name      String   @db.VarChar(255)
  age       Int
  createdAt DateTime @default(now()) @map("created_at")
  updatedAt DateTime @updatedAt @map("updated_at")
  orders    Orders[]

  @@map("users")
}

enum type {
  Online
  Offline
  Music
  Sport
  E_sports  @map("E-sports")
  Festival
}

 */

export type SocialEventType =
  | "Online"
  | "Offline"
  | "Music"
  | "Sport"
  | "E-sports"
  | "Festival";

export interface BaseArtist {
  firstName: string;
  lastName: string;
  email: string;
  age: number;
}

export interface Artist extends BaseArtist {
  id: number;
}

export interface BaseSocialEvent {
  title: string;
  description: string;
  avatar: string;
  banner: string;
  rating: number;
  type: SocialEventType;
  performer: Artist;
}

export interface SocialEvent extends BaseSocialEvent {
  id: number;
}

export interface BaseSchedule {
  datetime: Date;
}
export interface Schedule extends BaseSchedule {
  id: number;
}

export interface BaseSocialEventSchedule {
  schedule: Schedule;
  social_event: SocialEvent;
  remaining: number;
  enabled: boolean;
  price: number;
}

export interface SocialEventSchedule extends BaseSocialEventSchedule {
  id: number;
}

export interface BaseUser {
  email: string;
  name: string;
  age: number;
  created_at: Date;
  updated_at: Date;
  orders: Order[];
}

export interface User extends BaseUser {
  id: number;
}

export interface BaseOrder {
  user: User;
  quantity: number;
  price: number;
  created_at: Date;
  updated_at: Date;
  social_event: SocialEvent;
}

export interface Order extends BaseOrder {
  id: number;
}
