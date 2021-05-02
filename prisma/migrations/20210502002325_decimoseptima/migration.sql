/*
  Warnings:

  - You are about to drop the `Artists` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Location` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Schedules` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_address_id_fkey";

-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_attention_hours_id_fkey";

-- DropForeignKey
ALTER TABLE "Location" DROP CONSTRAINT "Location_capacity_id_fkey";

-- DropForeignKey
ALTER TABLE "social_event_schedule" DROP CONSTRAINT "social_event_schedule_schedule_id_fkey";

-- DropForeignKey
ALTER TABLE "social_events" DROP CONSTRAINT "social_events_performer_id_fkey";

-- DropTable
DROP TABLE "Artists";

-- DropTable
DROP TABLE "Location";

-- DropTable
DROP TABLE "Schedules";

-- CreateTable
CREATE TABLE "artists" (
    "id" SERIAL NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schedules" (
    "id" SERIAL NOT NULL,
    "datetime" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "days" (
    "id" SERIAL NOT NULL,
    "index" INTEGER NOT NULL,
    "available" BOOLEAN NOT NULL DEFAULT false,
    "attention_hours_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "hours" (
    "id" SERIAL NOT NULL,
    "from" INTEGER NOT NULL,
    "to" INTEGER NOT NULL,
    "attention_hours_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attention_hours" (
    "id" SERIAL NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "location" (
    "id" SERIAL NOT NULL,
    "address_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "capacity_id" INTEGER NOT NULL,
    "attention_hours_id" INTEGER NOT NULL,
    "schedulesId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "artists.email_unique" ON "artists"("email");

-- AddForeignKey
ALTER TABLE "days" ADD FOREIGN KEY ("attention_hours_id") REFERENCES "attention_hours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "hours" ADD FOREIGN KEY ("attention_hours_id") REFERENCES "attention_hours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("address_id") REFERENCES "address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("capacity_id") REFERENCES "capacity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("attention_hours_id") REFERENCES "attention_hours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("schedulesId") REFERENCES "schedules"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "social_event_schedule" ADD FOREIGN KEY ("schedule_id") REFERENCES "schedules"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "social_events" ADD FOREIGN KEY ("performer_id") REFERENCES "artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;
