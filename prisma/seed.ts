import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function main() {
  await prisma.users.createMany({
    data: [
      { email: "nicolas@gmail.com", age: 26, name: "Nicolas" },
      { email: "agustin@gmail.com", age: 27, name: "Agustin" },
      { email: "alejandro@gmail.com", age: 28, name: "Alejandro" },
      { email: "federico@gmail.com", age: 29, name: "Federico" },
      { email: "laura@gmail.com", age: 30, name: "Laura" },
      { email: "sofia@gmail.com", age: 31, name: "Sofia" },
      { email: "alejandra@gmail.com", age: 32, name: "Alejandra" },
      { email: "martin@gmail.com", age: 33, name: "Martin" },
    ],
  });
  await prisma.social_events.createMany({
    data: [
      {
        description: "Evento numero Uno",
        rating: 4.3,
        title: "Veni a disfrutar el lola",
        avatar_image: "sin foto",
        banner_image: "sin banner",
      },
      {
        description: "Evento numero Dos",
        rating: 4.3,
        title: "Veni a disfrutar el lola",
        type: "Music",
        avatar_image: "sin foto",
        banner_image: "sin banner",
      },
      {
        description: "Evento numero Tres",
        rating: 4.3,
        title: "Veni a disfrutar el lola",
        type: "Music",
        avatar_image: "sin foto",
        banner_image: "sin banner",
      },
    ],
  });
  await prisma.schedules.createMany({
    data: [
      {
        datetime: new Date("2021-04-25 10:00"),
      },
      {
        datetime: new Date("2021-04-25 12:00"),
      },
      {
        datetime: new Date("2021-04-26 18:30"),
      },
      {
        datetime: new Date("2021-04-26 19:30"),
      },
      {
        datetime: new Date("2021-04-26 23:30"),
      },
      {
        datetime: new Date("2021-04-27"),
      },
      {
        datetime: new Date("2021-04-28"),
      },
      {
        datetime: new Date("2021-04-29"),
      },
      {
        datetime: new Date("2021-04-30"),
      },
    ],
  });
  await prisma.social_event_schedule.createMany({
    data: [
      {
        remaining: 500,
        schedule_id: 1,
        social_event_id: 1,
      },
      {
        remaining: 400,
        schedule_id: 2,
        social_event_id: 1,
        enabled: false,
      },
    ],
  });
  await prisma.orders.createMany({
    data: [
      { price: 20.44, user_id: 1, social_event_schedule_id: 2, quantity: 2 },
      { price: 20.44, user_id: 2, social_event_schedule_id: 2, quantity: 8 },
      { price: 20.44, user_id: 3, social_event_schedule_id: 2, quantity: 1 },
    ],
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
