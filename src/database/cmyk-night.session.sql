--DROP TABLE tickets;
DROP TABLE user_event;
DROP TABLE users;
DROP TABLE events;
CREATE TABLE "users"(
    "id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "created_at" DATE DEFAULT CURRENT_DATE,
    "updated_at" DATE DEFAULT CURRENT_DATE
);
ALTER TABLE "users"
ADD PRIMARY KEY("id");
ALTER TABLE "users"
ADD CONSTRAINT "users_email_unique" UNIQUE("email");
CREATE TABLE "events"(
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "performer" VARCHAR(255) NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "type" VARCHAR(255) CHECK ("type" IN('')) NOT NULL,
    "banner_image" VARCHAR(255) NULL,
    "avatar_image" VARCHAR(255) NOT NULL,
    "created_at" DATE DEFAULT CURRENT_DATE,
    "updated_at" DATE DEFAULT CURRENT_DATE
);
ALTER TABLE "events"
ADD PRIMARY KEY("id");
CREATE TABLE "user_event"(
    "id" SERIAL NOT NULL,
    "event_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" DATE DEFAULT CURRENT_DATE,
    "updated_at" DATE DEFAULT CURRENT_DATE
);
ALTER TABLE "user_event"
ADD PRIMARY KEY("id");
ALTER TABLE "user_event"
ADD CONSTRAINT "user_event_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE "user_event"
ADD CONSTRAINT "user_event_event_id_foreign" FOREIGN KEY("event_id") REFERENCES "events"("id");