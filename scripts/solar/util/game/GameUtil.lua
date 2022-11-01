local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 9,["14"] = 9,["15"] = 9,["17"] = 10,["18"] = 11,["19"] = 12,["20"] = 10,["21"] = 9,["22"] = 19,["23"] = 19,["24"] = 19,["26"] = 20,["27"] = 21,["28"] = 22,["29"] = 20,["30"] = 19,["31"] = 29,["32"] = 29,["33"] = 29,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 30,["39"] = 30,["40"] = 30,["41"] = 31,["42"] = 29,["43"] = 38,["44"] = 39,["45"] = 38,["46"] = 47,["47"] = 47,["48"] = 47,["50"] = 47,["51"] = 47,["53"] = 48,["54"] = 49,["55"] = 47,["56"] = 57,["57"] = 57,["58"] = 57,["60"] = 58,["61"] = 59,["62"] = 59,["63"] = 59,["64"] = 59,["65"] = 59,["66"] = 59,["67"] = 58,["68"] = 61,["69"] = 62,["70"] = 63,["72"] = 57,["73"] = 70,["75"] = 71,["76"] = 71,["77"] = 72,["78"] = 73,["79"] = 74,["81"] = 71,["84"] = 70,["85"] = 84,["86"] = 85,["87"] = 86,["88"] = 84,["89"] = 3});
local ____exports = {}
local ____ForceUtil = require("solar.util.game.ForceUtil")
local ForceUtil = ____ForceUtil.default
____exports.default = __TS__Class()
local GameUtil = ____exports.default
GameUtil.name = "GameUtil"
function GameUtil.prototype.____constructor(self)
end
function GameUtil.victorys(self, msg)
    if msg == nil then
        msg = "游戏胜利!"
    end
    ForceUtil.forUserForce(function(____, player)
        DisplayTextToPlayer(player, 0, 0, msg)
        CustomVictoryBJ(player, true, true)
    end)
end
function GameUtil.defeats(self, msg)
    if msg == nil then
        msg = "游戏失败!"
    end
    ForceUtil.forUserForce(function(____, player)
        DisplayTextToPlayer(player, 0, 0, msg)
        CustomDefeatBJ(player, msg)
    end)
end
function GameUtil.gameOver(self, msg)
    if msg == nil then
        msg = "游戏结束!"
    end
    DisplayTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        msg
    )
    PauseAllUnitsBJ(true)
end
function GameUtil.closeWorldFogBoundary(self)
    EnableWorldFogBoundary(false)
end
function GameUtil.setTimeOfDay(self, timeOfDay, scale)
    if timeOfDay == nil then
        timeOfDay = 12
    end
    if scale == nil then
        scale = 0
    end
    SetFloatGameState(GAME_STATE_TIME_OF_DAY, timeOfDay)
    SetTimeOfDayScale(scale)
end
function GameUtil.openFullMapView(self, maskEnableOff)
    if maskEnableOff == nil then
        maskEnableOff = false
    end
    ForceUtil.forUserForce(function(____, p)
        CreateFogModifierRectBJ(
            true,
            p,
            FOG_OF_WAR_VISIBLE,
            GetPlayableMapRect()
        )
    end)
    FogEnableOff()
    if maskEnableOff then
        FogMaskEnableOff()
    end
end
function GameUtil.openComputerPlayerGivesBounty(self)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_COMPUTER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                SetPlayerState(tempPlayer, PLAYER_STATE_GIVES_BOUNTY, 1)
            end
            i = i + 1
        end
    end
end
function GameUtil.getTerrainHeight(self, x, y)
    MoveLocation(tempLocation, x, y)
    return GetLocationZ(tempLocation)
end
____exports.default = GameUtil
return ____exports
