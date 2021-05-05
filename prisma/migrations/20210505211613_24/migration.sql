/*
  Warnings:

  - Added the required column `locationId` to the `social_events` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "social_events" ADD COLUMN     "locationId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "social_events" ADD FOREIGN KEY ("locationId") REFERENCES "location"("id") ON DELETE CASCADE ON UPDATE CASCADE;
