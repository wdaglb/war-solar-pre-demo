local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 8,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 12,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 19,["24"] = 6,["26"] = 6,["28"] = 22,["31"] = 8,["36"] = 27,["44"] = 31,["52"] = 35,["60"] = 39,["68"] = 43,["76"] = 47,["80"] = 50,["81"] = 51,["82"] = 50,["83"] = 54,["84"] = 55,["85"] = 54,["86"] = 58,["87"] = 59,["88"] = 58,["89"] = 62,["90"] = 63,["91"] = 62,["92"] = 66,["93"] = 67,["94"] = 66,["95"] = 70,["96"] = 71,["97"] = 71,["98"] = 71,["99"] = 71,["100"] = 71,["101"] = 71,["102"] = 71,["103"] = 70,["104"] = 74,["105"] = 75,["106"] = 74});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Rectangle = __TS__Class()
local Rectangle = ____exports.Rectangle
Rectangle.name = "Rectangle"
__TS__ClassExtends(Rectangle, Handle)
function Rectangle.prototype.____constructor(self, minX, minY, maxX, maxY)
    local mapMinX = GetRectMinX(bj_mapInitialPlayableArea)
    local mapMinY = GetRectMinY(bj_mapInitialPlayableArea)
    local mapMaxX = GetRectMaxX(bj_mapInitialPlayableArea)
    local mapMaxY = GetRectMaxY(bj_mapInitialPlayableArea)
    minX = math.max(minX, mapMinX)
    minY = math.max(minY, mapMinY)
    maxX = math.min(maxX, mapMaxX)
    maxY = math.min(maxY, mapMaxY)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            Rect(minX, minY, maxX, maxY)
        )
    end
end
__TS__SetDescriptor(
    Rectangle.prototype,
    "centerX",
    {get = function(self)
        return GetRectCenterX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "centerY",
    {get = function(self)
        return GetRectCenterY(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "maxX",
    {get = function(self)
        return GetRectMaxX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "maxY",
    {get = function(self)
        return GetRectMaxY(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "minX",
    {get = function(self)
        return GetRectMinX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "minY",
    {get = function(self)
        return GetRectMinY(self.handle)
    end},
    true
)
function Rectangle.prototype.destroy(self)
    RemoveRect(self.handle)
end
function Rectangle.prototype.enumDestructables(self, filter, actionFunc)
    EnumDestructablesInRect(self.handle, filter, actionFunc)
end
function Rectangle.prototype.enumItems(self, filter, actionFunc)
    EnumItemsInRect(self.handle, filter, actionFunc)
end
function Rectangle.prototype.move(self, newCenterX, newCenterY)
    MoveRectTo(self.handle, newCenterX, newCenterY)
end
function Rectangle.prototype.movePoint(self, newCenterPoint)
    MoveRectToLoc(self.handle, newCenterPoint.handle)
end
function Rectangle.prototype.setRect(self, minX, minY, maxX, maxY)
    SetRect(
        self.handle,
        minX,
        minY,
        maxX,
        maxY
    )
end
function Rectangle.prototype.setRectFromPoint(self, min, max)
    SetRectFromLoc(self.handle, min.handle, max.handle)
end
return ____exports
