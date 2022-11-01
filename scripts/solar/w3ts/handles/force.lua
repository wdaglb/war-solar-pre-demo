local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 9,["17"] = 6,["19"] = 6,["21"] = 12,["24"] = 8,["25"] = 16,["26"] = 17,["27"] = 16,["28"] = 20,["29"] = 21,["30"] = 20,["31"] = 24,["32"] = 25,["33"] = 24,["34"] = 28,["35"] = 29,["36"] = 28,["37"] = 32,["38"] = 33,["39"] = 32,["40"] = 36,["41"] = 37,["42"] = 36,["43"] = 40,["44"] = 41,["45"] = 40,["46"] = 44,["47"] = 45,["48"] = 44,["49"] = 51,["50"] = 52,["51"] = 54,["52"] = 54,["53"] = 54,["54"] = 54,["55"] = 54,["56"] = 54,["57"] = 54,["58"] = 54,["59"] = 56,["60"] = 51,["61"] = 59,["62"] = 60,["63"] = 59,["64"] = 63,["65"] = 64,["66"] = 63,["67"] = 67,["68"] = 68,["69"] = 67});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____player = require("solar.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
____exports.Force = __TS__Class()
local Force = ____exports.Force
Force.name = "Force"
__TS__ClassExtends(Force, Handle)
function Force.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateForce()
        )
    end
end
function Force.prototype.addPlayer(self, whichPlayer)
    ForceAddPlayer(self.handle, whichPlayer.handle)
end
function Force.prototype.clear(self)
    ForceClear(self.handle)
end
function Force.prototype.destroy(self)
    DestroyForce(self.handle)
end
function Force.prototype.enumAllies(self, whichPlayer, filter)
    ForceEnumAllies(self.handle, whichPlayer.handle, filter)
end
function Force.prototype.enumEnemies(self, whichPlayer, filter)
    ForceEnumEnemies(self.handle, whichPlayer.handle, filter)
end
function Force.prototype.enumPlayers(self, filter)
    ForceEnumPlayers(self.handle, filter)
end
function Force.prototype.enumPlayersCounted(self, filter, countLimit)
    ForceEnumPlayersCounted(self.handle, filter, countLimit)
end
Force.prototype["for"] = function(self, callback)
    ForForce(self.handle, callback)
end
function Force.prototype.getPlayers(self)
    local players = {}
    ForForce(
        self.handle,
        function()
            local ____temp_0 = #players + 1
            players[____temp_0] = MapPlayer:fromEnum()
            return ____temp_0
        end
    )
    return players
end
function Force.prototype.hasPlayer(self, whichPlayer)
    return IsPlayerInForce(whichPlayer.handle, self.handle)
end
function Force.prototype.removePlayer(self, whichPlayer)
    ForceRemovePlayer(self.handle, whichPlayer.handle)
end
function Force.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
