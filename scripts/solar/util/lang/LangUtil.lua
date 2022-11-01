local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["10"] = 4,["11"] = 10,["12"] = 11,["13"] = 12,["15"] = 10,["16"] = 20,["17"] = 21,["18"] = 22,["20"] = 20,["21"] = 31,["22"] = 32,["23"] = 33,["25"] = 31,["26"] = 41,["27"] = 42,["28"] = 43,["30"] = 41,["31"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local LangUtil = ____exports.default
LangUtil.name = "LangUtil"
function LangUtil.prototype.____constructor(self)
end
function LangUtil.isNumber(self, obj)
    if type(obj) == "number" then
        return true
    end
end
function LangUtil.isString(self, obj)
    if type(obj) == "string" then
        return true
    end
end
function LangUtil.isFunction(self, obj)
    if type(obj) == "function" then
        return true
    end
end
function LangUtil.isObject(self, obj)
    if type(obj) == "table" then
        return true
    end
end
____exports.default = LangUtil
return ____exports
