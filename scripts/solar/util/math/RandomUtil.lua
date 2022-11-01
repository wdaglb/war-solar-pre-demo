local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 10,["12"] = 11,["13"] = 10,["14"] = 19,["15"] = 20,["16"] = 19,["17"] = 29,["18"] = 30,["19"] = 31,["20"] = 29,["21"] = 39,["22"] = 40,["23"] = 39,["24"] = 48,["25"] = 49,["26"] = 48,["27"] = 59,["28"] = 59,["29"] = 60,["30"] = 61,["31"] = 62,["32"] = 63,["35"] = 66,["36"] = 67,["37"] = 68,["38"] = 69,["39"] = 70,["40"] = 71,["44"] = 75,["45"] = 59,["46"] = 85,["47"] = 86,["48"] = 85,["49"] = 92,["50"] = 93,["51"] = 92,["52"] = 100,["53"] = 101,["54"] = 100,["55"] = 3,["56"] = 2});
local ____exports = {}
____exports.default = __TS__Class()
local RandomUtil = ____exports.default
RandomUtil.name = "RandomUtil"
function RandomUtil.prototype.____constructor(self)
end
function RandomUtil.nextInt(min, max)
    return GetRandomInt(min, max)
end
function RandomUtil.nextReal(min, max)
    return GetRandomReal(min, max)
end
function RandomUtil.nextLocal()
    ____exports.default._SL_seed_local = 314159269 * ____exports.default._SL_seed_local + 453806245
    return ____exports.default._SL_seed_local / 2147483648
end
function RandomUtil.nextLocalInt(min, max)
    return math.floor(____exports.default.nextLocalReal(min, max))
end
function RandomUtil.nextLocalReal(min, max)
    return ____exports.default.nextLocal() % (max - min) + min
end
function RandomUtil.getRandomKeyByWeight(...)
    local objAndWeights = {...}
    local max = 0
    for ____, objAndWeight in ipairs(objAndWeights) do
        for objAndWeightKey in pairs(objAndWeight) do
            max = max + objAndWeight[objAndWeightKey]
        end
    end
    local ri = ____exports.default.nextReal(0, max)
    for ____, objAndWeight in ipairs(objAndWeights) do
        for objAndWeightKey in pairs(objAndWeight) do
            ri = ri - objAndWeight[objAndWeightKey]
            if ri <= 0 then
                return objAndWeightKey
            end
        end
    end
    return nil
end
function RandomUtil.isInChance(chance)
    return GetRandomReal(0, 1) < chance
end
function RandomUtil.randomAngle()
    return GetRandomReal(0, 360)
end
function RandomUtil.randomPercent()
    return GetRandomReal(0, 1)
end
RandomUtil._SL_seed_local = 314159269 * os.time() * math.floor(os.clock() * 1000) + 453806245
____exports.default = RandomUtil
return ____exports
