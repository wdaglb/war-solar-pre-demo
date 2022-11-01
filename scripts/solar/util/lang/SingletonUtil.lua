local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 5,["7"] = 5,["8"] = 5,["10"] = 5,["11"] = 15,["12"] = 15,["13"] = 15,["15"] = 16,["16"] = 17,["17"] = 18,["19"] = 20,["20"] = 21,["22"] = 23,["24"] = 25,["25"] = 26,["26"] = 15,["27"] = 35,["28"] = 35,["29"] = 35,["31"] = 36,["32"] = 35,["33"] = 6,["34"] = 5});
local ____exports = {}
____exports.default = __TS__Class()
local SingletonUtil = ____exports.default
SingletonUtil.name = "SingletonUtil"
function SingletonUtil.prototype.____constructor(self)
end
function SingletonUtil.isFirstTime(self, key, printTraceBack, tips)
    if printTraceBack == nil then
        printTraceBack = true
    end
    if ____exports.default._sl_cache[key] == true then
        if printTraceBack then
            log.errorWithTraceBack("唯一限制:" .. tostring(key))
        end
        if tips then
            print(tips)
        end
        return false
    end
    ____exports.default._sl_cache[key] = true
    return true
end
function SingletonUtil.notFirstTime(self, key, printTraceBack, tips)
    if printTraceBack == nil then
        printTraceBack = true
    end
    return not ____exports.default:isFirstTime(key, printTraceBack, tips)
end
SingletonUtil._sl_cache = {}
____exports.default = SingletonUtil
return ____exports
