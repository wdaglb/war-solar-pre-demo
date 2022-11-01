local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 8,["15"] = 8,["16"] = 8,["18"] = 12,["23"] = 21,["31"] = 28,["39"] = 35,["47"] = 39,["55"] = 46,["63"] = 50,["71"] = 54,["79"] = 58,["87"] = 65,["95"] = 69,["99"] = 10,["100"] = 8});
local ____exports = {}
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____unit = require("solar.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local UnitEvent = ____exports.default
UnitEvent.name = "UnitEvent"
function UnitEvent.prototype.____constructor(self)
end
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnit",
    {get = function(self)
        return GetTriggerUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitObj",
    {get = function(self)
        return Unit:fromHandle(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitSolarData",
    {get = function(self)
        return DataBase:getUnitSolarData(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitTypeSolarData",
    {get = function(self)
        return DataBase:getUnitTypeSolarData(id2string(GetUnitTypeId(GetTriggerUnit())))
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitX",
    {get = function(self)
        return GetUnitX(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitY",
    {get = function(self)
        return GetUnitY(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitFacing",
    {get = function(self)
        return GetUnitFacing(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitOwner",
    {get = function(self)
        return GetOwningPlayer(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
    end},
    true
)
UnitEvent.instance = __TS__New(____exports.default)
____exports.default = UnitEvent
return ____exports
