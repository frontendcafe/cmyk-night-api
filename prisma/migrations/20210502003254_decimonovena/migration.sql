/*
  Warnings:

  - You are about to drop the column `locationId` on the `attention_hours` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "attention_hours" DROP CONSTRAINT "attention_hours_locationId_fkey";

-- AlterTable
ALTER TABLE "attention_hours" DROP COLUMN "locationId",
ADD COLUMN     "location_id" INTEGER;

-- AddForeignKey
ALTER TABLE "attention_hours" ADD FOREIGN KEY ("location_id") REFERENCES "location"("id") ON DELETE SET NULL ON UPDATE CASCADE;
