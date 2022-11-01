local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 6,["12"] = 7,["13"] = 6,["14"] = 14,["15"] = 15,["16"] = 16,["17"] = 17,["18"] = 14,["19"] = 24,["20"] = 24,["21"] = 24,["23"] = 25,["24"] = 26,["25"] = 27,["26"] = 28,["27"] = 29,["28"] = 30,["29"] = 31,["31"] = 33,["32"] = 24,["33"] = 40,["34"] = 41,["35"] = 42,["36"] = 43,["37"] = 44,["38"] = 45,["39"] = 46,["40"] = 47,["42"] = 49,["43"] = 40,["44"] = 1});
local ____exports = {}
____exports.default = __TS__Class()
local HeroUtil = ____exports.default
HeroUtil.name = "HeroUtil"
function HeroUtil.prototype.____constructor(self)
end
function HeroUtil.isHero(self, handle)
    return IsHeroUnitId(GetUnitTypeId(handle))
end
function HeroUtil.getHeroPrimary(self, handle)
    local objIdStr = id2string(GetUnitTypeId(handle))
    local obj = unit[objIdStr]
    return obj.Primary
end
function HeroUtil.getHeroPrimaryValue(self, handle, includeBonuses)
    if includeBonuses == nil then
        includeBonuses = true
    end
    local Primary = ____exports.default:getHeroPrimary(handle)
    if Primary == "STR" then
        return GetHeroStr(handle, includeBonuses)
    elseif Primary == "AGI" then
        return GetHeroAgi(handle, includeBonuses)
    elseif Primary == "INT" then
        return GetHeroInt(handle, includeBonuses)
    end
    return 0
end
function HeroUtil.getHeroPrimaryBonusValue(self, handle)
    local Primary = ____exports.default:getHeroPrimary(handle)
    if Primary == "STR" then
        return GetHeroStr(handle, true) - GetHeroStr(handle, false)
    elseif Primary == "AGI" then
        return GetHeroAgi(handle, true) - GetHeroAgi(handle, false)
    elseif Primary == "INT" then
        return GetHeroInt(handle, true) - GetHeroAgi(handle, false)
    end
    return 0
end
____exports.default = HeroUtil
return ____exports
