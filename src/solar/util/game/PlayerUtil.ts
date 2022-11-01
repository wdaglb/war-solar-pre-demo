/** @noSelf **/

/**
 * 玩家工具
 */
export default class PlayerUtil {


    /**
     * 显示文本
     * @param player
     * @param text
     * @param duration
     * @param x
     * @param y
     */
    static text(player: player, text: string, duration = 5, x: number = 0, y: number = 0) {
        DisplayTimedTextToPlayer(player, x, y, duration,
            text)
    }


    /**
     * 第一个在线用户玩家
     * 通常用作主机玩家选择难度
     */
    static firstOfUsers(): player {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            if (GetPlayerController(tempPlayer) == MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                return tempPlayer;
            }
        }
    }


    /**
     * 添加金币
     * @param player
     * @param value
     */
    static addGoldState(player: player, value: number) {
        PlayerUtil.addState(player, PLAYER_STATE_RESOURCE_GOLD, value)
    }

    /**
     * 添加木材
     * @param player
     * @param value
     */
    static addLumberState(player: player, value: number) {
        PlayerUtil.addState(player, PLAYER_STATE_RESOURCE_LUMBER, value)
    }

    /**
     * 添加状态
     * @param player
     * @param whichPlayerState
     * @param value
     */
    static addState(player: player, whichPlayerState: playerstate, value: number) {
        SetPlayerState(player, whichPlayerState, GetPlayerState(player, whichPlayerState) + value);
    }

    /**
     * 获取金币
     * @param player
     */
    static getGold(player: player): number {
        return GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD)
    }

    /**
     * 获取木材
     * @param player
     */
    static getLumber(player: player): number {
        return GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER)
    }

    /**
     * 获取人口
     * @param player
     */
    static getFoodCap(player: player): number {
        return GetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_CAP)
    }


    /**
     * 是否是在线用户玩家
     */
    static isOnlineUser(pid: number): boolean {
        return GetPlayerController(Player(pid)) == MAP_CONTROL_USER && GetPlayerSlotState(Player(pid)) == PLAYER_SLOT_STATE_PLAYING
    }
}
