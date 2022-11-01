local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 12,["12"] = 13,["13"] = 14,["14"] = 15,["15"] = 16,["16"] = 13,["17"] = 12,["18"] = 21,["19"] = 22,["20"] = 23,["21"] = 24,["22"] = 22,["23"] = 21,["24"] = 29,["25"] = 30,["26"] = 31,["27"] = 32,["28"] = 33,["29"] = 30,["30"] = 29,["31"] = 1});
local ____exports = {}
____exports.default = __TS__Class()
local HookUtil = ____exports.default
HookUtil.name = "HookUtil"
function HookUtil.prototype.____constructor(self)
end
function HookUtil.hookArguments(self, oldFunc, newFunc)
    return function(____, ...)
        local val = oldFunc(nil, ...)
        newFunc(nil, ...)
        return val
    end
end
function HookUtil.hookArgumentsBefore(self, oldFunc, newFunc)
    return function(____, ...)
        newFunc(nil, ...)
        return oldFunc(nil, ...)
    end
end
function HookUtil.hookResult(self, hookFunc, passFunc)
    return function(____, ...)
        local value = hookFunc(nil, ...)
        passFunc(nil, value)
        return value
    end
end
____exports.default = HookUtil
return ____exports
