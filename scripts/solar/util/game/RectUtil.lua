local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 4,["10"] = 4,["11"] = 4,["13"] = 4,["14"] = 14,["15"] = 15,["16"] = 15,["17"] = 15,["18"] = 15,["19"] = 15,["20"] = 15,["21"] = 15,["22"] = 14,["23"] = 4});
local ____exports = {}
local ____rect = require("solar.w3ts.handles.rect")
local Rectangle = ____rect.Rectangle
____exports.default = __TS__Class()
local RectUtil = ____exports.default
RectUtil.name = "RectUtil"
function RectUtil.prototype.____constructor(self)
end
function RectUtil.GetRectFromCircle(centerX, centerY, radius)
    return __TS__New(
        Rectangle,
        centerX - radius,
        centerY - radius,
        centerX + radius,
        centerY + radius
    )
end
____exports.default = RectUtil
return ____exports
