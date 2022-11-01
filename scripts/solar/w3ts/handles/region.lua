local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 8,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 11,["15"] = 8,["17"] = 8,["19"] = 14,["22"] = 10,["23"] = 18,["24"] = 19,["25"] = 18,["26"] = 22,["27"] = 23,["28"] = 22,["29"] = 26,["30"] = 27,["31"] = 26,["32"] = 30,["33"] = 31,["34"] = 30,["35"] = 34,["36"] = 35,["37"] = 34,["38"] = 38,["39"] = 39,["40"] = 38,["41"] = 42,["42"] = 43,["43"] = 42,["44"] = 46,["45"] = 47,["46"] = 46,["47"] = 50,["48"] = 51,["49"] = 50,["50"] = 54,["51"] = 55,["52"] = 54,["53"] = 58,["54"] = 59,["55"] = 58});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Region = __TS__Class()
local Region = ____exports.Region
Region.name = "Region"
__TS__ClassExtends(Region, Handle)
function Region.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateRegion()
        )
    end
end
function Region.prototype.addCell(self, x, y)
    RegionAddCell(self.handle, x, y)
end
function Region.prototype.addCellPoint(self, whichPoint)
    RegionAddCellAtLoc(self.handle, whichPoint.handle)
end
function Region.prototype.addRect(self, r)
    RegionAddRect(self.handle, r.handle)
end
function Region.prototype.clearCell(self, x, y)
    RegionClearCell(self.handle, x, y)
end
function Region.prototype.clearCellPoint(self, whichPoint)
    RegionClearCellAtLoc(self.handle, whichPoint.handle)
end
function Region.prototype.clearRect(self, r)
    RegionClearRect(self.handle, r.handle)
end
function Region.prototype.containsCoords(self, x, y)
    return IsPointInRegion(self.handle, x, y)
end
function Region.prototype.containsPoint(self, whichPoint)
    IsLocationInRegion(self.handle, whichPoint.handle)
end
function Region.prototype.containsUnit(self, whichUnit)
    return IsUnitInRegion(self.handle, whichUnit.handle)
end
function Region.prototype.destroy(self)
    RemoveRegion(self.handle)
end
function Region.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
