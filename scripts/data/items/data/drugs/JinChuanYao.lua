local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 3,["13"] = 3,["14"] = 14,["15"] = 14,["16"] = 14,["18"] = 14,["19"] = 14,["21"] = 3,["22"] = 4,["23"] = 4,["24"] = 4,["25"] = 4,["26"] = 4,["27"] = 4,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 16,["32"] = 14,["33"] = 19,["34"] = 20,["35"] = 19,["36"] = 25,["37"] = 26,["38"] = 25});
local ____exports = {}
local ____common = require("data.items.common")
local AbstractItem = ____common.AbstractItem
local ItemEventType = ____common.ItemEventType
____exports.JinChuanYao = __TS__Class()
local JinChuanYao = ____exports.JinChuanYao
JinChuanYao.name = "JinChuanYao"
__TS__ClassExtends(JinChuanYao, AbstractItem)
function JinChuanYao.prototype.____constructor(self, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    AbstractItem.prototype.____constructor(self, x, y)
    self.data = {
        money = 100,
        id = "iy01",
        name = "金创药",
        icon = "ReplaceableTextures\\CommandButtons\\BTNHealthStone.blp",
        use = true,
        cdGroup = "AIh1",
        ability = {"AIh1"}
    }
    self:init()
end
function JinChuanYao.prototype.listen(self)
    return {ItemEventType.use}
end
function JinChuanYao.prototype.onUse(self, unit)
    print("使用物品" .. self.data.name)
end
return ____exports
