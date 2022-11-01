local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 11,["16"] = 11,["17"] = 11,["19"] = 18,["20"] = 19,["23"] = 23,["24"] = 24,["25"] = 25,["26"] = 26,["27"] = 27,["28"] = 28,["29"] = 29,["30"] = 30,["31"] = 31,["32"] = 32,["34"] = 26,["35"] = 37,["36"] = 39,["37"] = 40,["38"] = 41,["39"] = 42,["40"] = 41,["41"] = 40,["42"] = 17,["43"] = 52,["44"] = 53,["45"] = 54,["47"] = 56,["50"] = 62,["51"] = 63,["53"] = 65,["54"] = 66,["55"] = 67,["56"] = 68,["58"] = 73,["59"] = 74,["60"] = 75,["62"] = 78,["63"] = 79,["64"] = 80,["65"] = 82,["67"] = 85,["68"] = 86,["69"] = 87,["71"] = 89,["72"] = 90,["73"] = 91,["74"] = 93,["76"] = 96,["77"] = 97,["78"] = 98,["80"] = 100,["81"] = 101,["82"] = 102,["83"] = 104,["85"] = 107,["86"] = 108,["87"] = 109,["89"] = 113,["90"] = 114,["92"] = 117,["93"] = 118,["95"] = 121,["96"] = 122,["98"] = 125,["99"] = 126,["100"] = 127,["101"] = 128,["102"] = 129,["103"] = 130,["104"] = 131,["106"] = 134,["107"] = 135,["109"] = 137,["110"] = 138,["111"] = 139,["112"] = 140,["114"] = 142,["115"] = 143,["117"] = 145,["118"] = 146,["119"] = 147,["120"] = 148,["122"] = 150,["123"] = 151,["125"] = 153,["126"] = 154,["127"] = 155,["128"] = 156,["130"] = 159,["131"] = 159,["132"] = 159,["133"] = 159,["134"] = 159,["135"] = 159,["136"] = 159,["137"] = 52,["138"] = 12,["139"] = 11});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____UnitUtil = require("solar.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____SingletonUtil = require("solar.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local UnitAttributeState = ____exports.default
UnitAttributeState.name = "UnitAttributeState"
function UnitAttributeState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new UnitAttributeState()")
        return
    end
    local enterRectTrigger = __TS__New(Trigger)
    enterRectTrigger:registerEnterRect(GetPlayableMapRect())
    enterRectTrigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    enterRectTrigger:addAction(function()
        local triggerUnit = GetTriggerUnit()
        local typeStr = id2string(GetUnitTypeId(triggerUnit))
        local utsa = ____exports.default.config[typeStr]
        if utsa then
            AttributeUtil:setUnitAttribute(triggerUnit, utsa, true)
            ____exports.default:refreshUnitSolarAtrribute(triggerUnit, utsa)
        end
    end)
    local triggerTimer = __TS__New(Trigger)
    triggerTimer:registerTimerEvent(3.97, true)
    triggerTimer:addAction(function()
        AttributeUtil:forAllUnitsAttribute(function(____, unitHandle, atrribute)
            ____exports.default:refreshUnitSolarAtrribute(unitHandle, atrribute)
        end)
    end)
end
function UnitAttributeState.refreshUnitSolarAtrribute(self, unitHandle, atrribute)
    if not atrribute then
        atrribute = AttributeUtil:getUnitAttribute(unitHandle)
    end
    if not atrribute then
        return
    end
    if atrribute.attack then
        UnitUtil.setExtraAttack(unitHandle, atrribute.attack or 0, "_SLA_attack")
    end
    if atrribute.attack_p then
        local base = GetUnitState(unitHandle, UnitStateDamageBase)
        local val = (atrribute.attack_p or 0) * base
        UnitUtil.setExtraAttack(unitHandle, val, "_SLA_attack_p")
    end
    if atrribute.life then
        local val = atrribute.life or 0
        UnitUtil.setExtraHp(unitHandle, val, "_SLA_life")
    end
    if atrribute.life_p then
        local base = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) - UnitUtil.getExtraHp(unitHandle, "_SLA_life_p")
        local val = (atrribute.life_p or 0) * base
        UnitUtil.setExtraHp(unitHandle, val, "_SLA_life_p")
    end
    if atrribute.mana then
        local val = atrribute.mana and atrribute.mana or 0
        UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana")
    end
    if atrribute.mana_p then
        local base = GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) - UnitUtil.getExtraMana(unitHandle, "_SLA_mana_p")
        local val = (atrribute.mana_p or 0) * base
        UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana_p")
    end
    if atrribute.def ~= nil then
        local val = atrribute.def or 0
        UnitUtil.setExtraDef(unitHandle, val, "_SLA_def")
    end
    if atrribute.def_p ~= nil then
        local base = GetUnitState(unitHandle, UnitStateArmor)
        local val = (atrribute.def_p or 0) * base
        UnitUtil.setExtraDef(unitHandle, val, "_SLA_def_p")
    end
    if atrribute.attackSpd_p ~= nil then
        local val = atrribute.attackSpd_p
        UnitUtil.setExtraAttackSpd(unitHandle, val, "_SLA_attackSpd_p")
    end
    if atrribute.damage_cool ~= nil then
        UnitUtil.setExtraDamageCool(unitHandle, atrribute.damage_cool, "_SLA_damage_cool")
    end
    if atrribute.damage_range ~= nil then
        UnitUtil.setExtraDamageRange(unitHandle, atrribute.damage_range, "_SLA_damage_range")
    end
    if atrribute.move_speed ~= nil then
        UnitUtil.setExtraMoveSpeed(unitHandle, atrribute.move_speed, "_SLA_move_speed")
    end
    local strength = atrribute.full_property or 0
    local agility = strength
    local intelligence = strength
    if atrribute.full_property_p then
        strength = strength + (atrribute.full_property_p or 0) * GetHeroStr(unitHandle, false)
        agility = agility + (atrribute.full_property_p or 0) * GetHeroAgi(unitHandle, false)
        intelligence = intelligence + (atrribute.full_property_p or 0) * GetHeroInt(unitHandle, false)
    end
    if atrribute.strength then
        strength = strength + atrribute.strength
    end
    if atrribute.strength_p then
        local base = GetHeroStr(unitHandle, false)
        local val = (atrribute.strength_p or 0) * base
        strength = strength + val
    end
    if atrribute.agility then
        agility = agility + atrribute.agility
    end
    if atrribute.agility_p then
        local base = GetHeroAgi(unitHandle, false)
        local val = (atrribute.agility_p or 0) * base
        agility = agility + val
    end
    if atrribute.intelligence then
        intelligence = intelligence + atrribute.intelligence
    end
    if atrribute.intelligence_p then
        local base = GetHeroInt(unitHandle, false)
        local val = (atrribute.intelligence_p or 0) * base
        intelligence = intelligence + val
    end
    UnitUtil.setExtraStrAgiInt(
        unitHandle,
        "_SLA_StrAgiInt",
        strength,
        agility,
        intelligence
    )
end
UnitAttributeState.config = {}
____exports.default = UnitAttributeState
return ____exports
