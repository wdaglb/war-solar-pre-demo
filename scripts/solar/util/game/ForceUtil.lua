local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["11"] = 3,["12"] = 10,["13"] = 11,["15"] = 12,["16"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["21"] = 12,["24"] = 18,["25"] = 10,["26"] = 24,["27"] = 25,["29"] = 26,["30"] = 26,["31"] = 27,["32"] = 28,["33"] = 29,["35"] = 26,["38"] = 32,["39"] = 24,["40"] = 40,["42"] = 41,["43"] = 41,["44"] = 42,["45"] = 43,["46"] = 44,["48"] = 41,["51"] = 40,["52"] = 53,["54"] = 54,["55"] = 54,["56"] = 55,["57"] = 56,["58"] = 57,["60"] = 54,["63"] = 53,["64"] = 3});
local ____exports = {}
local CJ = require("jass.common")
____exports.default = __TS__Class()
local ForceUtil = ____exports.default
ForceUtil.name = "ForceUtil"
function ForceUtil.prototype.____constructor(self)
end
function ForceUtil.getUserCount()
    local count = 0
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                count = count + 1
            end
            i = i + 1
        end
    end
    return count
end
function ForceUtil.getUserForce()
    local force = CreateForce()
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == CJ.MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == CJ.PLAYER_SLOT_STATE_PLAYING then
                ForceAddPlayer(force, tempPlayer)
            end
            i = i + 1
        end
    end
    return force
end
function ForceUtil.forUserForce(callback)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                callback(nil, tempPlayer)
            end
            i = i + 1
        end
    end
end
function ForceUtil.forPlayerAllyForce(player, callback)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING and IsPlayerAlly(tempPlayer, player) then
                callback(nil, tempPlayer)
            end
            i = i + 1
        end
    end
end
____exports.default = ForceUtil
return ____exports
