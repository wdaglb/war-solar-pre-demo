local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 13,["9"] = 13,["10"] = 13,["12"] = 13,["13"] = 26,["14"] = 26,["15"] = 26,["17"] = 26,["18"] = 26,["20"] = 27,["21"] = 28,["23"] = 29,["24"] = 30,["27"] = 33,["28"] = 34,["29"] = 29,["32"] = 36,["33"] = 37,["35"] = 39,["36"] = 40,["37"] = 41,["38"] = 42,["39"] = 43,["40"] = 44,["42"] = 46,["43"] = 47,["44"] = 48,["47"] = 51,["48"] = 26,["49"] = 60,["50"] = 60,["51"] = 60,["53"] = 61,["54"] = 62,["55"] = 63,["57"] = 65,["58"] = 66,["59"] = 67,["60"] = 68,["62"] = 70,["63"] = 60,["64"] = 14,["65"] = 16,["66"] = 16,["67"] = 16,["68"] = 16,["69"] = 16,["70"] = 16,["71"] = 16,["72"] = 16,["73"] = 16,["74"] = 14,["75"] = 13});
local ____exports = {}
____exports.default = __TS__Class()
local TextUtil = ____exports.default
TextUtil.name = "TextUtil"
function TextUtil.prototype.____constructor(self)
end
function TextUtil.toCnUnit(self, num, keepDecimalPoint, maxDigit)
    if keepDecimalPoint == nil then
        keepDecimalPoint = true
    end
    if maxDigit == nil then
        maxDigit = 4
    end
    local cnUnit = ""
    local index = 0
    do
        while index < #____exports.default.config.cnUnit do
            if math.abs(num) < 10000 then
                break
            end
            num = num / 10000
            cnUnit = ____exports.default.config.cnUnit[index + 1]
            index = index + 1
        end
    end
    if not keepDecimalPoint then
        num = math.floor(num)
    else
        local numStr = tostring(num) .. ""
        local indexOf = (string.find(numStr, ".", nil, true) or 0) - 1
        if indexOf < maxDigit then
            numStr = __TS__StringSubstring(numStr, 0, maxDigit + 1)
            if __TS__StringEndsWith(numStr, ".000") or __TS__StringEndsWith(numStr, ".00") or __TS__StringEndsWith(numStr, ".0") then
                numStr = __TS__StringSubstring(numStr, 0, indexOf)
            end
            return numStr .. cnUnit
        elseif indexOf == maxDigit then
            num = math.floor(num)
        end
    end
    return tostring(num) .. cnUnit
end
function TextUtil.toPercentage(self, num, decimalPrecision)
    if decimalPrecision == nil then
        decimalPrecision = 0
    end
    num = num * 100
    if decimalPrecision == 0 then
        return tostring(math.floor(num)) .. "%"
    end
    local percentageStr = tostring(num) .. ""
    local pointIndex = (string.find(percentageStr, ".", nil, true) or 0) - 1
    if pointIndex >= 0 and #percentageStr - pointIndex > decimalPrecision then
        return __TS__StringSubstring(percentageStr, 0, pointIndex + decimalPrecision + 1) .. "%"
    end
    return percentageStr .. "%"
end
TextUtil.config = {cnUnit = {
    "万",
    "亿",
    "兆",
    "京",
    "垓",
    "秭",
    "穰",
    "沟",
    "涧"
}}
____exports.default = TextUtil
return ____exports
