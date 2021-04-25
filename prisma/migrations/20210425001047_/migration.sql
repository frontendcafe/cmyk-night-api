/*
  Warnings:

  - You are about to drop the column `userId` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `socialEventScheduleId` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `artist` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `schedules` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `socialEventSchedule` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `user_id` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `social_event_schedule_id` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "socialEventSchedule" DROP CONSTRAINT "socialEventSchedule_scheduleId_fkey";

-- DropForeignKey
ALTER TABLE "socialEventSchedule" DROP CONSTRAINT "socialEventSchedule_socialEventId_fkey";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_socialEventScheduleId_fkey";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_userId_fkey";

-- AlterTable
ALTER TABLE "orders" DROP COLUMN "userId",
DROP COLUMN "socialEventScheduleId",
DROP COLUMN "updatedAt",
DROP COLUMN "createdAt",
ADD COLUMN     "user_id" INTEGER NOT NULL,
ADD COLUMN     "social_event_schedule_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "users" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "artist";

-- DropTable
DROP TABLE "schedules";

-- DropTable
DROP TABLE "socialEventSchedule";

-- CreateTable
CREATE TABLE "Artists" (
    "id" SERIAL NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Schedules" (
    "id" SERIAL NOT NULL,
    "datetime" TIMESTAMP(3) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "social_event_schedule" (
    "id" SERIAL NOT NULL,
    "social_event_id" INTEGER NOT NULL,
    "schedule_id" INTEGER NOT NULL,
    "remaining" INTEGER NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Artists.email_unique" ON "Artists"("email");

-- AddForeignKey
ALTER TABLE "social_event_schedule" ADD FOREIGN KEY ("social_event_id") REFERENCES "social_events"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "social_event_schedule" ADD FOREIGN KEY ("schedule_id") REFERENCES "Schedules"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD FOREIGN KEY ("social_event_schedule_id") REFERENCES "social_event_schedule"("id") ON DELETE CASCADE ON UPDATE CASCADE;
