local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 5,["10"] = 6,["11"] = 10,["12"] = 10,["13"] = 10,["15"] = 10,["16"] = 14,["17"] = 16,["18"] = 14,["19"] = 49,["20"] = 50,["21"] = 49,["22"] = 60,["23"] = 61,["24"] = 63,["25"] = 64,["26"] = 65,["27"] = 64,["28"] = 67,["30"] = 68,["31"] = 68,["32"] = 69,["33"] = 70,["36"] = 73,["37"] = 74,["38"] = 68,["42"] = 76,["43"] = 76,["44"] = 77,["45"] = 78,["46"] = 79,["47"] = 76,["50"] = 82,["51"] = 60,["52"] = 86,["53"] = 88,["54"] = 89,["55"] = 88,["56"] = 93,["57"] = 94,["58"] = 93,["59"] = 98,["60"] = 99,["61"] = 98,["62"] = 103,["63"] = 104,["64"] = 103,["65"] = 108,["66"] = 109,["67"] = 108,["68"] = 86,["69"] = 10});
local ____exports = {}
---
-- @noSelfInFile
local CJ = require("jass.common")
local deg = CJ.Rad2Deg(1)
local rad = CJ.Deg2Rad(1)
____exports.default = __TS__Class()
local SolveLuaAsyn = ____exports.default
SolveLuaAsyn.name = "SolveLuaAsyn"
function SolveLuaAsyn.prototype.____constructor(self)
end
function SolveLuaAsyn.init()
    _G.ForGroup = ____exports.default.ForGroup
end
function SolveLuaAsyn.TimerStart(whichTimer, timeout, periodic, handlerFunc)
    CJ.TimerStart(whichTimer, timeout, periodic, handlerFunc)
end
function SolveLuaAsyn.ForGroup(whichGroup, callback)
    local unitHandle = nil
    local oldGetEnumUnit = GetEnumUnit
    _G.GetEnumUnit = function()
        return unitHandle
    end
    local unitArray = {}
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(whichGroup)
            if not IsHandle(unitHandle) then
                break
            end
            unitArray[#unitArray + 1] = unitHandle
            GroupRemoveUnit(whichGroup, unitHandle)
            i = i + 1
        end
    end
    do
        local i = 0
        while i < #unitArray do
            GroupAddUnit(whichGroup, unitArray[i + 1])
            unitHandle = unitArray[i + 1]
            callback()
            i = i + 1
        end
    end
    _G.GetEnumUnit = oldGetEnumUnit
end
function SolveLuaAsyn.SolveMathAsyn()
    math.sin = function(r)
        return CJ.Sin(r * rad)
    end
    math.cos = function(r)
        return CJ.Cos(r * rad)
    end
    math.tan = function(r)
        return CJ.Tan(r * rad)
    end
    math.asin = function(v)
        return CJ.Asin(v) * deg
    end
    math.acos = function(v)
        return CJ.Acos(v) * deg
    end
end
____exports.default = SolveLuaAsyn
return ____exports
