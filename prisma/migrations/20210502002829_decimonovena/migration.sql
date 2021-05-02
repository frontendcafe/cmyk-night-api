/*
  Warnings:

  - You are about to drop the column `attention_hours_id` on the `location` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_attention_hours_id_fkey";

-- AlterTable
ALTER TABLE "attention_hours" ADD COLUMN     "locationId" INTEGER;

-- AlterTable
ALTER TABLE "location" DROP COLUMN "attention_hours_id";

-- AddForeignKey
ALTER TABLE "attention_hours" ADD FOREIGN KEY ("locationId") REFERENCES "location"("id") ON DELETE SET NULL ON UPDATE CASCADE;
