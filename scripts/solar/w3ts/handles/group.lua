local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 7,["11"] = 7,["12"] = 9,["13"] = 9,["14"] = 11,["15"] = 11,["16"] = 11,["17"] = 11,["19"] = 14,["20"] = 11,["22"] = 11,["24"] = 17,["27"] = 13,["32"] = 91,["36"] = 25,["37"] = 26,["38"] = 25,["39"] = 29,["40"] = 30,["41"] = 29,["42"] = 33,["43"] = 34,["44"] = 33,["45"] = 37,["46"] = 38,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 37,["54"] = 41,["55"] = 42,["56"] = 42,["57"] = 42,["58"] = 42,["59"] = 42,["60"] = 42,["61"] = 42,["62"] = 42,["63"] = 41,["64"] = 45,["65"] = 46,["66"] = 45,["67"] = 49,["68"] = 50,["69"] = 50,["70"] = 50,["71"] = 50,["72"] = 50,["73"] = 50,["74"] = 50,["75"] = 49,["76"] = 53,["77"] = 54,["78"] = 53,["79"] = 57,["80"] = 58,["81"] = 57,["82"] = 61,["83"] = 62,["84"] = 61,["85"] = 65,["86"] = 66,["87"] = 65,["88"] = 69,["89"] = 70,["90"] = 69,["91"] = 73,["92"] = 74,["93"] = 73,["94"] = 82,["95"] = 83,["96"] = 82,["97"] = 86,["98"] = 87,["99"] = 86,["100"] = 102,["101"] = 103,["102"] = 102,["103"] = 106,["104"] = 107,["105"] = 108,["107"] = 110,["109"] = 106,["110"] = 114,["111"] = 115,["112"] = 116,["114"] = 118,["116"] = 114,["117"] = 122,["118"] = 123,["119"] = 124,["121"] = 126,["123"] = 122,["124"] = 130,["125"] = 131,["126"] = 132,["128"] = 134,["130"] = 130,["131"] = 146,["132"] = 147,["133"] = 146,["134"] = 150,["135"] = 151,["136"] = 150,["137"] = 154,["138"] = 155,["139"] = 154});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____unit = require("solar.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____GroupUtil = require("solar.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
____exports.Group = __TS__Class()
local Group = ____exports.Group
Group.name = "Group"
__TS__ClassExtends(Group, Handle)
function Group.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateGroup()
        )
    end
end
__TS__SetDescriptor(
    Group.prototype,
    "first",
    {get = function(self)
        return Unit:fromHandle(FirstOfGroup(self.handle))
    end},
    true
)
function Group.prototype.addUnit(self, whichUnit)
    GroupAddUnit(self.handle, whichUnit.handle)
end
function Group.prototype.clear(self)
    GroupClear(self.handle)
end
function Group.prototype.destroy(self)
    DestroyGroup(self.handle)
end
function Group.prototype.enumUnitsInRange(self, x, y, radius, filter)
    GroupEnumUnitsInRange(
        self.handle,
        x,
        y,
        radius,
        filter
    )
end
function Group.prototype.enumUnitsInRangeCounted(self, x, y, radius, filter, countLimit)
    GroupEnumUnitsInRangeCounted(
        self.handle,
        x,
        y,
        radius,
        filter,
        countLimit
    )
end
function Group.prototype.enumUnitsInRangeOfPoint(self, whichPoint, radius, filter)
    GroupEnumUnitsInRangeOfLoc(self.handle, whichPoint.handle, radius, filter)
end
function Group.prototype.enumUnitsInRangeOfPointCounted(self, whichPoint, radius, filter, countLimit)
    GroupEnumUnitsInRangeOfLocCounted(
        self.handle,
        whichPoint.handle,
        radius,
        filter,
        countLimit
    )
end
function Group.prototype.enumUnitsInRect(self, r, filter)
    GroupEnumUnitsInRect(self.handle, r, filter)
end
function Group.prototype.enumUnitsInRectCounted(self, r, filter, countLimit)
    GroupEnumUnitsInRectCounted(self.handle, r.handle, filter, countLimit)
end
function Group.prototype.enumUnitsOfPlayer(self, whichPlayer, filter)
    GroupEnumUnitsOfPlayer(self.handle, whichPlayer.handle, filter)
end
function Group.prototype.enumUnitsOfType(self, unitName, filter)
    GroupEnumUnitsOfType(self.handle, unitName, filter)
end
function Group.prototype.enumUnitsOfTypeCounted(self, unitName, filter, countLimit)
    GroupEnumUnitsOfTypeCounted(self.handle, unitName, filter, countLimit)
end
function Group.prototype.enumUnitsSelected(self, whichPlayer, radius, filter)
    GroupEnumUnitsSelected(self.handle, whichPlayer.handle, filter)
end
Group.prototype["for"] = function(self, callback)
    ForGroup(self.handle, callback)
end
function Group.prototype.forSL(self, callback)
    GroupUtil:forSL(self.handle, callback)
end
function Group.prototype.hasUnit(self, whichUnit)
    return IsUnitInGroup(whichUnit.handle, self.handle)
end
function Group.prototype.orderCoords(self, order, x, y)
    if type(order) == "string" then
        GroupPointOrder(self.handle, order, x, y)
    else
        GroupPointOrderById(self.handle, order, x, y)
    end
end
function Group.prototype.orderImmediate(self, order)
    if type(order) == "string" then
        GroupImmediateOrder(self.handle, order)
    else
        GroupImmediateOrderById(self.handle, order)
    end
end
function Group.prototype.orderPoint(self, order, whichPoint)
    if type(order) == "string" then
        GroupPointOrderLoc(self.handle, order, whichPoint.handle)
    else
        GroupPointOrderByIdLoc(self.handle, order, whichPoint.handle)
    end
end
function Group.prototype.orderTarget(self, order, targetWidget)
    if type(order) == "string" then
        GroupTargetOrder(self.handle, order, targetWidget.handle)
    else
        GroupTargetOrderById(self.handle, order, targetWidget.handle)
    end
end
function Group.fromHandle(self, handle)
    return self:getObject(handle)
end
function Group.getEnumUnit(self)
    return Unit:fromHandle(GetEnumUnit())
end
function Group.getFilterUnit(self)
    return Unit:fromHandle(GetFilterUnit())
end
return ____exports
