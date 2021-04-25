export type SocialEventType =
  | "Online"
  | "Offline"
  | "Music"
  | "Sport"
  | "E-sports"
  | "Festival";

export interface BaseArtist {
  firstName: string;
  lastName: string;
  email: string;
  age: number;
}

export interface Artist extends BaseArtist {
  id: number;
}

export interface BaseSocialEvent {
  title: string;
  description: string;
  avatar: string;
  banner: string;
  rating: number;
  type: SocialEventType;
  performer: Artist;
}

export interface SocialEvent extends BaseSocialEvent {
  id: number;
}

export interface BaseSchedule {
  datetime: Date;
}
export interface Schedule extends BaseSchedule {
  id: number;
}

export interface BaseSocialEventSchedule {
  schedule: Schedule;
  social_event: SocialEvent;
  remaining: number;
  enabled: boolean;
  price: number;
}

export interface SocialEventSchedule extends BaseSocialEventSchedule {
  id: number;
}

export interface BaseUser {
  email: string;
  name: string;
  age: number;
  created_at: Date;
  updated_at: Date;
  orders: Order[];
}

export interface User extends BaseUser {
  id: number;
}

export interface BaseOrder {
  user: User;
  quantity: number;
  price: number;
  created_at: Date;
  updated_at: Date;
  social_event: SocialEvent;
}

export interface Order extends BaseOrder {
  id: number;
}
