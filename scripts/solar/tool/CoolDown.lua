local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 6,["9"] = 6,["10"] = 6,["11"] = 15,["12"] = 8,["13"] = 16,["14"] = 15,["15"] = 24,["16"] = 24,["17"] = 24,["19"] = 25,["20"] = 26,["21"] = 27,["23"] = 29,["24"] = 24,["25"] = 36,["26"] = 37,["27"] = 38,["29"] = 36,["30"] = 6});
local ____exports = {}
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local CoolDown = ____exports.default
CoolDown.name = "CoolDown"
function CoolDown.prototype.____constructor(self, cool)
    self.lastWorkTime = -1000000
    self.cool = cool
end
function CoolDown.prototype.isReady(self, doWork)
    if doWork == nil then
        doWork = true
    end
    local r = BaseUtil.getGameTime() - self.lastWorkTime > self.cool
    if r and doWork then
        self.lastWorkTime = BaseUtil.getGameTime()
    end
    return r
end
function CoolDown.prototype.ifReady(self, callBack)
    if self:isReady() then
        callBack(nil)
    end
end
____exports.default = CoolDown
return ____exports
