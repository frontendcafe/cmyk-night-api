export interface BaseSocialEvent {
    name: string;
    price: number;
    description: string;
    image: string;
  }
  
  export interface SocialEvent extends BaseSocialEvent {
    id: number;
  }
  
