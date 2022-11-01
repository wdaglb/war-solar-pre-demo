local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["10"] = 4,["11"] = 11,["12"] = 12,["13"] = 11,["14"] = 20,["15"] = 21,["16"] = 22,["17"] = 22,["18"] = 22,["20"] = 22,["21"] = 20,["22"] = 30,["23"] = 31,["24"] = 30,["25"] = 39,["26"] = 40,["27"] = 41,["28"] = 39,["29"] = 49,["30"] = 50,["31"] = 49,["32"] = 58,["33"] = 59,["34"] = 60,["35"] = 58,["36"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local ObjectDataUtil = ____exports.default
ObjectDataUtil.name = "ObjectDataUtil"
function ObjectDataUtil.prototype.____constructor(self)
end
function ObjectDataUtil.getUnitDataNumber(self, objIdStr, property)
    return tonumber(self:getItemDataString(objIdStr, property))
end
function ObjectDataUtil.getUnitDataString(self, objIdStr, property)
    local obj = unit[objIdStr]
    local ____obj_index_0 = obj[property .. "1"]
    if ____obj_index_0 == nil then
        ____obj_index_0 = obj[property]
    end
    return ____obj_index_0
end
function ObjectDataUtil.getItemDataNumber(self, objIdStr, property)
    return tonumber(self:getItemDataString(objIdStr, property))
end
function ObjectDataUtil.getItemDataString(self, objIdStr, property)
    local obj = item[objIdStr]
    return obj[property .. "1"] or obj[property]
end
function ObjectDataUtil.getAbilityDataNumber(self, objIdStr, property)
    return tonumber(self:getAbilityDataString(objIdStr, property))
end
function ObjectDataUtil.getAbilityDataString(self, objIdStr, property)
    local obj = ability[objIdStr]
    return obj[property .. "1"] or obj[property]
end
____exports.default = ObjectDataUtil
return ____exports
