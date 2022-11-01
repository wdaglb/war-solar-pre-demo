local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 7,["7"] = 7,["8"] = 8,["9"] = 8,["10"] = 9,["11"] = 9,["12"] = 11,["13"] = 11,["14"] = 11,["15"] = 13,["16"] = 13,["17"] = 13,["19"] = 14,["20"] = 15,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 22,["27"] = 22,["28"] = 23,["29"] = 24,["30"] = 25,["31"] = 22,["32"] = 22,["33"] = 20,["34"] = 13,["35"] = 34,["36"] = 36,["37"] = 37,["38"] = 38,["39"] = 39,["40"] = 37,["41"] = 42,["42"] = 43,["43"] = 44,["44"] = 45,["45"] = 43,["46"] = 34,["47"] = 11});
local ____exports = {}
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____SingletonUtil = require("solar.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local SolarDataClearState = ____exports.default
SolarDataClearState.name = "SolarDataClearState"
function SolarDataClearState.prototype.____constructor(self, delay)
    if delay == nil then
        delay = 5
    end
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarDataClearState()")
        return
    end
    se:unitDeath(function(whichUnit)
        handle_ref(whichUnit)
        BaseUtil.runLater(
            delay,
            function()
                DataBase:clearUnitSolarData(whichUnit)
                handle_unref(whichUnit)
                RemoveUnit(whichUnit)
            end
        )
    end)
end
function SolarDataClearState._sl_hookClearHandle(self)
    local jassRemoveUnit = RemoveUnit
    _G.RemoveUnit = function(whichUnit)
        DataBase:clearUnitSolarData(whichUnit)
        jassRemoveUnit(whichUnit)
    end
    local jassRemoveItem = RemoveItem
    _G.RemoveItem = function(whichItem)
        DataBase:clearItemSolarData(whichItem)
        jassRemoveItem(whichItem)
    end
end
____exports.default = SolarDataClearState
return ____exports
