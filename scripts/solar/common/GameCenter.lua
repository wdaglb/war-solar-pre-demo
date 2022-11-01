local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 6,["8"] = 6,["10"] = 6,["11"] = 14,["12"] = 15,["13"] = 16,["15"] = 18,["16"] = 19,["17"] = 14,["18"] = 23,["19"] = 24,["22"] = 28,["23"] = 29,["24"] = 30,["25"] = 32,["26"] = 33,["27"] = 34,["28"] = 34,["29"] = 34,["30"] = 35,["31"] = 35,["32"] = 34,["33"] = 34,["34"] = 38,["35"] = 39,["36"] = 40,["37"] = 42,["38"] = 43,["39"] = 23,["40"] = 46,["41"] = 48,["42"] = 49,["44"] = 50,["45"] = 50,["46"] = 51,["47"] = 52,["50"] = 55,["51"] = 56,["52"] = 50,["55"] = 58,["56"] = 46,["57"] = 7,["58"] = 8,["59"] = 6});
local ____exports = {}
____exports.default = __TS__Class()
local GameCenter = ____exports.default
GameCenter.name = "GameCenter"
function GameCenter.prototype.____constructor(self)
end
function GameCenter.getAllUnits(self)
    if ____exports.default.isInit then
        return self.allUnits
    end
    ____exports.default:checkInit()
    return self.allUnits
end
function GameCenter.checkInit(self)
    if ____exports.default.isInit then
        return
    end
    local t = CreateTrigger()
    local r = CreateRegion()
    local world = GetWorldBounds()
    RegionAddRect(r, world)
    TriggerRegisterEnterRegion(t, r, nil)
    TriggerAddAction(
        t,
        function()
            local ____exports_default_allUnits_0 = ____exports.default.allUnits
            ____exports_default_allUnits_0[#____exports_default_allUnits_0 + 1] = GetTriggerUnit()
        end
    )
    local t2 = CreateTrigger()
    TriggerRegisterTimerEvent(t2, 3, true)
    TriggerAddAction(t, ____exports.default.updateAllUnits)
    ____exports.default.updateAllUnits()
    ____exports.default.isInit = true
end
function GameCenter.updateAllUnits()
    GroupEnumUnitsInRect(tempGroup, bj_mapInitialPlayableArea, nil)
    local allUnits = {}
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(tempGroup)
            if not IsHandle(unitHandle) then
                break
            end
            allUnits[#allUnits + 1] = unitHandle
            GroupRemoveUnit(tempGroup, unitHandle)
            i = i + 1
        end
    end
    ____exports.default.allUnits = allUnits
end
GameCenter.isInit = false
GameCenter.allUnits = {}
____exports.default = GameCenter
return ____exports
