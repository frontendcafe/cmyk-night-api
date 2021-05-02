/*
  Warnings:

  - You are about to drop the column `dayId` on the `location` table. All the data in the column will be lost.
  - You are about to drop the column `hourId` on the `location` table. All the data in the column will be lost.
  - You are about to drop the column `attentionHoursId` on the `location` table. All the data in the column will be lost.
  - You are about to drop the `AttentionHours` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "AttentionHours" DROP CONSTRAINT "AttentionHours_dayId_fkey";

-- DropForeignKey
ALTER TABLE "AttentionHours" DROP CONSTRAINT "AttentionHours_hourId_fkey";

-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_attentionHoursId_fkey";

-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_dayId_fkey";

-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_hourId_fkey";

-- AlterTable
ALTER TABLE "location" DROP COLUMN "dayId",
DROP COLUMN "hourId",
DROP COLUMN "attentionHoursId";

-- DropTable
DROP TABLE "AttentionHours";

-- CreateTable
CREATE TABLE "attention_hours" (
    "id" SERIAL NOT NULL,
    "dayId" INTEGER NOT NULL,
    "hourId" INTEGER NOT NULL,
    "location_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "attention_hours" ADD FOREIGN KEY ("dayId") REFERENCES "day"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attention_hours" ADD FOREIGN KEY ("hourId") REFERENCES "hour"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attention_hours" ADD FOREIGN KEY ("location_id") REFERENCES "location"("id") ON DELETE CASCADE ON UPDATE CASCADE;
