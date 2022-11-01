local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 35,["19"] = 35,["20"] = 35,["22"] = 36,["23"] = 37,["26"] = 40,["27"] = 42,["29"] = 44,["30"] = 45,["31"] = 46,["32"] = 47,["33"] = 35,["34"] = 30,["35"] = 31,["36"] = 31,["37"] = 30,["38"] = 51,["39"] = 52,["40"] = 54,["43"] = 58,["44"] = 59,["45"] = 61,["48"] = 64,["49"] = 64,["50"] = 64,["51"] = 64,["54"] = 67,["55"] = 68,["56"] = 69,["57"] = 70,["58"] = 71,["59"] = 72,["61"] = 74,["64"] = 80,["65"] = 81,["66"] = 88,["67"] = 88,["68"] = 88,["69"] = 88,["70"] = 88,["71"] = 88,["72"] = 88,["73"] = 88,["74"] = 88,["75"] = 88,["76"] = 88,["77"] = 88,["78"] = 88,["79"] = 88,["80"] = 105,["81"] = 106,["82"] = 107,["83"] = 108,["84"] = 109,["88"] = 113,["89"] = 116,["90"] = 51,["91"] = 125,["92"] = 127,["93"] = 128,["94"] = 130,["95"] = 130,["96"] = 130,["97"] = 130,["99"] = 130,["100"] = 132,["101"] = 132,["102"] = 132,["103"] = 132,["105"] = 132,["106"] = 134,["107"] = 134,["108"] = 134,["109"] = 134,["111"] = 134,["112"] = 135,["115"] = 139,["116"] = 139,["117"] = 139,["119"] = 139,["120"] = 141,["121"] = 141,["122"] = 141,["123"] = 141,["125"] = 141,["126"] = 143,["127"] = 143,["128"] = 143,["129"] = 143,["131"] = 143,["132"] = 144,["136"] = 150,["137"] = 151,["138"] = 151,["139"] = 151,["141"] = 151,["142"] = 152,["144"] = 158,["145"] = 158,["146"] = 158,["147"] = 158,["149"] = 158,["150"] = 165,["151"] = 165,["152"] = 165,["154"] = 165,["155"] = 166,["158"] = 172,["159"] = 173,["160"] = 173,["161"] = 173,["163"] = 173,["164"] = 174,["166"] = 181,["167"] = 181,["168"] = 181,["170"] = 181,["171"] = 182,["172"] = 183,["173"] = 183,["174"] = 183,["175"] = 183,["176"] = 183,["177"] = 183,["178"] = 183,["179"] = 183,["181"] = 187,["182"] = 125,["183"] = 21,["184"] = 12});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____MathUtil = require("solar.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____SingletonUtil = require("solar.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local SolarDamageState = ____exports.default
SolarDamageState.name = "SolarDamageState"
function SolarDamageState.prototype.____constructor(self, useBaseAttribute)
    if useBaseAttribute == nil then
        useBaseAttribute = true
    end
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarDamageState()")
        return
    end
    if useBaseAttribute then
        ____exports.default:addEventHandler(____exports.default.calculateAttributeDamage)
    end
    isSolarDamageEnable = true
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitDamagedEvent()
    trigger:addAction(self.action)
end
function SolarDamageState.addEventHandler(self, eventHandler)
    local ____exports_default_config_damageEventHandlers_0 = ____exports.default.config.damageEventHandlers
    ____exports_default_config_damageEventHandlers_0[#____exports_default_config_damageEventHandlers_0 + 1] = eventHandler
end
function SolarDamageState.prototype.action()
    local eventDamage = GetEventDamage()
    if eventDamage <= 0 then
        return
    end
    local unit0 = GetTriggerUnit()
    local unit1 = GetEventDamageSource()
    if not IsHandle(unit1) then
        return
    end
    if IsUnitAlly(
        unit0,
        GetOwningPlayer(unit1)
    ) then
        return
    end
    local isAttack = 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)
    if isBigAttributeMode then
        local u1Attack = GetUnitState(unit1, UnitStateDamageMax)
        local u0Armor = GetUnitState(unit0, UnitStateArmor)
        eventDamage = u1Attack * (1 - MathUtil.armorReduction(u0Armor))
        EXSetEventDamage(eventDamage)
    end
    if not isSolarDamageEnable then
        return
    end
    local u0sa = AttributeUtil:getUnitAttribute(unit0)
    local u1sa = AttributeUtil:getUnitAttribute(unit1)
    local event = {
        baseDamage = eventDamage,
        damageType = EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE),
        weaponType = EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE),
        unit0 = unit0,
        unit1 = unit1,
        u0sa = u0sa,
        u1sa = u1sa,
        isAttack = isAttack,
        isRanged = 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED),
        isPhysical = 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL),
        isCritical = false,
        resultDamage = eventDamage
    }
    isSolarDamageEnable = false
    for ____, damageEventHandler in ipairs(____exports.default.config.damageEventHandlers) do
        damageEventHandler(nil, event)
        if event.consumed then
            isSolarDamageEnable = true
            return
        end
    end
    isSolarDamageEnable = true
    EXSetEventDamage(event.resultDamage)
