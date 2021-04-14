/**
 * Data Model Interfaces
 */

import { BaseSocialEvent, SocialEvent } from "./social-event.interface";
import { SocialEvents } from "./social-events.interface";

/**
 * In-Memory Store
 */

const socialEvents: SocialEvents = {
  1: {
    id: 1,
    name: "Burger",
    price: 599,
    description: "Tasty",
    image: "https://cdn.auth0.com/blog/whatabyte/burger-sm.png",
  },
  2: {
    id: 2,
    name: "Pizza",
    price: 299,
    description: "Cheesy",
    image: "https://cdn.auth0.com/blog/whatabyte/pizza-sm.png",
  },
  3: {
    id: 3,
    name: "Tea",
    price: 199,
    description: "Informative",
    image: "https://cdn.auth0.com/blog/whatabyte/tea-sm.png",
  },
};

/**
 * Service Methods
 */

export const findAll = async (): Promise<SocialEvent[]> =>
  Object.values(socialEvents);

export const find = async (id: number): Promise<SocialEvent> =>
  socialEvents[id];

export const create = async (
  newItem: BaseSocialEvent
): Promise<SocialEvent> => {
  const id = new Date().valueOf();

  socialEvents[id] = {
    id,
    ...newItem,
  };

  return socialEvents[id];
};

export const update = async (
  id: number,
  itemUpdate: BaseSocialEvent
): Promise<SocialEvent | null> => {
  const item = await find(id);

  if (!item) {
    return null;
  }

  socialEvents[id] = { id, ...itemUpdate };

  return socialEvents[id];
};

export const remove = async (id: number): Promise<null | void> => {
  const item = await find(id);

  if (!item) {
    return null;
  }

  delete socialEvents[id];
};
