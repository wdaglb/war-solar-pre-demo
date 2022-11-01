local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 6,["14"] = 6,["15"] = 6,["17"] = 6,["18"] = 13,["19"] = 14,["22"] = 17,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 17,["28"] = 17,["29"] = 13,["30"] = 25,["31"] = 27,["32"] = 28,["33"] = 29,["34"] = 30,["35"] = 32,["36"] = 33,["37"] = 34,["38"] = 34,["39"] = 34,["40"] = 34,["41"] = 34,["42"] = 34,["43"] = 34,["44"] = 35,["45"] = 36,["46"] = 25,["47"] = 45,["48"] = 46,["49"] = 47,["50"] = 48,["51"] = 45,["52"] = 56,["53"] = 57,["54"] = 58,["55"] = 59,["56"] = 56,["57"] = 63,["58"] = 64,["59"] = 65,["60"] = 65,["61"] = 65,["62"] = 65,["63"] = 65,["64"] = 65,["65"] = 65,["66"] = 66,["67"] = 63,["68"] = 78,["69"] = 79,["70"] = 80,["72"] = 82,["73"] = 83,["75"] = 85,["76"] = 86,["77"] = 78,["78"] = 92,["80"] = 93,["81"] = 93,["82"] = 94,["83"] = 95,["86"] = 98,["87"] = 99,["88"] = 93,["91"] = 92,["92"] = 107,["93"] = 108,["94"] = 109,["95"] = 108,["96"] = 107,["97"] = 116,["98"] = 117,["99"] = 117,["100"] = 117,["101"] = 118,["102"] = 117,["103"] = 117,["104"] = 116,["105"] = 7,["106"] = 71,["107"] = 6});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____SelectUtil = require("solar.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____ItemUtil = require("solar.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
____exports.default = __TS__Class()
local DebugUtil = ____exports.default
DebugUtil.name = "DebugUtil"
function DebugUtil.prototype.____constructor(self)
end
function DebugUtil.showText(text)
    if ____exports.default.noDebug then
        return
    end
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        30,
        text
    )
end
function DebugUtil.countExecuteTime(func)
    local o = os
    local start = o.clock()
    func(nil)
    local useTime = o.clock() - start
    local stringTs = string
    local info = ("函数执行时间=" .. tostring(stringTs.format("%.3f", useTime * 1000))) .. "毫秒"
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        20,
        info
    )
    print(info)
    return useTime
end
function DebugUtil.onTime(time, actionFunc)
    local trigger = __TS__New(Trigger)
    trigger:registerTimerEvent(time, false)
    trigger:addAction(actionFunc)
end
function DebugUtil.onChat(char, actionFunc)
    local trigger = __TS__New(Trigger)
    trigger:registerAnyPlayerChatEvent(char, true)
    trigger:addAction(actionFunc)
end
function DebugUtil.onKeyEvent(key, actionFunc)
    local t = CreateTrigger()
    DzTriggerRegisterKeyEventByCode(
        t,
        key,
        1,
        true,
        nil
    )
    TriggerAddAction(t, actionFunc)
end
function DebugUtil.isLimitTime(key, time)
    if not ____exports.default.limitTimeCache[key] then
        ____exports.default.limitTimeCache[key] = 1
    end
    if ____exports.default.limitTimeCache[key] > time then
        return true
    end
    ____exports.default.limitTimeCache[key] = ____exports.default.limitTimeCache[key] + 1
    return false
end
function DebugUtil.printLocalVars()
    do
        local i = 1
        while i < 1000000 do
            local name, value = debug.getlocal(2, i)
            if not name then
                break
            end
            print(name .. " :")
            print_r(value)
            i = i + 1
        end
    end
end
function DebugUtil.removeAllUnits()
    SelectUtil.forAllUnits(function(____, unit)
        RemoveUnit(unit)
    end)
end
function DebugUtil.removeAllItems()
    ItemUtil.forItemsInRect(
        bj_mapInitialPlayableArea,
        function(____, item)
            RemoveItem(item)
        end
    )
end
DebugUtil.noDebug = false
DebugUtil.limitTimeCache = {}
____exports.default = DebugUtil
return ____exports
