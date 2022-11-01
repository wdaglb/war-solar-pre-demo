local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 8,["20"] = 8,["21"] = 12,["26"] = 20,["34"] = 27,["42"] = 31,["50"] = 35,["58"] = 39,["66"] = 43,["74"] = 50,["82"] = 54,["86"] = 10,["87"] = 8});
local ____exports = {}
local ____UnitEvent = require("solar.tool.event.UnitEvent")
local UnitEvent = ____UnitEvent.default
local ____unit = require("solar.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local UnitSpellEvent = ____exports.default
UnitSpellEvent.name = "UnitSpellEvent"
__TS__ClassExtends(UnitSpellEvent, UnitEvent)
function UnitSpellEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnit",
    {get = function(self)
        return GetSpellTargetUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitObj",
    {get = function(self)
        return Unit:fromHandle(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitX",
    {get = function(self)
        return GetUnitX(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitY",
    {get = function(self)
        return GetUnitY(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitFacing",
    {get = function(self)
        return GetUnitFacing(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitOwner",
    {get = function(self)
        return GetOwningPlayer(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetSpellTargetUnit()))
    end},
    true
)
UnitSpellEvent.instance = __TS__New(____exports.default)
____exports.default = UnitSpellEvent
return ____exports
