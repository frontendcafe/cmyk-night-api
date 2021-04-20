--@block
DROP TABLE user_event;
--@block
DROP TABLE users;
--@block
DROP TABLE events;
--@block
CREATE TABLE "users"(
    "id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_DATE
);
--@block
ALTER TABLE "users"
ADD PRIMARY KEY("id");
--@block
ALTER TABLE "users"
ADD CONSTRAINT "users_email_unique" UNIQUE("email");
--@block
CREATE TABLE "events"(
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "performer" VARCHAR(255) NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "banner_image" VARCHAR(255) NULL,
    "avatar_image" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_DATE
);
--@block
ALTER TABLE "events"
ADD PRIMARY KEY("id");
--@block
CREATE TABLE "user_event"(
    "id" SERIAL NOT NULL,
    "event_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" TIMESTAMP NOT NULL DEFAULT CURRENT_DATE
);
--@block
ALTER TABLE "user_event"
ADD PRIMARY KEY("id");
--@block
ALTER TABLE "user_event"
ADD CONSTRAINT "user_event_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
--@block
ALTER TABLE "user_event"
ADD CONSTRAINT "user_event_event_id_foreign" FOREIGN KEY("event_id") REFERENCES "events"("id");