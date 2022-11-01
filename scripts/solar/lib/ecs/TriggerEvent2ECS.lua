local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 9,["23"] = 11,["24"] = 11,["25"] = 11,["27"] = 11,["28"] = 13,["29"] = 14,["30"] = 15,["31"] = 16,["32"] = 19,["33"] = 20,["34"] = 21,["35"] = 22,["36"] = 13,["37"] = 27,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 32,["49"] = 36,["50"] = 30,["51"] = 27,["52"] = 40,["53"] = 41,["54"] = 42,["55"] = 43,["56"] = 44,["57"] = 45,["58"] = 46,["59"] = 47,["60"] = 48,["61"] = 51,["62"] = 52,["63"] = 45,["64"] = 55,["65"] = 56,["66"] = 57,["67"] = 58,["68"] = 59,["69"] = 60,["70"] = 60,["71"] = 60,["72"] = 61,["73"] = 62,["74"] = 63,["75"] = 66,["76"] = 67,["77"] = 60,["78"] = 60,["79"] = 70,["80"] = 71,["81"] = 57,["82"] = 40,["83"] = 11});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BaseEntity = require("solar.lib.ecs.BaseEntity")
local BaseEntity = ____BaseEntity.default
local ____UnitAttackedEventCom = require("solar.lib.ecs.UnitAttackedEventCom")
local UnitAttackedEventCom = ____UnitAttackedEventCom.UnitAttackedEventCom
local ____unit = require("solar.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____EntityDecaySystem = require("solar.lib.ecs.EntityDecaySystem")
local EntityDecaySystem = ____EntityDecaySystem.default
local ____UpdateCom = require("solar.lib.ecs.UpdateCom")
local UpdateCom = ____UpdateCom.default
local ____UnitCom = require("solar.lib.ecs.UnitCom")
local UnitCom = ____UnitCom.default
local ____UnitSystem = require("solar.lib.ecs.UnitSystem")
local UnitSystem = ____UnitSystem.default
____exports.default = __TS__Class()
local TriggerEvent2ECS = ____exports.default
TriggerEvent2ECS.name = "TriggerEvent2ECS"
function TriggerEvent2ECS.prototype.____constructor(self)
end
function TriggerEvent2ECS.init(self, world)
    local baseEntity = __TS__New(BaseEntity)
    baseEntity:add(__TS__New(UpdateCom, {}))
    world:addEntity(baseEntity)
    self:addUnitAttackedEvent(world)
    self:addUnitEnterMap(world)
    world:addSystem(__TS__New(UnitSystem))
    world:addSystem(__TS__New(EntityDecaySystem))
end
function TriggerEvent2ECS.addUnitAttackedEvent(self, world)
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED)
    trigger:addAction(function()
        local baseEntity = __TS__New(BaseEntity, 10000)
        baseEntity:add(__TS__New(
            UnitAttackedEventCom,
            {
                attacker = Unit:fromHandle(GetAttacker()),
                attackedUnit = Unit:fromHandle(GetTriggerUnit())
            }
        ))
        world:addEntity(baseEntity)
    end)
end
function TriggerEvent2ECS.addUnitEnterMap(self, world)
    local trigger = __TS__New(Trigger)
    local rectRegion = CreateRegion()
    RegionAddRect(rectRegion, bj_mapInitialPlayableArea)
    trigger:registerEnterRegion(rectRegion, nil)
    trigger:addAction(function()
        local baseEntity = __TS__New(BaseEntity)
        local unit = Unit:fromHandle(GetTriggerUnit())
        baseEntity:add(__TS__New(UnitCom, {value = unit}))
        unit.entity = baseEntity
        world:addEntity(baseEntity)
    end)
    local onTimeTrigger = __TS__New(Trigger)
    onTimeTrigger:registerTimerEvent(0, false)
    onTimeTrigger:addAction(function()
        local groupHandle = CreateGroup()
        GroupEnumUnitsInRect(groupHandle, bj_mapInitialPlayableArea, nil)
        ForGroup(
            groupHandle,
            function()
                local baseEntity = __TS__New(BaseEntity)
                local unit = Unit:fromHandle(GetEnumUnit())
                baseEntity:add(__TS__New(UnitCom, {value = unit}))
                unit.entity = baseEntity
                world:addEntity(baseEntity)
            end
        )
        DestroyGroup(groupHandle)
        onTimeTrigger:destroy()
    end)
end
____exports.default = TriggerEvent2ECS
return ____exports
