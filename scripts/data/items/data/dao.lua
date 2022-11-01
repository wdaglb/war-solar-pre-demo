local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 4,["19"] = 4,["20"] = 4,["21"] = 4,["22"] = 4,["23"] = 11,["24"] = 17,["25"] = 15,["26"] = 20,["27"] = 21,["28"] = 21,["29"] = 21,["30"] = 21,["31"] = 20,["32"] = 24,["33"] = 25,["34"] = 24,["35"] = 31,["36"] = 32,["37"] = 31,["38"] = 35,["39"] = 36,["40"] = 35});
local ____exports = {}
local ____common = require("data.items.common")
local AbstractItem = ____common.AbstractItem
local ItemEventType = ____common.ItemEventType
____exports.Dao = __TS__Class()
local Dao = ____exports.Dao
Dao.name = "Dao"
__TS__ClassExtends(Dao, AbstractItem)
function Dao.prototype.____constructor(self)
    AbstractItem.prototype.____constructor(self)
    self.data = {
        id = "i001",
        name = "小刀",
        description = "这是一把小刀",
        icon = "",
        money = 1000
    }
    self.attribute = {attack = 1000}
    self:init()
end
function Dao.prototype.onItemFill(self, data)
    local ____data_1 = data
    local ____temp_0 = ("|n攻击力:" .. tostring(self.attribute.attack)) .. ""
    data.Tip = ____temp_0
    ____data_1.Description = ____temp_0
end
function Dao.prototype.listen(self)
    return {ItemEventType.pickup, ItemEventType.drop}
end
function Dao.prototype.onPickup(self, unit)
    print((("单位：" .. GetUnitName(unit)) .. "，获得物品：") .. self.data.name)
end
function Dao.prototype.onDrop(self, unit)
    print((("单位：" .. GetUnitName(unit)) .. "，丢弃物品：") .. self.data.name)
end
return ____exports
