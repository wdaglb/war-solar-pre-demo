local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 9,["22"] = 9,["23"] = 13,["28"] = 21,["36"] = 28,["44"] = 35,["52"] = 39,["60"] = 46,["68"] = 50,["76"] = 54,["84"] = 58,["92"] = 65,["100"] = 69,["104"] = 11,["105"] = 9});
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
local UnitDeathEvent = ____exports.default
UnitDeathEvent.name = "UnitDeathEvent"
__TS__ClassExtends(UnitDeathEvent, UnitEvent)
function UnitDeathEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnit",
    {get = function(self)
        return GetKillingUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitObj",
    {get = function(self)
        return Unit:fromHandle(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitSolarData",
    {get = function(self)
        return DataBase:getUnitSolarData(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitTypeSolarData",
    {get = function(self)
        return DataBase:getUnitTypeSolarData(id2string(GetUnitTypeId(GetKillingUnit())))
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitX",
    {get = function(self)
        return GetUnitX(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitY",
    {get = function(self)
        return GetUnitY(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitFacing",
    {get = function(self)
        return GetUnitFacing(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitOwner",
    {get = function(self)
        return GetOwningPlayer(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetKillingUnit()))
    end},
    true
)
UnitDeathEvent.instance = __TS__New(____exports.default)
____exports.default = UnitDeathEvent
return ____exports
