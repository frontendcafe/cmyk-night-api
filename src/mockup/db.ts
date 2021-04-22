import { SocialEvent } from "../models/social-event.interface";

export const db: SocialEvent[] = [
  {
    id: 1,
    title: "SEREMOS PRIMAVERA",
    performer: {
      id: 1,
      name: "Eruca Sativa",
    },
    schedule: {
      days: [
        {
          id: 1,
          day: new Date("2021-04-28 UTC"),
          disponibility: true,
        },
      ],
      hours: [
        {
          id: 1,
          from: new Date("2021-04-28 19:00 UTC"),
          to: new Date("2021-04-28 21:00 UTC"),
          disponibility: true,
          tickets: {
            id: 1,
            bought: 10,
            total: 200,
            available: 190,
          },
        },
      ],
    },
    rating: 4.2,
    image: "url",
    description: "lorem ipsum",
    type: "Music",
  },

  {
    id: 2,
    title: "WINTER IS COMING",
    performer: {
      id: 2,
      name: "Tun tun tururun tun",
    },
    schedule: {
      days: [
        {
          id: 2,
          day: new Date("2021-04-29 UTC"),
          disponibility: true,
        },
      ],
      hours: [
        {
          id: 2,
          from: new Date("2021-04-29 19:00 UTC"),
          to: new Date("2021-04-29 21:00 UTC"),
          disponibility: true,
          tickets: {
            id: 2,
            bought: 10,
            total: 200,
            available: 190,
          },
        },
      ],
    },
    rating: 4.9,
    image: "url",
    description: "lorem ipsum",
    type: "Online",
  },
  {
    id: 3,
    title: "Navidad",
    performer: {
      id: 3,
      name: "Santa Claus",
    },
    schedule: {
      days: [
        {
          id: 3,
          day: new Date("2021-12-24 UTC"),
          disponibility: true,
        },
      ],
      hours: [
        {
          id: 1,
          from: new Date("2021-12-24 19:00 UTC"),
          to: new Date("2021-12-24 21:00 UTC"),
          disponibility: true,
          tickets: {
            id: 3,
            bought: 10,
            total: 200,
            available: 190,
          },
        },
      ],
    },
    rating: 5.0,
    image: "url",
    description: "lorem ipsum",
    type: "Offline",
  },
];
