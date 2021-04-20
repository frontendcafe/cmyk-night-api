import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function main() {
  //   const users = await prisma.users.createMany({
  //     data: [
  //       { email: "nicolas@gmail.com", age: 26, name: "Nicolas" },
  //       { email: "agustin@gmail.com", age: 27, name: "Agustin" },
  //       { email: "alejandro@gmail.com", age: 28, name: "Alejandro" },
  //       { email: "federico@gmail.com", age: 29, name: "Federico" },
  //       { email: "laura@gmail.com", age: 30, name: "Laura" },
  //       { email: "sofia@gmail.com", age: 31, name: "Sofia" },
  //       { email: "alejandra@gmail.com", age: 32, name: "Alejandra" },
  //       { email: "martin@gmail.com", age: 33, name: "Martin" },
  //     ],
  //   });

  const events = await prisma.events.createMany({
    data: [
      {
        description: "Lola",
        performer: "Varios",
        rating: 4.3,
        title: "Veni a disfrutar el LOLA",
        type: "Mudddsic",
        avatar_image: "sin foto",
        banner_image: "sin banner",
      },
    ],
  });

  console.log(events);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
