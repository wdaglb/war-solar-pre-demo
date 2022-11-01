import { MapPlayer } from "../handles/player";
export const  bj_MAX_PLAYER_SLOTS = 16
export const Players: MapPlayer[] = [];

for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
  Players[i] = MapPlayer.fromHandle(Player(i));
}
