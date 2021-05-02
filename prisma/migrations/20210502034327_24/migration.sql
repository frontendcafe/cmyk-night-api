/*
  Warnings:

  - You are about to drop the column `day_id` on the `location` table. All the data in the column will be lost.
  - You are about to drop the column `hour_id` on the `location` table. All the data in the column will be lost.
  - You are about to drop the `_DayToLocation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_HourToLocation` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `attentionHoursId` to the `location` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_DayToLocation" DROP CONSTRAINT "_DayToLocation_A_fkey";

-- DropForeignKey
ALTER TABLE "_DayToLocation" DROP CONSTRAINT "_DayToLocation_B_fkey";

-- DropForeignKey
ALTER TABLE "_HourToLocation" DROP CONSTRAINT "_HourToLocation_A_fkey";

-- DropForeignKey
ALTER TABLE "_HourToLocation" DROP CONSTRAINT "_HourToLocation_B_fkey";

-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_day_id_fkey";

-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_hour_id_fkey";

-- AlterTable
ALTER TABLE "location" DROP COLUMN "day_id",
DROP COLUMN "hour_id",
ADD COLUMN     "dayId" INTEGER,
ADD COLUMN     "hourId" INTEGER,
ADD COLUMN     "attentionHoursId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_DayToLocation";

-- DropTable
DROP TABLE "_HourToLocation";

-- CreateTable
CREATE TABLE "AttentionHours" (
    "id" SERIAL NOT NULL,
    "dayId" INTEGER NOT NULL,
    "hourId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AttentionHours" ADD FOREIGN KEY ("dayId") REFERENCES "day"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttentionHours" ADD FOREIGN KEY ("hourId") REFERENCES "hour"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("attentionHoursId") REFERENCES "AttentionHours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("dayId") REFERENCES "day"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("hourId") REFERENCES "hour"("id") ON DELETE SET NULL ON UPDATE CASCADE;
