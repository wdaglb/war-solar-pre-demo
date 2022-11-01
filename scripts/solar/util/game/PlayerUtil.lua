local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 6,["8"] = 6,["10"] = 6,["11"] = 17,["12"] = 17,["13"] = 17,["15"] = 17,["16"] = 17,["18"] = 17,["19"] = 17,["21"] = 18,["22"] = 18,["23"] = 18,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 17,["29"] = 27,["31"] = 28,["32"] = 28,["33"] = 29,["34"] = 30,["35"] = 31,["37"] = 28,["40"] = 27,["41"] = 42,["42"] = 43,["43"] = 42,["44"] = 51,["45"] = 52,["46"] = 51,["47"] = 61,["48"] = 62,["49"] = 62,["50"] = 62,["51"] = 62,["52"] = 62,["53"] = 61,["54"] = 69,["55"] = 70,["56"] = 69,["57"] = 77,["58"] = 78,["59"] = 77,["60"] = 85,["61"] = 86,["62"] = 85,["63"] = 93,["64"] = 94,["65"] = 93,["66"] = 6});
local ____exports = {}
____exports.default = __TS__Class()
local PlayerUtil = ____exports.default
PlayerUtil.name = "PlayerUtil"
function PlayerUtil.prototype.____constructor(self)
end
function PlayerUtil.text(self, player, text, duration, x, y)
    if duration == nil then
        duration = 5
    end
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    DisplayTimedTextToPlayer(
        player,
        x,
        y,
        duration,
        text
    )
end
function PlayerUtil.firstOfUsers(self)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                return tempPlayer
            end
            i = i + 1
        end
    end
end
function PlayerUtil.addGoldState(self, player, value)
    ____exports.default:addState(player, PLAYER_STATE_RESOURCE_GOLD, value)
end
function PlayerUtil.addLumberState(self, player, value)
    ____exports.default:addState(player, PLAYER_STATE_RESOURCE_LUMBER, value)
end
function PlayerUtil.addState(self, player, whichPlayerState, value)
    SetPlayerState(
        player,
        whichPlayerState,
        GetPlayerState(player, whichPlayerState) + value
    )
end
function PlayerUtil.getGold(self, player)
    return GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD)
end
function PlayerUtil.getLumber(self, player)
    return GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER)
end
function PlayerUtil.getFoodCap(self, player)
    return GetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_CAP)
end
function PlayerUtil.isOnlineUser(self, pid)
    return GetPlayerController(Player(pid)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(pid)) == PLAYER_SLOT_STATE_PLAYING
end
____exports.default = PlayerUtil
return ____exports
