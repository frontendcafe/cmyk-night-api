/*
  Warnings:

  - You are about to drop the `socialEvents` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "socialEventSchedule" DROP CONSTRAINT "socialEventSchedule_socialEventId_fkey";

-- DropTable
DROP TABLE "socialEvents";

-- CreateTable
CREATE TABLE "social_events" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "avatar_image" VARCHAR(255) NOT NULL,
    "banner_image" VARCHAR(255) NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "type" "type" DEFAULT E'Online',

    PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "socialEventSchedule" ADD FOREIGN KEY ("socialEventId") REFERENCES "social_events"("id") ON DELETE CASCADE ON UPDATE CASCADE;
