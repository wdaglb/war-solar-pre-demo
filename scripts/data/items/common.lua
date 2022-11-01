local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 7,["10"] = 9,["11"] = 9,["12"] = 11,["13"] = 11,["14"] = 13,["15"] = 13,["16"] = 15,["17"] = 15,["18"] = 19,["19"] = 22,["20"] = 22,["21"] = 22,["22"] = 31,["23"] = 31,["24"] = 31,["26"] = 31,["27"] = 31,["29"] = 24,["30"] = 29,["31"] = 32,["32"] = 33,["33"] = 34,["34"] = 34,["35"] = 31,["36"] = 41,["37"] = 42,["38"] = 43,["39"] = 44,["40"] = 47,["41"] = 48,["42"] = 49,["43"] = 49,["44"] = 49,["45"] = 50,["46"] = 51,["47"] = 49,["48"] = 49,["50"] = 41,["51"] = 60,["52"] = 60,["53"] = 66,["54"] = 67,["55"] = 66,["56"] = 74,["57"] = 75,["58"] = 74,["59"] = 81,["60"] = 82,["61"] = 83,["63"] = 81,["64"] = 91,["65"] = 91,["66"] = 98,["67"] = 98,["68"] = 105,["69"] = 105,["70"] = 112,["71"] = 112});
local ____exports = {}
local id = 0
____exports.ItemEventType = ItemEventType or ({})
____exports.ItemEventType.pickup = 0
____exports.ItemEventType[____exports.ItemEventType.pickup] = "pickup"
____exports.ItemEventType.drop = 1
____exports.ItemEventType[____exports.ItemEventType.drop] = "drop"
____exports.ItemEventType.use = 2
____exports.ItemEventType[____exports.ItemEventType.use] = "use"
____exports.ItemEventType.sell = 3
____exports.ItemEventType[____exports.ItemEventType.sell] = "sell"
____exports.itemHandleData = __TS__New(Map)
____exports.AbstractItem = __TS__Class()
local AbstractItem = ____exports.AbstractItem
AbstractItem.name = "AbstractItem"
function AbstractItem.prototype.____constructor(self, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.data = {}
    self.attribute = {}
    self.x = x
    self.y = y
    id = id + 1
    self.id = id
end
function AbstractItem.prototype.init(self)
    if _G.GlobalVars_init then
        self.handle = CreateItem(self.data.id, self.x, self.y)
        ____exports.itemHandleData:set(self.handle, self)
        self.deathTrigger = CreateTrigger()
        TriggerRegisterDeathEvent(self.deathTrigger, self.handle)
        TriggerAddAction(
            self.deathTrigger,
            function()
                self:destroy()
                DestroyTrigger(self.deathTrigger)
            end
        )
    end
end
function AbstractItem.prototype.onItemFill(self, data)
end
function AbstractItem.prototype.listen(self)
    return {}
end
function AbstractItem.prototype.atUnit(self, target)
    UnitAddItem(target, self.handle)
end
function AbstractItem.prototype.destroy(self)
    if self.handle then
        ____exports.itemHandleData:delete(self.handle)
    end
end
function AbstractItem.prototype.onPickup(self, unit)
end
function AbstractItem.prototype.onDrop(self, unit)
end
function AbstractItem.prototype.onUse(self, unit)
end
function AbstractItem.prototype.onSell(self, unit)
end
return ____exports
