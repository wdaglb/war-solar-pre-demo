local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 8,["16"] = 8,["17"] = 10,["18"] = 10,["19"] = 10,["20"] = 10,["22"] = 10,["23"] = 14,["28"] = 23,["36"] = 30,["44"] = 37,["52"] = 41,["60"] = 45,["64"] = 12,["65"] = 10});
local ____exports = {}
local ____UnitEvent = require("solar.tool.event.UnitEvent")
local UnitEvent = ____UnitEvent.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____item = require("solar.w3ts.handles.item")
local Item = ____item.Item
____exports.default = __TS__Class()
local UnitItemEvent = ____exports.default
UnitItemEvent.name = "UnitItemEvent"
__TS__ClassExtends(UnitItemEvent, UnitEvent)
function UnitItemEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItem",
    {get = function(self)
        return GetManipulatedItem()
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemObj",
    {get = function(self)
        return Item:fromHandle(GetManipulatedItem())
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemSolarData",
    {get = function(self)
        return DataBase:getItemSolarData(GetManipulatedItem())
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemTypeSolarData",
    {get = function(self)
        return DataBase:getItemTypeSolarData(id2string(GetItemTypeId(GetManipulatedItem())))
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemAttribute",
    {get = function(self)
        return AttributeUtil:getItemAttribute(GetManipulatedItem())
    end},
    true
)
UnitItemEvent.instance = __TS__New(____exports.default)
____exports.default = UnitItemEvent
return ____exports
