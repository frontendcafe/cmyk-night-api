/*
  Warnings:

  - You are about to drop the `days` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `event_type` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `events` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `hours` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `schedule` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `types` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_event` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "days" DROP CONSTRAINT "days_scheduleId_fkey";

-- DropForeignKey
ALTER TABLE "hours" DROP CONSTRAINT "hours_scheduleId_fkey";

-- DropForeignKey
ALTER TABLE "user_event" DROP CONSTRAINT "user_event_event_id_fkey";

-- DropForeignKey
ALTER TABLE "user_event" DROP CONSTRAINT "user_event_user_id_fkey";

-- DropTable
DROP TABLE "days";

-- DropTable
DROP TABLE "event_type";

-- DropTable
DROP TABLE "events";

-- DropTable
DROP TABLE "hours";

-- DropTable
DROP TABLE "schedule";

-- DropTable
DROP TABLE "types";

-- DropTable
DROP TABLE "user_event";

-- CreateTable
CREATE TABLE "social_events" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "avatar_image" VARCHAR(255) NOT NULL,
    "banner_image" VARCHAR(255) NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "type" "type" NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schedules" (
    "id" SERIAL NOT NULL,
    "datetime" TIMESTAMP(3) NOT NULL,
    "type" "type" NOT NULL DEFAULT E'Online',

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

-- CreateTable
CREATE TABLE "orders" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "social_event_schedule_id" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "social_event_schedule" ADD FOREIGN KEY ("social_event_id") REFERENCES "social_events"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "social_event_schedule" ADD FOREIGN KEY ("schedule_id") REFERENCES "schedules"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD FOREIGN KEY ("social_event_schedule_id") REFERENCES "social_event_schedule"("id") ON DELETE CASCADE ON UPDATE CASCADE;
