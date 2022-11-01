local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 40,["12"] = 46,["13"] = 48,["14"] = 48,["15"] = 61,["16"] = 62,["17"] = 63,["18"] = 64,["20"] = 67,["22"] = 48,["23"] = 78,["24"] = 79,["25"] = 80,["26"] = 81,["27"] = 82,["28"] = 82,["29"] = 82,["30"] = 82,["31"] = 82,["33"] = 85,["36"] = 48,["37"] = 100,["38"] = 101,["39"] = 102,["40"] = 103,["41"] = 103,["42"] = 105,["43"] = 106,["44"] = 103,["45"] = 103,["47"] = 110,["48"] = 111,["49"] = 112,["50"] = 112,["51"] = 114,["52"] = 115,["53"] = 112,["54"] = 112,["56"] = 48,["57"] = 48});
local ____exports = {}
function ____exports.default(all)
    all = all or __TS__New(Map)
    return {
        all = all,
        on = function(self, ____type, handler)
            local handlers = all:get(____type)
            if handlers then
                handlers[#handlers + 1] = handler
            else
                all:set(____type, {handler})
            end
        end,
        off = function(self, ____type, handler)
            local handlers = all:get(____type)
            if handlers then
                if handler then
                    __TS__ArraySplice(
                        handlers,
                        __TS__ArrayIndexOf(handlers, handler) >> 0,
                        1
                    )
                else
                    all:set(____type, {})
                end
            end
        end,
        emit = function(self, ____type, evt)
            local handlers = all:get(____type)
            if handlers then
                __TS__ArrayMap(
                    __TS__ArraySlice(handlers),
                    function(____, handler)
                        handler(evt)
                    end
                )
            end
            handlers = all:get("*")
            if handlers then
                __TS__ArrayMap(
                    __TS__ArraySlice(handlers),
                    function(____, handler)
                        handler(____type, evt)
                    end
                )
            end
        end
    }
end
return ____exports
