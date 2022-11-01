local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 11,["17"] = 11,["18"] = 13,["19"] = 13,["20"] = 15,["21"] = 15,["22"] = 19,["23"] = 22,["24"] = 22,["25"] = 22,["26"] = 31,["27"] = 31,["28"] = 31,["30"] = 31,["31"] = 31,["33"] = 24,["34"] = 29,["35"] = 32,["36"] = 33,["37"] = 34,["38"] = 34,["39"] = 31,["40"] = 41,["41"] = 42,["42"] = 43,["43"] = 44,["44"] = 47,["45"] = 48,["46"] = 49,["47"] = 49,["48"] = 49,["49"] = 50,["50"] = 51,["51"] = 49,["52"] = 49,["54"] = 41,["55"] = 60,["56"] = 61,["57"] = 62,["58"] = 63,["60"] = 65,["61"] = 66,["63"] = 68,["64"] = 69,["66"] = 71,["67"] = 72,["69"] = 74,["70"] = 75,["72"] = 77,["73"] = 77,["74"] = 77,["75"] = 77,["76"] = 60,["77"] = 83,["78"] = 84,["79"] = 83,["80"] = 91,["81"] = 92,["82"] = 91,["83"] = 98,["84"] = 99,["85"] = 100,["87"] = 98,["88"] = 108,["89"] = 109,["90"] = 110,["91"] = 108,["92"] = 117,["93"] = 118,["94"] = 117,["95"] = 125,["96"] = 125,["97"] = 132,["98"] = 132});
local ____exports = {}
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitAttributeState = require("solar.atrribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
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
    local temps = {}
    if self.attribute.attack then
        temps[#temps + 1] = "攻击力：" .. tostring(self.attribute.attack)
    end
    if self.attribute.def then
        temps[#temps + 1] = "防御力：" .. tostring(self.attribute.def)
    end
    if self.attribute.strength then
        temps[#temps + 1] = "力量：" .. tostring(self.attribute.strength)
    end
    if self.attribute.agility then
        temps[#temps + 1] = "敏捷：" .. tostring(self.attribute.agility)
    end
    if self.attribute.intelligence then
        temps[#temps + 1] = "智力：" .. tostring(self.attribute.intelligence)
    end
    local ____data_1 = data
    local ____temp_0 = (self.data.description .. "|n") .. table.concat(temps, "|n")
    data.Ubertip = ____temp_0
    ____data_1.Description = ____temp_0
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
    AttributeUtil:setUnitAttribute(unit, self.attribute)
    UnitAttributeState:refreshUnitSolarAtrribute(unit)
end
function AbstractItem.prototype.onDrop(self, unit)
    UnitAttributeState:refreshUnitSolarAtrribute(unit)
end
function AbstractItem.prototype.onUse(self, unit)
end
function AbstractItem.prototype.onSell(self, unit)
end
return ____exports
