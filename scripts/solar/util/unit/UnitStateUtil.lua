local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["10"] = 4,["11"] = 11,["12"] = 12,["13"] = 11,["14"] = 20,["15"] = 21,["16"] = 20,["17"] = 29,["18"] = 30,["19"] = 29,["20"] = 37,["21"] = 38,["22"] = 39,["23"] = 37,["24"] = 46,["25"] = 47,["26"] = 46,["27"] = 55,["28"] = 56,["29"] = 55,["30"] = 64,["31"] = 65,["32"] = 64,["33"] = 72,["34"] = 73,["35"] = 72,["36"] = 81,["37"] = 82,["38"] = 81,["39"] = 90,["40"] = 91,["41"] = 90,["42"] = 98,["43"] = 99,["44"] = 100,["45"] = 98,["46"] = 107,["47"] = 108,["48"] = 107,["49"] = 116,["50"] = 117,["51"] = 116,["52"] = 125,["53"] = 126,["54"] = 125,["55"] = 132,["56"] = 133,["57"] = 132,["58"] = 139,["59"] = 140,["60"] = 139,["61"] = 148,["62"] = 149,["63"] = 148,["64"] = 155,["65"] = 156,["66"] = 155,["67"] = 164,["68"] = 165,["69"] = 164,["70"] = 173,["71"] = 174,["72"] = 173,["73"] = 180,["74"] = 181,["75"] = 180,["76"] = 189,["77"] = 190,["78"] = 191,["80"] = 193,["81"] = 189,["82"] = 199,["83"] = 200,["84"] = 201,["85"] = 202,["87"] = 204,["88"] = 199,["89"] = 211,["90"] = 212,["91"] = 211,["92"] = 220,["93"] = 221,["94"] = 220,["95"] = 229,["96"] = 230,["97"] = 229,["98"] = 236,["99"] = 237,["100"] = 236,["101"] = 245,["102"] = 246,["103"] = 245,["104"] = 254,["105"] = 255,["106"] = 254,["107"] = 263,["108"] = 264,["109"] = 265,["110"] = 266,["111"] = 263,["112"] = 272,["113"] = 273,["114"] = 272,["115"] = 282,["116"] = 283,["117"] = 282,["118"] = 291,["119"] = 292,["120"] = 293,["121"] = 294,["122"] = 291,["123"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local UnitStateUtil = ____exports.default
UnitStateUtil.name = "UnitStateUtil"
function UnitStateUtil.prototype.____constructor(self)
end
function UnitStateUtil.getMaxLife(self, unitHandle)
    return GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE)
end
function UnitStateUtil.setMaxLife(self, unitHandle, newVal)
    SetUnitState(unitHandle, UNIT_STATE_MAX_LIFE, newVal)
end
function UnitStateUtil.addMaxLife(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UNIT_STATE_MAX_LIFE, addVal)
end
function UnitStateUtil.addMaxLifeAndLife(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UNIT_STATE_MAX_LIFE, addVal)
    ____exports.default:addUnitState(unitHandle, UNIT_STATE_LIFE, addVal)
end
function UnitStateUtil.getLife(self, unitHandle)
    return GetUnitState(unitHandle, UNIT_STATE_LIFE)
end
function UnitStateUtil.setLife(self, unitHandle, newVal)
    SetUnitState(unitHandle, UNIT_STATE_LIFE, newVal)
end
function UnitStateUtil.addLife(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UNIT_STATE_LIFE, addVal)
end
function UnitStateUtil.getMaxMana(self, unitHandle)
    return GetUnitState(unitHandle, UNIT_STATE_MAX_MANA)
end
function UnitStateUtil.setMaxMana(self, unitHandle, newVal)
    SetUnitState(unitHandle, UNIT_STATE_MAX_MANA, newVal)
end
function UnitStateUtil.addMaxMana(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UNIT_STATE_MAX_MANA, addVal)
end
function UnitStateUtil.addMaxManaAndMana(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UNIT_STATE_MAX_MANA, addVal)
    ____exports.default:addUnitState(unitHandle, UNIT_STATE_MANA, addVal)
end
function UnitStateUtil.getMana(self, unitHandle)
    return GetUnitState(unitHandle, UNIT_STATE_MANA)
end
function UnitStateUtil.setMana(self, unitHandle, newVal)
    SetUnitState(unitHandle, UNIT_STATE_MANA, newVal)
end
function UnitStateUtil.addMana(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UNIT_STATE_MANA, addVal)
end
function UnitStateUtil.getDamageMax(self, unitHandle)
    return GetUnitState(unitHandle, UnitStateDamageMax)
end
function UnitStateUtil.setDamageBase(self, unitHandle, newVal)
    SetUnitState(unitHandle, UnitStateDamageBase, newVal)
end
function UnitStateUtil.addDamageBase(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UnitStateDamageBase, addVal)
end
function UnitStateUtil.getDamageRange(self, unitHandle)
    return GetUnitState(unitHandle, UnitStateDamageRange)
end
function UnitStateUtil.setDamageRange(self, unitHandle, newVal)
    SetUnitState(unitHandle, UnitStateDamageRange, newVal)
end
function UnitStateUtil.addDamageRange(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UnitStateDamageRange, addVal)
end
function UnitStateUtil.getDamageCool(self, unitHandle)
    return GetUnitState(unitHandle, UnitStateDamageCool)
end
function UnitStateUtil.setDamageCool(self, unitHandle, newVal)
    if newVal < 0.001 then
        newVal = 0.001
    end
    SetUnitState(unitHandle, UnitStateDamageCool, newVal)
end
function UnitStateUtil.addDamageCool(self, unitHandle, addVal)
    local newVal = GetUnitState(unitHandle, UnitStateDamageCool) + addVal
    if newVal < 0.001 then
        newVal = 0.001
    end
    SetUnitState(unitHandle, UnitStateDamageCool, newVal)
end
function UnitStateUtil.getAttackSpeed(self, unitHandle)
    return GetUnitState(unitHandle, UnitStateAttackSpeed)
end
function UnitStateUtil.setAttackSpeed(self, unitHandle, newVal)
    SetUnitState(unitHandle, UnitStateAttackSpeed, newVal)
end
function UnitStateUtil.addAttackSpeed(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UnitStateAttackSpeed, addVal)
end
function UnitStateUtil.getArmor(self, unitHandle)
    return GetUnitState(unitHandle, UnitStateArmor)
end
function UnitStateUtil.setArmor(self, unitHandle, newVal)
    SetUnitState(unitHandle, UnitStateArmor, newVal)
end
function UnitStateUtil.addArmor(self, unitHandle, addVal)
    ____exports.default:addUnitState(unitHandle, UnitStateArmor, addVal)
end
function UnitStateUtil.addUnitState(self, unitHandle, whichUnitState, addVal)
    local newVal = GetUnitState(unitHandle, whichUnitState) + addVal
    SetUnitState(unitHandle, whichUnitState, newVal)
    return newVal
end
function UnitStateUtil.getMoveSpeed(self, unitHandle)
    return GetUnitMoveSpeed(unitHandle)
end
function UnitStateUtil.setMoveSpeed(self, unitHandle, newSpeed)
    SetUnitMoveSpeed(unitHandle, newSpeed)
end
function UnitStateUtil.addMoveSpeed(self, unitHandle, addSpeed)
    local newVal = GetUnitMoveSpeed(unitHandle) + addSpeed
    SetUnitMoveSpeed(unitHandle, newVal)
    return newVal
end
____exports.default = UnitStateUtil
return ____exports
