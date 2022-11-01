local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 4,["8"] = 4,["9"] = 4,["11"] = 4,["12"] = 12,["13"] = 13,["14"] = 12,["15"] = 21,["16"] = 22,["17"] = 23,["19"] = 25,["20"] = 26,["21"] = 27,["22"] = 28,["25"] = 31,["26"] = 21,["27"] = 38,["28"] = 39,["29"] = 40,["31"] = 42,["32"] = 43,["33"] = 44,["34"] = 45,["35"] = 46,["37"] = 48,["38"] = 49,["39"] = 50,["40"] = 51,["41"] = 52,["43"] = 54,["44"] = 55,["45"] = 38,["46"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local DebugVmUtil = ____exports.default
DebugVmUtil.name = "DebugVmUtil"
function DebugVmUtil.prototype.____constructor(self)
end
function DebugVmUtil.sethook(self, hook, mask)
    debug.sethook(hook, mask, 0)
end
function DebugVmUtil.getTsLine(self, functionInfo)
    if functionInfo.short_src == nil then
        return functionInfo.linedefined
    end
    local tsLine = tostring(functionInfo.linedefined or 0)
    if _G.__TS__sourcemap then
        if _G.__TS__sourcemap[functionInfo.short_src] then
            tsLine = tostring(_G.__TS__sourcemap[functionInfo.short_src][tsLine] or tsLine)
        end
    end
    return tsLine
end
function DebugVmUtil.getTsSrcLineName(self, functionInfo)
    if not functionInfo then
        return ""
    end
    local src = functionInfo.source
    if not src then
        src = "<C>"
    elseif __TS__StringSubstring(src, #src - 4, #src) == ".lua" then
        src = __TS__StringSubstring(src, 0, #src - 4)
    end
    local name = functionInfo.name
    if not name then
        name = "匿名"
    elseif __TS__StringSubstring(name, #name - 2, #name) == "_l" then
        name = __TS__StringSubstring(name, 0, #name - 2)
    end
    local title = (((src .. ":") .. tostring(____exports.default:getTsLine(functionInfo))) .. ":") .. name
    return title
end
____exports.default = DebugVmUtil
return ____exports
