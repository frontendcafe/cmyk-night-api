/*
  Warnings:

  - Made the column `type` on table `social_events` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "social_events" ALTER COLUMN "type" SET NOT NULL;

-- CreateTable
CREATE TABLE "Location" (
    "id" SERIAL NOT NULL,
    "address_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "capacity_id" INTEGER NOT NULL,
    "attention_hours_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "capacity" (
    "id" SERIAL NOT NULL,
    "total" INTEGER NOT NULL,
    "min_quantity" INTEGER,
    "max_quantity" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address" (
    "id" SERIAL NOT NULL,
    "Formatted" VARCHAR(255) NOT NULL,
    "City" VARCHAR(120) NOT NULL,
    "State" CHAR(2) NOT NULL,
    "Country" CHAR(2) NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Location" ADD FOREIGN KEY ("address_id") REFERENCES "address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD FOREIGN KEY ("capacity_id") REFERENCES "capacity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Location" ADD FOREIGN KEY ("attention_hours_id") REFERENCES "Schedules"("id") ON DELETE CASCADE ON UPDATE CASCADE;
