import ForceUtil from "./ForceUtil";

export default class GameUtil {


    /**
     * 游戏胜利
     */
    static victorys(msg = "游戏胜利!") {
        ForceUtil.forUserForce(player => {
            DisplayTextToPlayer(player, 0, 0, msg)
            CustomVictoryBJ(player, true, true)
        })
    }

    /**
     * 游戏失败
     */
    static defeats(msg = "游戏失败!") {
        ForceUtil.forUserForce(player => {
            DisplayTextToPlayer(player, 0, 0, msg)
            CustomDefeatBJ(player, msg)
        })
    }

    /**
     * 游戏结束
     */
    static gameOver(msg = "游戏结束!") {
        DisplayTextToPlayer(GetLocalPlayer(), 0, 0, msg)
        PauseAllUnitsBJ(true)
    }


    /**
     * 禁用边界染色
     */
    static closeWorldFogBoundary() {
        EnableWorldFogBoundary(false)//
    }

    /**
     * 游戏时间流逝速度
     * @param timeOfDay设置时间
     * @param scale 游戏时间流逝速度
     */
    static setTimeOfDay(timeOfDay = 12, scale = 0) {
        SetFloatGameState(GAME_STATE_TIME_OF_DAY, timeOfDay)
        SetTimeOfDayScale(scale)

    }


    /**
     * 打开全图视野
     */
    static openFullMapView(maskEnableOff = false) {
        ForceUtil.forUserForce(p => {
            CreateFogModifierRectBJ(true, p, FOG_OF_WAR_VISIBLE, GetPlayableMapRect());
        })
        FogEnableOff();
        if (maskEnableOff) {
            FogMaskEnableOff();
        }
    }

    /**
     * 打开电脑玩家的给与奖励属性
     */
    static openComputerPlayerGivesBounty() {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            if (GetPlayerController(tempPlayer) == MAP_CONTROL_COMPUTER && GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                SetPlayerState(tempPlayer, PLAYER_STATE_GIVES_BOUNTY, 1)
            }
        }
    }

    /**
     * 获取地形 地面高度 z
     * @param x
     * @param y
     */
    static getTerrainHeight(x: number, y: number) {
        MoveLocation(tempLocation, x, y);
        return GetLocationZ(tempLocation);
    }


}