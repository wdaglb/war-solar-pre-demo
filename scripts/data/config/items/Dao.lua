local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 4,["19"] = 4,["20"] = 4,["21"] = 4,["22"] = 4,["23"] = 11,["24"] = 17,["25"] = 15,["26"] = 20,["27"] = 21,["28"] = 20,["29"] = 31,["30"] = 3,["31"] = 33,["32"] = 35,["33"] = 31,["34"] = 42,["35"] = 3,["36"] = 44,["37"] = 46,["38"] = 42});
local ____exports = {}
local ____common = require("data.lib.item.common")
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
    self.attribute = {def = 10}
    self:init()
end
function Dao.prototype.listen(self)
    return {ItemEventType.pickup, ItemEventType.drop}
end
function Dao.prototype.onPickup(self, unit)
    AbstractItem.prototype.onPickup(self, unit)
    print((("单位：" .. GetUnitName(unit)) .. "获得了") .. self.data.name)
    print("物品id：" .. tostring(self.id))
end
function Dao.prototype.onDrop(self, unit)
    AbstractItem.prototype.onDrop(self, unit)
    print((("单位：" .. GetUnitName(unit)) .. "丢弃了") .. self.data.name)
    print("物品id：" .. tostring(self.id))
end
return ____exports
