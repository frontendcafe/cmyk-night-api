export type SocialEventType =
  | "Online"
  | "Offline"
  | "Music"
  | "Sport"
  | "E-sports"
  | "Festival";

export interface BaseSocialEvent {
  title: string;
  performer: Performer;
  description: string;
  image: string;
  rating: number;
  type: SocialEventType;
  schedule: Schedule;
}

export interface Schedule {
  days: EventDays[];
  hours: EventHours[];
}

export interface Days {
  id: number;
  day: Date;
}

export interface Hours {
  id: number;
  from: Date;
  to: Date;
}

export interface EventDays extends Days {
  disponibility: boolean;
}
export interface EventHours extends Hours {
  disponibility: boolean;
  tickets: Tickets;
}

export interface Tickets {
  id: number;
  total: number;
  available: number;
  bought: number;
}

export interface Performer {
  id: number;
  name: string;
  fantasy_name?: string;
  artists?: Artist[];
}

export interface Artist {
  id: number;
  firstname: string;
  lastName: string;
  email: string;
}

export interface SocialEvent extends BaseSocialEvent {
  id: number;
}
