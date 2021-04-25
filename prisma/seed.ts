import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function main() {
  await prisma.artists.createMany({
    data: [
      {
        firstName: "Leopoldo",
        lastName: "Marechal",
        age: 112,
        email: "leopoldo.marechal@gmail.com",
      },
    ],
  });
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
  await prisma.socialEvents.createMany({
    data: [
      {
        performerId: 1,
        description: "Evento numero Uno",
        rating: 4.3,
        title: "Veni a disfrutar el lola",
        avatar: "sin foto",
        banner: "sin banner",
      },
      {
        performerId: 1,
        description: "Evento numero Dos",
        rating: 4.3,
        title: "Veni a disfrutar el lola",
        type: "Music",
        avatar: "sin foto",
        banner: "sin banner",
      },
      {
        performerId: 1,
        description: "Evento numero Tres",
        rating: 4.3,
        title: "Veni a disfrutar el lola",
        type: "Music",
        avatar: "sin foto",
        banner: "sin banner",
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
  await prisma.socialEventSchedule.createMany({
    data: [
      {
        remaining: 500,
        scheduleId: 1,
        socialEventId: 1,
        price: 100,
      },
      {
        remaining: 400,
        scheduleId: 2,
        socialEventId: 1,
        enabled: false,
        price: 120,
      },
    ],
  });
  await prisma.orders.createMany({
    data: [
      { price: 20.44, userId: 1, socialEventScheduleId: 2, quantity: 2 },
      { price: 20.44, userId: 2, socialEventScheduleId: 2, quantity: 8 },
      { price: 20.44, userId: 3, socialEventScheduleId: 2, quantity: 1 },
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
