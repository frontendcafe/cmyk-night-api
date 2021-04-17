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
    artist: "Eruca Sativa",
    rating: 3,
    title: "Bienvenida la fiesta",
    type: "Music",
    image:
      "https://www.freepik.es/fotos-premium/monton-rucula-verde-fresca_8526081.htm#page=1&query=eruca%20sativa&position=0",
    description: "veni a comer, beber y disfrutar con amigos",
  },
  2: {
    id: 2,
    artist: "Charly Garcia",
    rating: 5,
    title: "Seminare",
    type: "Music",
    description: "Charly Garcia en concierto UNICO",
    image:
      "https://www.freepik.es/foto-gratis/pantalla-tableta-digital-controlador-casa-inteligente-mesa-madera_13463648.htm#query=musica&position=7",
  },
  3: {
    id: 3,
    artist: "Fnatic",
    rating: 4,
    title: "LOL Worlds Finals",
    type: "E-sports",
    description: "Competicion de league of legends",
    image:
      "https://www.freepik.es/vector-gratis/ilustracion-guantes-espuma-ventilador-color-rojo-azul_11058528.htm#query=fanatic&position=0",
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
