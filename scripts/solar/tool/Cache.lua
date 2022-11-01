local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["10"] = 5,["11"] = 4,["12"] = 13,["13"] = 14,["14"] = 15,["15"] = 16,["16"] = 17,["18"] = 19,["19"] = 13,["20"] = 27,["21"] = 28,["22"] = 29,["23"] = 30,["24"] = 27,["25"] = 37,["26"] = 38,["27"] = 37,["28"] = 44,["29"] = 45,["30"] = 44,["31"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local Cache = ____exports.default
Cache.name = "Cache"
function Cache.prototype.____constructor(self)
    self.dataBase = {}
end
function Cache.prototype.get(self, key, defaultValue)
    local val = self.dataBase[key]
    if val == nil and defaultValue ~= nil then
        val = defaultValue(nil)
        self.dataBase[key] = val
    end
    return val
end
function Cache.prototype.put(self, key, value)
    local old = self.dataBase[key]
    self.dataBase[key] = value
    return old
end
function Cache.prototype.remove(self, key)
    self.dataBase[key] = nil
end
function Cache.prototype.clear(self)
    self.dataBase = {}
end
____exports.default = Cache
return ____exports
