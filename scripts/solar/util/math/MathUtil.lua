local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 2,["8"] = 3,["9"] = 4,["10"] = 5,["11"] = 6,["12"] = 7,["13"] = 9,["14"] = 9,["15"] = 9,["17"] = 9,["18"] = 19,["19"] = 20,["20"] = 21,["21"] = 22,["22"] = 19,["23"] = 32,["24"] = 33,["25"] = 34,["26"] = 35,["27"] = 32,["28"] = 45,["29"] = 46,["30"] = 45,["31"] = 56,["32"] = 57,["33"] = 56,["34"] = 64,["35"] = 65,["36"] = 64,["37"] = 72,["38"] = 73,["39"] = 72,["40"] = 81,["41"] = 82,["42"] = 81,["43"] = 89,["44"] = 90,["45"] = 91,["47"] = 93,["48"] = 94,["49"] = 95,["51"] = 97,["52"] = 89,["53"] = 104,["54"] = 105,["55"] = 104,["56"] = 112,["57"] = 113,["58"] = 112,["59"] = 125,["60"] = 126,["61"] = 127,["62"] = 128,["63"] = 129,["65"] = 131,["66"] = 125,["67"] = 141,["68"] = 141,["69"] = 141,["71"] = 142,["72"] = 143,["73"] = 144,["74"] = 145,["75"] = 146,["77"] = 148,["78"] = 141,["79"] = 9});
local ____exports = {}
local PI = 3.14159
local E = 2.71828
local CELLWIDTH = 128
local CLIFFHEIGHT = 128
local UNIT_FACING = 270
local RADTODEG = 180 / PI
local DEGTORAD = PI / 180
____exports.default = __TS__Class()
local MathUtil = ____exports.default
MathUtil.name = "MathUtil"
function MathUtil.prototype.____constructor(self)
end
function MathUtil.distanceBetweenPoints(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return SquareRoot(dx * dx + dy * dy)
end
function MathUtil.polarProjection(x1, y1, dist, angle)
    local x = x1 + dist * Cos(angle * DEGTORAD)
    local y = y1 + dist * Sin(angle * DEGTORAD)
    return {x = x, y = y}
end
function MathUtil.angleBetweenCoords(x1, y1, x2, y2)
    return RADTODEG * Atan2(y2 - y1, x2 - x1)
end
function MathUtil.radianBetweenCoords(x1, y1, x2, y2)
    return Atan2(y2 - y1, x2 - x1)
end
function MathUtil.radian2angle(radian)
    return RADTODEG * radian
end
function MathUtil.angle2radian(angle)
    return DEGTORAD * angle
end
function MathUtil.isBackAngle(jd0, jd1)
    return CosBJ(jd1 - jd0) >= 0
end
function MathUtil.sum(data)
    if not data then
        return 0
    end
    local count = 0
    for k in pairs(data) do
        count = count + data[k]
    end
    return count
end
function MathUtil.min(...)
    return math.min(...)
end
function MathUtil.max(...)
    return math.max(...)
end
function MathUtil.clamp(value, min, max)
    if value > max then
        return max
    elseif value < min then
        return min
    end
    return value
end
function MathUtil.armorReduction(armor, ardf)
    if ardf == nil then
        ardf = ArmorReducesDamageFactor
    end
    if armor == 0 then
        return 0
    elseif armor < 0 then
        armor = -armor
        return -(armor / (armor + 1 / ardf))
    end
    return armor / (armor + 1 / ardf)
end
____exports.default = MathUtil
return ____exports
