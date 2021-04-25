/*
  Warnings:

  - Added the required column `price` to the `social_event_schedule` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "social_event_schedule" ADD COLUMN     "price" INTEGER NOT NULL;
