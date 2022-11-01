const CJ: NoSelf&any = require('jass.common')
/** @noSelf **/
export default class ForceUtil {


    /**
     * 获取用户玩家数量
     */

    static getUserCount(): number {
        let count = 0
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            if (GetPlayerController(tempPlayer) == MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                count++;
            }
        }
        return count;
    }

    /**
     * 获取用户玩家组
     */
    static getUserForce(): force {
        let force = CreateForce()
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            if (GetPlayerController(tempPlayer) == CJ.MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == CJ.PLAYER_SLOT_STATE_PLAYING) {
                ForceAddPlayer(force, tempPlayer)
            }
        }
        return force;
    }


    /**
     * 遍历在线用户玩家
     * @param callback
     */
    static forUserForce(callback: (player: player) => void): void {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            if (GetPlayerController(tempPlayer) == MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                callback(tempPlayer)
            }
        }
    }

    /**
     * 遍历玩家 盟友的玩家组 包括判断的玩家自身
     * @param callback
     */
    static forPlayerAllyForce(player: player, callback: (player: player) => void): void {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            if (GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING && IsPlayerAlly(tempPlayer, player)) {
                callback(tempPlayer)
            }
        }
    }


}
