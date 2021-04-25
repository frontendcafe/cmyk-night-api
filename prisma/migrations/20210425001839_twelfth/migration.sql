/*
  Warnings:

  - Added the required column `performer_id` to the `social_events` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "social_events" ADD COLUMN     "performer_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "social_events" ADD FOREIGN KEY ("performer_id") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;
