export type SocialEventType =
  | "Online"
  | "Offline"
  | "Music"
  | "Sport"
  | "E-sports"
  | "Festival";

export interface BaseSocialEvent {
  title: string;
  artist: string;
  description: string;
  image: string;
  rating: number;
  type: SocialEventType;
}

export interface SocialEvent extends BaseSocialEvent {
  id: number;
}