end
function SolarDamageState.calculateAttributeDamage(self, event)
    local newResultDamage = event.resultDamage
    if event.isPhysical then
        local ____newResultDamage_3 = newResultDamage
        local ____event_u1sa_physical_damage_increased_1 = event.u1sa
        if ____event_u1sa_physical_damage_increased_1 ~= nil then
            ____event_u1sa_physical_damage_increased_1 = ____event_u1sa_physical_damage_increased_1.physical_damage_increased
        end
        newResultDamage = ____newResultDamage_3 * ((____event_u1sa_physical_damage_increased_1 or 0) + 1)
        local ____GetRandomReal_result_6 = GetRandomReal(0, 1)
        local ____event_u1sa_physical_critical_chance_4 = event.u1sa
        if ____event_u1sa_physical_critical_chance_4 ~= nil then
            ____event_u1sa_physical_critical_chance_4 = ____event_u1sa_physical_critical_chance_4.physical_critical_chance
        end
        if ____GetRandomReal_result_6 < (____event_u1sa_physical_critical_chance_4 or 0) then
            local ____newResultDamage_9 = newResultDamage
            local ____event_u1sa_physical_critical_damage_7 = event.u1sa
            if ____event_u1sa_physical_critical_damage_7 ~= nil then
                ____event_u1sa_physical_critical_damage_7 = ____event_u1sa_physical_critical_damage_7.physical_critical_damage
            end
            newResultDamage = ____newResultDamage_9 * ((____event_u1sa_physical_critical_damage_7 or 0) + 1)
            event.isCritical = true
        end
    else
        local ____event_u1sa_magic_damage_increased_10 = event.u1sa
        if ____event_u1sa_magic_damage_increased_10 ~= nil then
            ____event_u1sa_magic_damage_increased_10 = ____event_u1sa_magic_damage_increased_10.magic_damage_increased
        end
        newResultDamage = newResultDamage * ((____event_u1sa_magic_damage_increased_10 or 0) + 1)
        local ____GetRandomReal_result_14 = GetRandomReal(0, 1)
        local ____event_u1sa_magic_critical_chance_12 = event.u1sa
        if ____event_u1sa_magic_critical_chance_12 ~= nil then
            ____event_u1sa_magic_critical_chance_12 = ____event_u1sa_magic_critical_chance_12.magic_critical_chance
        end
        if ____GetRandomReal_result_14 < (____event_u1sa_magic_critical_chance_12 or 0) then
            local ____newResultDamage_17 = newResultDamage
            local ____event_u1sa_magic_critical_damage_15 = event.u1sa
            if ____event_u1sa_magic_critical_damage_15 ~= nil then
                ____event_u1sa_magic_critical_damage_15 = ____event_u1sa_magic_critical_damage_15.magic_critical_damage
            end
            newResultDamage = ____newResultDamage_17 * ((____event_u1sa_magic_critical_damage_15 or 0) + 1)
            event.isCritical = true
        end
    end
    --- 根据伤害类型 增伤
    local damage_increased_dt_x = "damage_increased_dt_" .. tostring(event.damageType)
    local ____event_u1sa_damage_increased_dt_x_18 = event.u1sa
    if ____event_u1sa_damage_increased_dt_x_18 ~= nil then
        ____event_u1sa_damage_increased_dt_x_18 = ____event_u1sa_damage_increased_dt_x_18[damage_increased_dt_x]
    end
    if ____event_u1sa_damage_increased_dt_x_18 then
        newResultDamage = newResultDamage * (1 + event.u1sa[damage_increased_dt_x])
    end
    local ____newResultDamage_22 = newResultDamage
    local ____event_u1sa_damage_increased_20 = event.u1sa
    if ____event_u1sa_damage_increased_20 ~= nil then
        ____event_u1sa_damage_increased_20 = ____event_u1sa_damage_increased_20.damage_increased
    end
    newResultDamage = ____newResultDamage_22 * ((____event_u1sa_damage_increased_20 or 0) + 1)
    local ____event_u0sa_damage_reduction_23 = event.u0sa
    if ____event_u0sa_damage_reduction_23 ~= nil then
        ____event_u0sa_damage_reduction_23 = ____event_u0sa_damage_reduction_23.damage_reduction
    end
    if ____event_u0sa_damage_reduction_23 then
        newResultDamage = newResultDamage * (1 - event.u0sa.damage_reduction)
    end
    --- 根据伤害类型 抗性 减伤
    local damage_reduction_dt_x = "damage_reduction_dt_" .. tostring(event.damageType)
    local ____event_u0sa_damage_reduction_dt_x_25 = event.u0sa
    if ____event_u0sa_damage_reduction_dt_x_25 ~= nil then
        ____event_u0sa_damage_reduction_dt_x_25 = ____event_u0sa_damage_reduction_dt_x_25[damage_reduction_dt_x]
    end
    if ____event_u0sa_damage_reduction_dt_x_25 then
        newResultDamage = newResultDamage * (1 + event.u0sa[damage_reduction_dt_x])
    end
    local ____event_u1sa_blood_sucking_27 = event.u1sa
    if ____event_u1sa_blood_sucking_27 ~= nil then
        ____event_u1sa_blood_sucking_27 = ____event_u1sa_blood_sucking_27.blood_sucking
    end
    if ____event_u1sa_blood_sucking_27 then
        local add_hp = newResultDamage * event.u1sa.blood_sucking
        SetUnitState(
            event.unit1,
            UNIT_STATE_LIFE,
            math.max(
                0,
                GetUnitState(event.unit1, UNIT_STATE_LIFE) + add_hp
            )
        )
    end
    event.resultDamage = newResultDamage
end
SolarDamageState.config = {damageEventHandlers = {}}
____exports.default = SolarDamageState
return ____exports
