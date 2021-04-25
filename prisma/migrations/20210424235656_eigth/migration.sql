/*
  Warnings:

  - You are about to drop the column `user_id` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `social_event_schedule_id` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `created` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `social_event_schedule` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `social_events` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `userId` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `socialEventScheduleId` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "social_event_schedule" DROP CONSTRAINT "social_event_schedule_schedule_id_fkey";

-- DropForeignKey
ALTER TABLE "social_event_schedule" DROP CONSTRAINT "social_event_schedule_social_event_id_fkey";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_social_event_schedule_id_fkey";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_user_id_fkey";

-- AlterTable
ALTER TABLE "orders" DROP COLUMN "user_id",
DROP COLUMN "social_event_schedule_id",
DROP COLUMN "created",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD COLUMN     "socialEventScheduleId" INTEGER NOT NULL,
ADD COLUMN     "created_At" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "users" DROP COLUMN "created_at",
DROP COLUMN "updated_at",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "social_event_schedule";

-- DropTable
DROP TABLE "social_events";

-- CreateTable
CREATE TABLE "socialEvents" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "avatar" VARCHAR(255) NOT NULL,
    "banner" VARCHAR(255) NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "type" "type" DEFAULT E'Online',

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "artist" (
    "id" SERIAL NOT NULL,
    "firstName" VARCHAR(255) NOT NULL,
    "lastName" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "socialEventSchedule" (
    "id" SERIAL NOT NULL,
    "socialEventId" INTEGER NOT NULL,
    "scheduleId" INTEGER NOT NULL,
    "remaining" INTEGER NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "artist.email_unique" ON "artist"("email");

-- AddForeignKey
ALTER TABLE "socialEventSchedule" ADD FOREIGN KEY ("socialEventId") REFERENCES "socialEvents"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "socialEventSchedule" ADD FOREIGN KEY ("scheduleId") REFERENCES "schedules"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD FOREIGN KEY ("socialEventScheduleId") REFERENCES "socialEventSchedule"("id") ON DELETE CASCADE ON UPDATE CASCADE;
