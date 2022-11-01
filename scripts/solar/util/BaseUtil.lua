local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 5,["14"] = 5,["15"] = 12,["17"] = 13,["18"] = 14,["19"] = 12,["20"] = 22,["22"] = 23,["23"] = 23,["24"] = 24,["25"] = 25,["28"] = 28,["29"] = 29,["30"] = 23,["33"] = 22,["34"] = 42,["35"] = 43,["36"] = 44,["37"] = 45,["38"] = 46,["39"] = 47,["40"] = 48,["41"] = 49,["43"] = 45,["44"] = 52,["45"] = 53,["46"] = 42,["47"] = 62,["48"] = 62,["49"] = 62,["51"] = 63,["52"] = 64,["53"] = 65,["54"] = 66,["55"] = 62,["56"] = 80,["57"] = 81,["58"] = 82,["59"] = 83,["60"] = 80,["61"] = 87,["62"] = 88,["63"] = 87,["64"] = 91,["65"] = 93,["66"] = 94,["67"] = 91,["68"] = 7,["69"] = 72,["70"] = 77,["71"] = 5});
local ____exports = {}
local ____STimer = require("solar.tool.STimer")
local STimer = ____STimer.STimer
time = 0
____exports.default = __TS__Class()
local BaseUtil = ____exports.default
BaseUtil.name = "BaseUtil"
function BaseUtil.prototype.____constructor(self)
end
function BaseUtil.getUUID()
    local ____exports_default_0, ____uuid_1 = ____exports.default, "uuid"
    ____exports_default_0[____uuid_1] = ____exports_default_0[____uuid_1] + 1
    return ____exports.default.uuid
end
function BaseUtil.SForGroup(whichGroup, callback)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(whichGroup)
            if not IsHandle(unitHandle) then
                break
            end
            callback(nil, unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
            i = i + 1
        end
    end
end
function BaseUtil.onTimer(timeOut, onTimerCall)
    local sTimer = __TS__New(STimer)
    local count = 0
    local function callBack()
        count = count + 1
        local ____repeat = onTimerCall(nil, count)
        if not ____repeat then
            sTimer:destroy()
        end
    end
    sTimer:start(timeOut, callBack, true)
    return sTimer
end
function BaseUtil.runLater(timeOut, callBack, loopCount)
    if loopCount == nil then
        loopCount = 1
    end
    local sTimer = __TS__New(STimer)
    sTimer:setLoopCount(loopCount)
    sTimer:start(timeOut, callBack)
    return sTimer
end
function BaseUtil._sl_OnTime()
    time = time + 10
    ____exports.default.time = time
    STimer._sl_OnTime()
end
function BaseUtil.getGameTime()
    return time / 1000
end
function BaseUtil.init()
    ____exports.default.centerTimer = CreateTimer()
    TimerStart(____exports.default.centerTimer, 0.01, true, ____exports.default._sl_OnTime)
end
BaseUtil.uuid = 1
BaseUtil.centerTimer = nil
BaseUtil.time = 0
____exports.default = BaseUtil
return ____exports
