local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 12});
local ____exports = {}
local MoveType = MoveType or ({})
MoveType.none = "none"
MoveType.foot = "foot"
MoveType.horse = "horse"
MoveType.fly = "fly"
MoveType.hover = "hover"
MoveType.float = "float"
MoveType.amph = "amph"
MoveType.unbuild = "unbuild"
____exports.default = MoveType
return ____exports
