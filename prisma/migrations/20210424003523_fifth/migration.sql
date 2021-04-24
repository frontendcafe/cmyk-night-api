/*
  Warnings:

  - You are about to drop the column `type` on the `schedules` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "schedules" DROP COLUMN "type";

-- AlterTable
ALTER TABLE "social_events" ALTER COLUMN "type" DROP NOT NULL,
ALTER COLUMN "type" SET DEFAULT E'Online';
