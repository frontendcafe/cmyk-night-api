-- CreateEnum
CREATE TYPE "type" AS ENUM ('Online', 'Offline', 'Music', 'Sport', 'E-sports', 'Festival');

-- CreateTable
CREATE TABLE "event_type" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_DATE,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "events" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "performer" VARCHAR(255) NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "type" "type" NOT NULL,
    "banner_image" VARCHAR(255),
    "avatar_image" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_DATE,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "types" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_event" (
    "id" SERIAL NOT NULL,
    "event_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_DATE,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schedule" (
    "id" SERIAL NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "days" (
    "id" SERIAL NOT NULL,
    "day" TIMESTAMP(3) NOT NULL,
    "available" BOOLEAN NOT NULL,
    "scheduleId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "hours" (
    "id" SERIAL NOT NULL,
    "hours" TIMESTAMP(3) NOT NULL,
    "available" BOOLEAN NOT NULL,
    "scheduleId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_DATE,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "event_type.name_unique" ON "event_type"("name");

-- CreateIndex
CREATE UNIQUE INDEX "users.email_unique" ON "users"("email");

-- AddForeignKey
ALTER TABLE "user_event" ADD FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_event" ADD FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "days" ADD FOREIGN KEY ("scheduleId") REFERENCES "schedule"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "hours" ADD FOREIGN KEY ("scheduleId") REFERENCES "schedule"("id") ON DELETE SET NULL ON UPDATE CASCADE;
