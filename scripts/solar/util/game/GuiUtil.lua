local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 4,["13"] = 4,["14"] = 10,["15"] = 11,["16"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 10,["21"] = 21,["22"] = 22,["23"] = 23,["24"] = 24,["25"] = 25,["26"] = 26,["27"] = 21,["28"] = 32,["29"] = 33,["30"] = 34,["31"] = 35,["32"] = 36,["33"] = 37,["35"] = 39,["36"] = 40,["38"] = 42,["39"] = 32,["40"] = 4});
local ____exports = {}
local ____CameraUtil = require("solar.util.game.CameraUtil")
local CameraUtil = ____CameraUtil.default
local message = require("jass.message")
____exports.default = __TS__Class()
local GuiUtil = ____exports.default
GuiUtil.name = "GuiUtil"
function GuiUtil.prototype.____constructor(self)
end
function GuiUtil.isInSelectUi(self)
    local a1
    local a2
    local a3
    a1, a2, a3 = message.button(3, 2)
    return a2 == 851979
end
function GuiUtil.isInMagicBookUi(self)
    local a1
    local a2
    local a3
    a1, a2, a3 = message.button(3, 2)
    return a2 == 851975
end
function GuiUtil.isUnitInScreen(self, udw)
    local x = GetUnitX(udw)
    local y = GetUnitY(udw)
    local sjxy = CameraUtil:getScreenCoordinates(x, y, 0)
    if sjxy.x > 0.8 or sjxy.x < 0 then
        return false
    end
    if sjxy.y > 0.6 or sjxy.y < 0 then
        return false
    end
    return true
end
____exports.default = GuiUtil
return ____exports
