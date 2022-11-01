local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 15,["16"] = 15,["17"] = 15,["19"] = 16,["20"] = 16,["22"] = 16,["23"] = 16,["25"] = 17,["26"] = 17,["28"] = 17,["29"] = 17,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 19,["36"] = 19,["37"] = 19,["38"] = 19,["39"] = 19,["40"] = 19,["41"] = 19,["42"] = 15,["43"] = 33,["44"] = 33,["45"] = 33,["47"] = 34,["48"] = 34,["50"] = 34,["51"] = 34,["53"] = 35,["54"] = 35,["56"] = 35,["57"] = 35,["59"] = 36,["60"] = 37,["61"] = 38,["62"] = 39,["63"] = 39,["64"] = 39,["65"] = 39,["66"] = 39,["67"] = 39,["68"] = 39,["69"] = 39,["70"] = 39,["71"] = 39,["72"] = 40,["73"] = 33,["74"] = 57,["75"] = 57,["76"] = 57,["78"] = 58,["79"] = 58,["81"] = 58,["82"] = 58,["84"] = 59,["85"] = 59,["87"] = 59,["88"] = 59,["90"] = 60,["91"] = 60,["93"] = 60,["94"] = 60,["96"] = 61,["97"] = 62,["98"] = 62,["99"] = 62,["100"] = 62,["101"] = 63,["102"] = 63,["103"] = 63,["104"] = 63,["105"] = 63,["106"] = 63,["107"] = 63,["108"] = 63,["109"] = 63,["110"] = 63,["111"] = 62,["112"] = 62,["113"] = 57,["114"] = 80,["115"] = 80,["116"] = 80,["118"] = 81,["119"] = 81,["121"] = 81,["122"] = 81,["124"] = 82,["125"] = 82,["127"] = 82,["128"] = 82,["130"] = 83,["131"] = 83,["133"] = 83,["134"] = 83,["136"] = 84,["137"] = 85,["138"] = 86,["139"] = 87,["140"] = 87,["141"] = 87,["142"] = 87,["143"] = 88,["144"] = 88,["145"] = 88,["146"] = 88,["147"] = 88,["148"] = 88,["149"] = 88,["150"] = 88,["151"] = 88,["152"] = 88,["153"] = 87,["154"] = 87,["155"] = 90,["156"] = 80,["157"] = 97,["158"] = 98,["159"] = 97,["160"] = 104,["161"] = 105,["162"] = 104,["163"] = 111,["164"] = 112,["165"] = 111,["166"] = 119,["167"] = 120,["168"] = 119,["169"] = 127,["170"] = 128,["171"] = 127,["172"] = 135,["173"] = 136,["174"] = 135,["175"] = 143,["176"] = 144,["178"] = 145,["179"] = 145,["180"] = 146,["181"] = 145,["184"] = 148,["185"] = 143,["186"] = 6,["187"] = 4});
local ____exports = {}
local ____DamageType = require("solar.constant.DamageType")
local DamageType = ____DamageType.default
local ____SelectUtil = require("solar.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
____exports.default = __TS__Class()
local DamageUtil = ____exports.default
DamageUtil.name = "DamageUtil"
function DamageUtil.prototype.____constructor(self)
end
function DamageUtil.damageTarget(self, whichUnit, target, damage, damageTypeId, attackType, weaponType, ranged, attack)
    if damageTypeId == nil then
        damageTypeId = DamageType.T4_NORMAL
    end
    if attackType == nil then
        attackType = ATTACK_TYPE_NORMAL
    end
    if weaponType == nil then
        weaponType = WEAPON_TYPE_WHOKNOWS
    end
    if ranged == nil then
        ranged = true
    end
    if attack == nil then
        attack = false
    end
    local dt = ____exports.default.damageTypes[damageTypeId + 1]
    return UnitDamageTarget(
        whichUnit,
        target,
        damage,
        attack,
        ranged,
        attackType,
        dt,
        weaponType
    )
end
function DamageUtil.damageTargetSL(self, whichUnit, target, damage, damageTypeId, attackType, weaponType, ranged, attack)
    if damageTypeId == nil then
        damageTypeId = DamageType.T4_NORMAL
    end
    if attackType == nil then
        attackType = ATTACK_TYPE_NORMAL
    end
    if weaponType == nil then
        weaponType = WEAPON_TYPE_WHOKNOWS
    end
    if ranged == nil then
        ranged = true
    end
    if attack == nil then
        attack = false
    end
    local oldFlag = isSolarDamageEnable
    isSolarDamageEnable = true
    local dt = ____exports.default.damageTypes[damageTypeId + 1]
    UnitDamageTarget(
        whichUnit,
        target,
        damage,
        attack,
        ranged,
        attackType,
        dt,
        weaponType
    )
    isSolarDamageEnable = oldFlag
end
function DamageUtil.damageEnemyUnitsInRange(self, whichUnit, radius, damage, damageTypeId, x, y, attackType, weaponType, ranged, attack)
    if damageTypeId == nil then
        damageTypeId = DamageType.T4_NORMAL
    end
    if x == nil then
        x = GetUnitX(whichUnit)
    end
    if y == nil then
        y = GetUnitY(whichUnit)
    end
    if attackType == nil then
        attackType = ATTACK_TYPE_NORMAL
    end
    if weaponType == nil then
        weaponType = WEAPON_TYPE_WHOKNOWS
    end
    if ranged == nil then
        ranged = true
    end
    if attack == nil then
        attack = false
    end
    local dt = ____exports.default.damageTypes[damageTypeId + 1]
    SelectUtil.forEnemyUnitsInRange(
        whichUnit,
        radius,
        function(____, enemy)
            UnitDamageTarget(
                whichUnit,
                enemy,
                damage,
                attack,
                ranged,
                attackType,
                dt,
                weaponType
            )
        end
    )
end
function DamageUtil.damageEnemyUnitsInRangeSL(self, whichUnit, radius, damage, damageTypeId, x, y, attackType, weaponType, ranged, attack)
    if damageTypeId == nil then
        damageTypeId = DamageType.T4_NORMAL
    end
    if x == nil then
        x = GetUnitX(whichUnit)
    end
    if y == nil then
        y = GetUnitY(whichUnit)
    end
    if attackType == nil then
        attackType = ATTACK_TYPE_NORMAL
    end
    if weaponType == nil then
        weaponType = WEAPON_TYPE_WHOKNOWS
    end
    if ranged == nil then
        ranged = true
    end
    if attack == nil then
        attack = false
    end
    local dt = ____exports.default.damageTypes[damageTypeId + 1]
    local oldFlag = isSolarDamageEnable
    isSolarDamageEnable = true
    SelectUtil.forEnemyUnitsInRange(
        whichUnit,
        radius,
        function(____, enemy)
            UnitDamageTarget(
                whichUnit,
                enemy,
                damage,
                attack,
                ranged,
                attackType,
                dt,
                weaponType
            )
        end
    )
    isSolarDamageEnable = oldFlag
end
function DamageUtil.isEventPhysicalDamage(self)
    return 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL)
end
function DamageUtil.isEventAttackDamage(self)
    return 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)
end
function DamageUtil.isEventRangedDamage(self)
    return 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED)
end
function DamageUtil.isEventDamageType(self, damageType)
    return damageType == ConvertDamageType(EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE))
end
function DamageUtil.isEventWeaponType(self, weaponType)
    return weaponType == ConvertWeaponType(EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE))
end
function DamageUtil.isEventAttackType(self, attackType)
    return attackType == ConvertAttackType(EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE))
end
function DamageUtil.createDamageTypes(self)
    local ds = {}
    do
        local i = 0
        while i < 32 do
            ds[i + 1] = ConvertDamageType(i)
            i = i + 1
        end
    end
    return ds
end
DamageUtil.damageTypes = ____exports.default:createDamageTypes()
____exports.default = DamageUtil
return ____exports
