local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 7,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 9,["17"] = 9,["18"] = 14,["19"] = 15,["20"] = 9,["22"] = 9,["24"] = 18,["27"] = 14,["33"] = 23,["35"] = 26,["36"] = 27,["46"] = 31,["48"] = 34,["49"] = 35,["59"] = 43,["61"] = 38,["62"] = 39,["71"] = 47,["79"] = 51,["88"] = 59,["90"] = 62,["91"] = 63,["100"] = 67,["108"] = 71,["116"] = 75,["124"] = 79,["133"] = 83,["135"] = 86,["136"] = 87,["146"] = 91,["148"] = 94,["149"] = 95,["159"] = 107,["161"] = 110,["162"] = 111,["172"] = 115,["174"] = 118,["175"] = 119,["180"] = 122,["181"] = 123,["182"] = 124,["183"] = 122,["184"] = 144,["185"] = 145,["186"] = 144,["187"] = 148,["188"] = 149,["189"] = 148,["190"] = 152,["191"] = 153,["192"] = 152,["193"] = 156,["194"] = 157,["195"] = 156,["196"] = 160,["197"] = 161,["198"] = 160,["199"] = 164,["200"] = 165,["201"] = 164,["202"] = 168,["203"] = 169,["204"] = 168,["205"] = 188,["206"] = 189,["207"] = 188,["208"] = 192,["209"] = 193,["210"] = 192,["211"] = 196,["212"] = 197,["213"] = 196,["214"] = 200,["215"] = 201,["216"] = 200,["217"] = 204,["218"] = 205,["219"] = 204,["220"] = 208,["221"] = 209,["222"] = 208,["223"] = 212,["224"] = 213,["225"] = 212});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____widget = require("solar.w3ts.handles.widget")
local Widget = ____widget.Widget
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
____exports.Item = __TS__Class()
local Item = ____exports.Item
Item.name = "Item"
__TS__ClassExtends(Item, Widget)
function Item.prototype.____constructor(self, itemId, x, y)
    if Handle:initFromHandle() then
        Widget.prototype.____constructor(self)
    else
        Widget.prototype.____constructor(
            self,
            CreateItem(itemId, x, y)
        )
    end
end
__TS__SetDescriptor(
    Item.prototype,
    "solarData",
    {
        get = function(self)
            return DataBase:getItemSolarData(self.handle)
        end,
        set = function(self, obj)
            DataBase:setDataByHandle("item", self.handle, obj)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "charges",
    {
        get = function(self)
            return GetItemCharges(self.handle)
        end,
        set = function(self, value)
            SetItemCharges(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "invulnerable",
    {
        get = function(self)
            return IsItemInvulnerable(self.handle)
        end,
        set = function(self, flag)
            SetItemInvulnerable(self.handle, true)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "level",
    {get = function(self)
        return GetItemLevel(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "name",
    {get = function(self)
        return GetItemName(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "pawnable",
    {
        get = function(self)
            return IsItemPawnable(self.handle)
        end,
        set = function(self, flag)
            SetItemPawnable(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "player",
    {get = function(self)
        return GetItemPlayer(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "type",
    {get = function(self)
        return GetItemType(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "typeId",
    {get = function(self)
        return GetItemTypeId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "typeIdString",
    {get = function(self)
        return id2string(GetItemTypeId(self.handle))
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "userData",
    {
        get = function(self)
            return GetItemUserData(self.handle)
        end,
        set = function(self, value)
            SetItemUserData(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "visible",
    {
        get = function(self)
            return IsItemVisible(self.handle)
        end,
        set = function(self, flag)
            SetItemVisible(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "x",
    {
        get = function(self)
            return GetItemX(self.handle)
        end,
        set = function(self, value)
            SetItemPosition(self.handle, value, self.y)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "y",
    {
        get = function(self)
            return GetItemY(self.handle)
        end,
        set = function(self, value)
            SetItemPosition(self.handle, self.x, value)
        end
    },
    true
)
function Item.prototype.destroy(self)
    DataBase:clearItemSolarData(self.handle)
    RemoveItem(self.handle)
end
function Item.prototype.isOwned(self)
    return IsItemOwned(self.handle)
end
function Item.prototype.isPawnable(self)
    return IsItemPawnable(self.handle)
end
function Item.prototype.isPowerup(self)
    return IsItemPowerup(self.handle)
end
function Item.prototype.isSellable(self)
    return IsItemSellable(self.handle)
end
function Item.prototype.setDropId(self, unitId)
    SetItemDropID(self.handle, unitId)
end
function Item.prototype.setDropOnDeath(self, flag)
    SetItemDropOnDeath(self.handle, flag)
end
function Item.prototype.setDroppable(self, flag)
    SetItemDroppable(self.handle, flag)
end
function Item.prototype.setOwner(self, whichPlayer, changeColor)
    SetItemPlayer(self.handle, whichPlayer.handle, changeColor)
end
function Item.prototype.setPoint(self, whichPoint)
    SetItemPosition(self.handle, whichPoint.x, whichPoint.y)
end
function Item.prototype.setPosition(self, x, y)
    SetItemPosition(self.handle, x, y)
end
function Item.fromHandle(self, handle)
    return self:getObject(handle)
end
function Item.isIdPawnable(self, itemId)
    return IsItemIdPawnable(itemId)
end
function Item.isIdPowerup(self, itemId)
    return IsItemIdPowerup(itemId)
end
function Item.isIdSellable(self, itemId)
    return IsItemIdSellable(itemId)
end
return ____exports
