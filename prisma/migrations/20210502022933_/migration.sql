/*
  Warnings:

  - You are about to drop the `attention_hours` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `days` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `hours` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `attention_id` to the `location` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "attention_hours" DROP CONSTRAINT "attention_hours_location_id_fkey";

-- DropForeignKey
ALTER TABLE "days" DROP CONSTRAINT "days_attention_hours_id_fkey";

-- DropForeignKey
ALTER TABLE "hours" DROP CONSTRAINT "hours_attention_hours_id_fkey";

-- AlterTable
ALTER TABLE "location" ADD COLUMN     "attention_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "attention_hours";

-- DropTable
DROP TABLE "days";

-- DropTable
DROP TABLE "hours";

-- CreateTable
CREATE TABLE "day" (
    "id" SERIAL NOT NULL,
    "index" INTEGER NOT NULL,
    "available" BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "hour" (
    "id" SERIAL NOT NULL,
    "from" INTEGER NOT NULL,
    "to" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttentionDay" (
    "id" SERIAL NOT NULL,
    "attention_id" INTEGER NOT NULL,
    "day_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttentionHour" (
    "id" SERIAL NOT NULL,
    "attention_id" INTEGER NOT NULL,
    "hour_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attention" (
    "id" SERIAL NOT NULL,
    "day_id" INTEGER NOT NULL,
    "hour_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AttentionDay" ADD FOREIGN KEY ("attention_id") REFERENCES "attention"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttentionDay" ADD FOREIGN KEY ("day_id") REFERENCES "day"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttentionHour" ADD FOREIGN KEY ("attention_id") REFERENCES "attention"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AttentionHour" ADD FOREIGN KEY ("hour_id") REFERENCES "hour"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attention" ADD FOREIGN KEY ("day_id") REFERENCES "day"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attention" ADD FOREIGN KEY ("hour_id") REFERENCES "hour"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD FOREIGN KEY ("attention_id") REFERENCES "attention"("id") ON DELETE CASCADE ON UPDATE CASCADE;
