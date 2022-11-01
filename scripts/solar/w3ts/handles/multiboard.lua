local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 5,["15"] = 7,["16"] = 8,["17"] = 5,["19"] = 5,["21"] = 11,["24"] = 7,["25"] = 15,["26"] = 16,["27"] = 15,["28"] = 19,["29"] = 20,["30"] = 19,["31"] = 23,["32"] = 24,["33"] = 23,["34"] = 27,["35"] = 28,["36"] = 27,["37"] = 31,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 31,["46"] = 35,["47"] = 36,["48"] = 35,["49"] = 39,["50"] = 40,["51"] = 39,["52"] = 44,["53"] = 44,["54"] = 44,["55"] = 44,["57"] = 47,["58"] = 44,["60"] = 44,["62"] = 50,["65"] = 46,["71"] = 55,["73"] = 58,["74"] = 59,["83"] = 63,["92"] = 67,["94"] = 70,["95"] = 71,["105"] = 79,["107"] = 74,["108"] = 75,["113"] = 82,["114"] = 83,["115"] = 82,["116"] = 86,["117"] = 87,["118"] = 86,["119"] = 90,["120"] = 91,["121"] = 90,["122"] = 94,["123"] = 95,["124"] = 94,["125"] = 98,["126"] = 99,["127"] = 98,["128"] = 102,["129"] = 103,["130"] = 102,["131"] = 106,["132"] = 107,["133"] = 106,["134"] = 110,["135"] = 111,["136"] = 110,["137"] = 114,["138"] = 115,["139"] = 114,["140"] = 118,["141"] = 119,["142"] = 119,["143"] = 119,["144"] = 119,["145"] = 119,["146"] = 119,["147"] = 119,["148"] = 118,["149"] = 122,["150"] = 123,["151"] = 122,["152"] = 126,["153"] = 127,["154"] = 127,["155"] = 127,["156"] = 127,["157"] = 127,["158"] = 127,["159"] = 127,["160"] = 126,["161"] = 130,["162"] = 131,["163"] = 130,["164"] = 134,["165"] = 135,["166"] = 134});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.MultiboardItem = __TS__Class()
local MultiboardItem = ____exports.MultiboardItem
MultiboardItem.name = "MultiboardItem"
__TS__ClassExtends(MultiboardItem, Handle)
function MultiboardItem.prototype.____constructor(self, board, x, y)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            MultiboardGetItem(board.handle, x - 1, y - 1)
        )
    end
end
function MultiboardItem.prototype.destroy(self)
    MultiboardReleaseItem(self.handle)
end
function MultiboardItem.prototype.setIcon(self, icon)
    MultiboardSetItemIcon(self.handle, icon)
end
function MultiboardItem.prototype.setStyle(self, showValue, showIcon)
    MultiboardSetItemStyle(self.handle, showValue, showIcon)
end
function MultiboardItem.prototype.setValue(self, val)
    MultiboardSetItemValue(self.handle, val)
end
function MultiboardItem.prototype.setValueColor(self, red, green, blue, alpha)
    MultiboardSetItemValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function MultiboardItem.prototype.setWidth(self, width)
    MultiboardSetItemWidth(self.handle, width)
end
function MultiboardItem.fromHandle(self, handle)
    return self:getObject(handle)
end
____exports.Multiboard = __TS__Class()
local Multiboard = ____exports.Multiboard
Multiboard.name = "Multiboard"
__TS__ClassExtends(Multiboard, Handle)
function Multiboard.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateMultiboard()
        )
    end
end
__TS__SetDescriptor(
    Multiboard.prototype,
    "columns",
    {
        get = function(self)
            return MultiboardGetColumnCount(self.handle)
        end,
        set = function(self, count)
            MultiboardSetColumnCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "displayed",
    {get = function(self)
        return IsMultiboardDisplayed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "rows",
    {
        get = function(self)
            return MultiboardGetRowCount(self.handle)
        end,
        set = function(self, count)
            MultiboardSetRowCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "title",
    {
        get = function(self)
            return MultiboardGetTitleText(self.handle)
        end,
        set = function(self, label)
            MultiboardSetTitleText(self.handle, label)
        end
    },
    true
)
function Multiboard.prototype.clear(self)
    MultiboardClear(self.handle)
end
function Multiboard.prototype.createItem(self, x, y)
    return __TS__New(____exports.MultiboardItem, self, x, y)
end
function Multiboard.prototype.destroy(self)
    DestroyMultiboard(self.handle)
end
function Multiboard.prototype.display(self, show)
    MultiboardDisplay(self.handle, show)
end
function Multiboard.prototype.minimize(self, flag)
    MultiboardMinimize(self.handle, flag)
end
function Multiboard.prototype.minimized(self)
    return IsMultiboardMinimized(self.handle)
end
function Multiboard.prototype.setItemsIcons(self, icon)
    MultiboardSetItemsIcon(self.handle, icon)
end
function Multiboard.prototype.setItemsStyle(self, showValues, showIcons)
    MultiboardSetItemsStyle(self.handle, showValues, showIcons)
end
function Multiboard.prototype.setItemsValue(self, value)
    MultiboardSetItemsValue(self.handle, value)
end
function Multiboard.prototype.setItemsValueColor(self, red, green, blue, alpha)
    MultiboardSetItemsValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Multiboard.prototype.setItemsWidth(self, width)
    MultiboardSetItemsWidth(self.handle, width)
end
function Multiboard.prototype.setTitleTextColor(self, red, green, blue, alpha)
    MultiboardSetTitleTextColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Multiboard.fromHandle(self, handle)
    return self:getObject(handle)
end
function Multiboard.suppressDisplay(self, flag)
    MultiboardSuppressDisplay(flag)
end
return ____exports
