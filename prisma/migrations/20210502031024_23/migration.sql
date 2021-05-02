/*
  Warnings:

  - You are about to drop the column `locattion_attention_id` on the `location` table. All the data in the column will be lost.
  - You are about to drop the `AttentionDay` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AttentionHour` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_AttentionToDay` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_AttentionToHour` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `attention` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `location_attention` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `day_id` to the `location` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hour_id` to the `location` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "AttentionDay" DROP CONSTRAINT "AttentionDay_day_id_fkey";

-- DropForeignKey
ALTER TABLE "AttentionHour" DROP CONSTRAINT "AttentionHour_hour_id_fkey";

-- DropForeignKey
ALTER TABLE "_AttentionToDay" DROP CONSTRAINT "_AttentionToDay_A_fkey";

-- DropForeignKey
ALTER TABLE "_AttentionToDay" DROP CONSTRAINT "_AttentionToDay_B_fkey";

-- DropForeignKey
ALTER TABLE "_AttentionToHour" DROP CONSTRAINT "_AttentionToHour_A_fkey";

-- DropForeignKey
ALTER TABLE "_AttentionToHour" DROP CONSTRAINT "_AttentionToHour_B_fkey";

-- DropForeignKey
ALTER TABLE "attention" DROP CONSTRAINT "attention_day_id_fkey";

-- DropForeignKey
ALTER TABLE "attention" DROP CONSTRAINT "attention_hour_id_fkey";

-- DropForeignKey
ALTER TABLE "location_attention" DROP CONSTRAINT "location_attention_attetion_id_fkey";

-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_locattion_attention_id_fkey";

-- AlterTable
ALTER TABLE "location" DROP COLUMN "locattion_attention_id",
ADD COLUMN     "day_id" INTEGER NOT NULL,
ADD COLUMN     "hour_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "AttentionDay";

-- DropTable
DROP TABLE "AttentionHour";

-- DropTable
DROP TABLE "_AttentionToDay";

-- DropTable
DROP TABLE "_AttentionToHour";

-- DropTable
DROP TABLE "attention";

-- DropTable
DROP TABLE "location_attention";

-- CreateTable
CREATE TABLE "_DayToLocation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_HourToLocation" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_DayToLocation_AB_unique" ON "_DayToLocation"("A", "B");

-- CreateIndex
CREATE INDEX "_DayToLocation_B_index" ON "_DayToLocation"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_HourToLocation_AB_unique" ON "_HourToLocation"("A", "B");

-- CreateIndex
CREATE INDEX "_HourToLocation_B_index" ON "_HourToLocation"("B");

-- AddForeignKey
ALTER TABLE "_DayToLocation" ADD FOREIGN KEY ("A") REFERENCES "day"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DayToLocation" ADD FOREIGN KEY ("B") REFERENCES "location"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HourToLocation" ADD FOREIGN KEY ("A") REFERENCES "hour"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HourToLocation" ADD FOREIGN KEY ("B") REFERENCES "location"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("day_id") REFERENCES "day"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("hour_id") REFERENCES "hour"("id") ON DELETE CASCADE ON UPDATE CASCADE;
