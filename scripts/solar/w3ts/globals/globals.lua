local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 3,["10"] = 5,["11"] = 5,["12"] = 6,["13"] = 5});
local ____exports = {}
local ____player = require("solar.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
____exports.bj_MAX_PLAYER_SLOTS = 16
____exports.Players = {}
do
    local i = 0
    while i < ____exports.bj_MAX_PLAYER_SLOTS do
        ____exports.Players[i + 1] = MapPlayer:fromHandle(Player(i))
        i = i + 1
    end
end
return ____exports
