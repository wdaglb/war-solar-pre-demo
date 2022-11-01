local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 9,["22"] = 9,["23"] = 13,["28"] = 21,["36"] = 28,["44"] = 35,["52"] = 42,["60"] = 49,["68"] = 56,["76"] = 60,["84"] = 64,["92"] = 68,["100"] = 75,["108"] = 79,["112"] = 11,["113"] = 9});
local ____exports = {}
local ____UnitEvent = require("solar.tool.event.UnitEvent")
local UnitEvent = ____UnitEvent.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____unit = require("solar.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local UnitDamagedEvent = ____exports.default
UnitDamagedEvent.name = "UnitDamagedEvent"
__TS__ClassExtends(UnitDamagedEvent, UnitEvent)
function UnitDamagedEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damage",
    {get = function(self)
        return GetEventDamage()
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSource",
    {get = function(self)
        return GetEventDamageSource()
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceObj",
    {get = function(self)
        return Unit:fromHandle(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceSolarData",
    {get = function(self)
        return DataBase:getUnitSolarData(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceTypeSolarData",
    {get = function(self)
        return DataBase:getUnitTypeSolarData(id2string(GetUnitTypeId(GetEventDamageSource())))
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceX",
    {get = function(self)
        return GetUnitX(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceY",
    {get = function(self)
        return GetUnitY(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceFacing",
    {get = function(self)
        return GetUnitFacing(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceOwner",
    {get = function(self)
        return GetOwningPlayer(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetEventDamageSource()))
    end},
    true
)
UnitDamagedEvent.instance = __TS__New(____exports.default)
____exports.default = UnitDamagedEvent
return ____exports
