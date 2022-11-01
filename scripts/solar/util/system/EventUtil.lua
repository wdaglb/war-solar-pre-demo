local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 5,["9"] = 10,["10"] = 10,["11"] = 10,["13"] = 10,["14"] = 17,["15"] = 18,["16"] = 17,["17"] = 26,["18"] = 28,["19"] = 26,["20"] = 34,["21"] = 35,["22"] = 34,["23"] = 10});
local ____exports = {}
local ____mitt = require("solar.lib.mitt")
local mitt = ____mitt.default
local emitter = mitt()
____exports.default = __TS__Class()
local EventUtil = ____exports.default
EventUtil.name = "EventUtil"
function EventUtil.prototype.____constructor(self)
end
function EventUtil.on(self, ____type, handler)
    emitter:on(____type, handler)
end
function EventUtil.emit(self, ____type, data)
    emitter:emit(____type, data)
end
function EventUtil.clear(self)
    emitter.all:clear()
end
____exports.default = EventUtil
return ____exports
