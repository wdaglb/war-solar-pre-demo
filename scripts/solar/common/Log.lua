local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 5,["9"] = 5,["10"] = 5,["12"] = 5,["18"] = 13,["20"] = 16,["21"] = 18,["26"] = 21,["27"] = 22,["28"] = 23,["30"] = 25,["31"] = 26,["33"] = 21,["34"] = 30,["35"] = 31,["36"] = 32,["38"] = 34,["39"] = 35,["41"] = 30,["42"] = 39,["43"] = 40,["44"] = 41,["46"] = 43,["47"] = 44,["49"] = 39,["50"] = 48,["51"] = 49,["52"] = 50,["54"] = 52,["55"] = 53,["57"] = 48,["58"] = 57,["59"] = 58,["60"] = 59,["62"] = 61,["63"] = 62,["65"] = 57,["66"] = 66,["68"] = 67,["69"] = 68,["70"] = 69,["71"] = 70,["72"] = 71,["73"] = 72,["74"] = 73,["76"] = 75,["77"] = 76,["78"] = 77,["79"] = 78,["80"] = 79,["82"] = 66,["83"] = 84,["84"] = 85,["85"] = 86,["87"] = 88,["88"] = 89,["90"] = 84,["91"] = 7,["92"] = 8,["93"] = 9,["94"] = 5});
local ____exports = {}
local log = require("jass.log")
____exports.default = __TS__Class()
local Log = ____exports.default
Log.name = "Log"
function Log.prototype.____constructor(self)
end
__TS__SetDescriptor(
    Log.prototype,
    "path",
    {
        get = function(self)
            return log.path
        end,
        set = function(self, path)
            log.path = path
        end
    },
    true
)
function Log.prototype.trace(...)
    if ____exports.default.enablePrint then
        print("Log.trace:", ...)
    end
    if ____exports.default.enable then
        log:trace(...)
    end
end
function Log.prototype.debug(...)
    if ____exports.default.enablePrint then
        print("Log.debug:", ...)
    end
    if ____exports.default.enable then
        log:debug(...)
    end
end
function Log.prototype.info(...)
    if ____exports.default.enablePrint then
        print("Log.info:", ...)
    end
    if ____exports.default.enable then
        log:info(...)
    end
end
function Log.prototype.warn(...)
    if ____exports.default.enablePrint then
        print("Log.warn:", ...)
    end
    if ____exports.default.enable then
        log:warn(...)
    end
end
function Log.prototype.error(...)
    if ____exports.default.enablePrint then
        print("Log.error:", ...)
    end
    if ____exports.default.enable then
        log:error(...)
    end
end
function Log.prototype.errorWithTraceBack(...)
    local ____exports_default_0, ____index_1 = ____exports.default, "index"
    ____exports_default_0[____index_1] = ____exports_default_0[____index_1] + 1
    local tb = debug.traceback()
    if ____exports.default.enablePrint then
        print("Log.errorWithTraceBack:", ...)
        print(("===========Error TraceBack Start[No." .. tostring(____exports.default.index)) .. "]===========")
        print(tb)
        print(("===========Error TraceBack End[No." .. tostring(____exports.default.index)) .. "]===========")
    end
    if ____exports.default.enable then
        log:error(...)
        log:error(("===========Error TraceBack Start[No." .. tostring(____exports.default.index)) .. "]===========")
        log:error(tb)
        log:error(("===========Error TraceBack End[No." .. tostring(____exports.default.index)) .. "]===========")
    end
end
function Log.prototype.fatal(...)
    if ____exports.default.enablePrint then
        print("Log.fatal:", ...)
    end
    if ____exports.default.enable then
        log:fatal(...)
    end
end
Log.enable = true
Log.enablePrint = true
Log.index = 1
____exports.default = Log
return ____exports
