local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 7,["8"] = 11,["9"] = 12,["10"] = 13,["11"] = 14,["12"] = 16,["13"] = 16,["14"] = 16,["15"] = 16,["16"] = 17,["17"] = 17,["18"] = 17,["19"] = 17,["20"] = 19,["21"] = 20,["22"] = 21,["23"] = 22,["24"] = 19,["25"] = 25,["26"] = 25,["27"] = 25,["28"] = 25,["29"] = 26,["30"] = 26,["31"] = 26,["32"] = 26,["33"] = 28,["34"] = 29,["35"] = 30,["36"] = 31,["37"] = 28,["38"] = 34,["39"] = 35,["40"] = 37,["41"] = 38,["42"] = 39,["43"] = 40,["44"] = 41,["45"] = 44,["46"] = 51,["47"] = 52,["48"] = 53,["50"] = 55,["51"] = 55,["52"] = 56,["53"] = 51});
local ____exports = {}
local oldMain = main
local oldConfig = config
local hooksMainBefore = {}
local hooksMainAfter = {}
local hooksConfigBefore = {}
local hooksConfigAfter = {}
____exports.executeHooksMainBefore = function() return __TS__ArrayForEach(
    hooksMainBefore,
    function(____, func) return func() end
) end
____exports.executeHooksMainAfter = function() return __TS__ArrayForEach(
    hooksMainAfter,
    function(____, func) return func() end
) end
function ____exports.hookedMain()
    ____exports.executeHooksMainBefore()
    oldMain()
    ____exports.executeHooksMainAfter()
end
____exports.executeHooksConfigBefore = function() return __TS__ArrayForEach(
    hooksConfigBefore,
    function(____, func) return func() end
) end
____exports.executeHooksConfigAfter = function() return __TS__ArrayForEach(
    hooksConfigAfter,
    function(____, func) return func() end
) end
function ____exports.hookedConfig()
    ____exports.executeHooksConfigBefore()
    oldConfig()
    ____exports.executeHooksConfigAfter()
end
main = ____exports.hookedMain
config = ____exports.hookedConfig
____exports.W3TS_HOOK = W3TS_HOOK or ({})
____exports.W3TS_HOOK.MAIN_BEFORE = "main::before"
____exports.W3TS_HOOK.MAIN_AFTER = "main::after"
____exports.W3TS_HOOK.CONFIG_BEFORE = "config::before"
____exports.W3TS_HOOK.CONFIG_AFTER = "config::after"
local entryPoints = {[____exports.W3TS_HOOK.MAIN_BEFORE] = hooksMainBefore, [____exports.W3TS_HOOK.MAIN_AFTER] = hooksMainAfter, [____exports.W3TS_HOOK.CONFIG_BEFORE] = hooksConfigBefore, [____exports.W3TS_HOOK.CONFIG_AFTER] = hooksConfigAfter}
function ____exports.addScriptHook(entryPoint, hook)
    if not (entryPoints[entryPoint] ~= nil) then
        return false
    end
    local ____entryPoints_entryPoint_0 = entryPoints[entryPoint]
    ____entryPoints_entryPoint_0[#____entryPoints_entryPoint_0 + 1] = hook
    return true
end
return ____exports
