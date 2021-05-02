/*
  Warnings:

  - You are about to drop the column `schedulesId` on the `location` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "location" DROP CONSTRAINT "location_schedulesId_fkey";

-- AlterTable
ALTER TABLE "location" DROP COLUMN "schedulesId";
