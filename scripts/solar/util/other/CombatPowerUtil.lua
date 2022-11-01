local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 7,["11"] = 7,["12"] = 7,["14"] = 7,["15"] = 14,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 17,["20"] = 17,["21"] = 17,["22"] = 17,["23"] = 18,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 19,["28"] = 18,["29"] = 18,["30"] = 21,["31"] = 14,["32"] = 27,["33"] = 28,["34"] = 30,["35"] = 31,["36"] = 33,["37"] = 34,["38"] = 35,["39"] = 36,["40"] = 37,["42"] = 39,["43"] = 40,["44"] = 41,["45"] = 42,["46"] = 43,["47"] = 44,["49"] = 46,["50"] = 27,["51"] = 7});
local ____exports = {}
local ____UnitStateUtil = require("solar.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____GroupUtil = require("solar.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
____exports.default = __TS__Class()
local CombatPowerUtil = ____exports.default
CombatPowerUtil.name = "CombatPowerUtil"
function CombatPowerUtil.prototype.____constructor(self)
end
function CombatPowerUtil.getPlayerCombatPower(self, playerIndex)
    local cp = 0
    GroupClear(_tempGroup)
    GroupEnumUnitsOfPlayer(
        _tempGroup,
        Player(playerIndex),
        nil
    )
    GroupUtil["for"](
        GroupUtil,
        _tempGroup,
        function(____, u)
            cp = cp + ____exports.default:getUnitCombatPower(u)
        end
    )
    return cp
end
function CombatPowerUtil.getUnitCombatPower(self, u)
    local cp = 0
    cp = cp + UnitStateUtil:getMaxLife(u) / 10
    cp = cp + UnitStateUtil:getMaxMana(u) / 10
    local aspd = UnitStateUtil:getAttackSpeed(u)
    local dc = UnitStateUtil:getDamageCool(u)
    local dmgMax = UnitStateUtil:getDamageMax(u)
    if aspd > 0 and dc > 0 and dmgMax > 0 then
        cp = cp + dmgMax * (aspd / dc)
    end
    cp = cp + UnitStateUtil:getArmor(u) * 10
    cp = cp + UnitStateUtil:getMoveSpeed(u)
    if IsUnitType(u, UNIT_TYPE_HERO) then
        cp = cp + GetHeroStr(u, true)
        cp = cp + GetHeroAgi(u, true)
        cp = cp + GetHeroInt(u, true)
    end
    return math.floor(cp)
end
____exports.default = CombatPowerUtil
return ____exports
