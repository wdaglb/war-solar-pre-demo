local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 4,["16"] = 4,["17"] = 4,["19"] = 4,["20"] = 14,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 18,["25"] = 19,["26"] = 20,["27"] = 20,["28"] = 20,["31"] = 14,["32"] = 30,["33"] = 31,["34"] = 32,["35"] = 33,["37"] = 34,["38"] = 35,["40"] = 37,["41"] = 38,["43"] = 40,["47"] = 42,["48"] = 30,["49"] = 50,["50"] = 51,["51"] = 51,["52"] = 51,["53"] = 52,["54"] = 53,["55"] = 54,["56"] = 55,["57"] = 56,["58"] = 51,["59"] = 51,["60"] = 50,["61"] = 6,["62"] = 4});
local ____exports = {}
local ____Cache = require("solar.tool.Cache")
local Cache = ____Cache.default
local ____CodecUtil = require("solar.util.math.CodecUtil")
local CodecUtil = ____CodecUtil.default
____exports.default = __TS__Class()
local ListFileUtil = ____exports.default
ListFileUtil.name = "ListFileUtil"
function ListFileUtil.prototype.____constructor(self)
end
function ListFileUtil.requireDir(self, dirPath, onRequireResult)
    local result = ____exports.default:lookupAll(dirPath, ".lua")
    for ____, luaPath in ipairs(result) do
        local requirePath = __TS__StringReplaceAll(luaPath, "\\", ".")
        requirePath = __TS__StringSubstring(requirePath, 0, #requirePath - 4)
        local requireResult = require(requirePath)
        local ____onRequireResult_result_0 = onRequireResult
        if ____onRequireResult_result_0 ~= nil then
            ____onRequireResult_result_0 = ____onRequireResult_result_0(nil, luaPath, requireResult)
        end
    end
end
function ListFileUtil.lookupAll(self, start, ____end)
    local listFileArray = ____exports.default:getListFile()
    local result = {}
    for ____, path in ipairs(listFileArray) do
        do
            if not __TS__StringStartsWith(path, start) then
                goto __continue7
            end
            if ____end and not __TS__StringEndsWith(path, ____end) then
                goto __continue7
            end
            result[#result + 1] = path
        end
        ::__continue7::
    end
    return result
end
function ListFileUtil.getListFile(self)
    return ____exports.default._sl_cache:get(
        "getListFile",
        function()
            local envars = require("env_vars")
            local listFileS = envars.listFile
            local jsonStr = CodecUtil:saesDecode(listFileS)
            local listFileArray = JSON:parse(jsonStr)
            return listFileArray
        end
    )
end
ListFileUtil._sl_cache = __TS__New(Cache)
____exports.default = ListFileUtil
return ____exports
