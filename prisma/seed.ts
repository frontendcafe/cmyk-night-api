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
      {
        firstName: "Norberto Aníbal",
        lastName: "Napolitano",
        age: 71,
        email: "pappo.blues@gmail.com",
      },
      {
        firstName: "Luis Alberto",
        lastName: "Spinetta",
        age: 71,
        email: "spinneta.skinny@gmail.com",
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
        description:
          "Interpretacióon de los mayores exitos de Leopoldo Marechal. Interpretaciones unicas de un artista espectacular.",
        rating: 4.6,
        title: "Leopoldo Lives For Ever",
        avatar:
          "https://upload.wikimedia.org/wikipedia/commons/0/0a/LeopoldoMarechal.jpg",
        banner:
          "https://www.freepik.es/vector-gratis/diseno-vinilo-cartel-festival-musica_9057680.htm",
        type: "Online",
      },
      {
        performerId: 2,
        description:
          "En vivo, en directo, transmitiendo desde el cementerio de La Chacarita. ¡El grande de grandes, Pappo Napolitano!",
        rating: 4.3,
        title: "Pappo Blues",
        type: "Online",
        avatar: "https://upload.wikimedia.org/wikipedia/commons/4/40/Pappo.jpg",
        banner:
          "https://www.freepik.es/vector-gratis/fondo-acordes-musicales-elegantes-notas-musicales_5504160.htm",
      },
      {
        performerId: 3,
        description:
          "¡No esperes a estirar la pata para escuchar los mejores exitos de la música argentina!",
        rating: 4.3,
        title: "Concierto en vivo de los mejores exitos de Spinetta Jade",
        type: "Offline",
        avatar:
          "https://upload.wikimedia.org/wikipedia/commons/1/12/Luis_Alberto_Spinetta_en_1976.jpg",
        banner:
          "https://www.freepik.es/vector-gratis/plantilla-volante-festival-musica_13642140.htm",
      },
      {
        performerId: 3,
        description:
          "¡No esperes a estirar la pata para escuchar los mejores exitos de la música argentina!",
        rating: 4.3,
        title: "Concierto en vivo de los mejores exitos de Spinetta Jade",
        type: "Online",
        avatar:
          "https://upload.wikimedia.org/wikipedia/commons/1/12/Luis_Alberto_Spinetta_en_1976.jpg",
        banner:
          "https://www.freepik.es/vector-gratis/plantilla-volante-festival-musica_13642140.htm",
      },
    ],
  });
  await prisma.schedules.createMany({
    data: [
      {
        datetime: new Date("2021-05-29 10:00"),
      },
      {
        datetime: new Date("2021-05-29 12:00"),
      },
      {
        datetime: new Date("2021-05-30 18:30"),
      },
      {
        datetime: new Date("2021-05-30 19:30"),
      },
      {
        datetime: new Date("2021-05-30 23:30"),
      },
      {
        datetime: new Date("2021-05-30 00:30"),
      },
      {
        datetime: new Date("2021-06-01 2:30"),
      },
      {
        datetime: new Date("2021-06-01 22:30"),
      },
    ],
  });
  await prisma.socialEventSchedule.createMany({
    data: [
      {
        remaining: 100,
        scheduleId: 1,
        socialEventId: 1,
        price: 1000,
      },
      {
        remaining: 100,
        scheduleId: 2,
        socialEventId: 1,
        price: 1200,
      },
      {
        remaining: 120,
        scheduleId: 3,
        socialEventId: 2,
        price: 2200,
      },
      {
        remaining: 83,
        scheduleId: 4,
        socialEventId: 3,
        price: 2500,
      },
      {
        remaining: 20,
        scheduleId: 5,
        socialEventId: 3,
        price: 2500,
      },
      {
        remaining: 200,
        scheduleId: 6,
        socialEventId: 4,
        price: 2200,
      },
      {
        remaining: 200,
        scheduleId: 7,
        socialEventId: 4,
        price: 2800,
      },
      {
        remaining: 300,
        scheduleId: 8,
        socialEventId: 4,
        price: 2800,
      },
    ],
  });
  await prisma.address.createMany({
    data: [
      {
        formatted: "Av. Corrientes 857, C1043AAI, C1043 AAI, Buenos Aires",
        city: "Ciudad Autonoma de Buenos Aires",
        state: "BS",
        country: "AR",
      },
    ],
  });
  await prisma.capacity.createMany({
    data: [
      {
        total: 3262,
      },
    ],
  });
  await prisma.hour.createMany({
    data: [
      {
        from: 12,
        to: 20,
      },
    ],
  });
  await prisma.day.createMany({
    data: [
      {
        index: 0,
        available: false,
      },
      {
        index: 1,
      },
      {
        index: 2,
      },
      {
        index: 3,
      },
      {
        index: 4,
      },
      {
        index: 5,
      },
      {
        index: 6,

        available: false,
      },
    ],
  });
  await prisma.location.createMany({
    data: [
      {
        name: "Gran Rex",
        addressId: 1,
        capacityId: 1,
      },
    ],
  });
  await prisma.attentionHours.createMany({
    data: [
      {
        dayId: 1,
        hourId: 1,
        locationId: 1,
      },
      {
        dayId: 2,
        hourId: 1,
        locationId: 1,
      },
      {
        dayId: 3,
        hourId: 1,
        locationId: 1,
      },
      {
        dayId: 4,
        hourId: 1,
        locationId: 1,
      },
      {
        dayId: 5,
        hourId: 1,
        locationId: 1,
      },
      {
        dayId: 6,
        hourId: 1,
        locationId: 1,
      },
      {
        dayId: 7,
        hourId: 1,
        locationId: 1,
      },
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
