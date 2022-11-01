local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 10,["25"] = 10,["26"] = 10,["27"] = 10,["28"] = 10,["29"] = 11,["30"] = 11,["31"] = 11,["32"] = 11,["33"] = 11,["34"] = 11,["35"] = 11,["36"] = 12,["37"] = 12,["38"] = 12,["39"] = 12,["40"] = 12,["41"] = 12,["42"] = 12,["43"] = 14,["44"] = 14,["45"] = 14,["46"] = 14,["47"] = 14,["48"] = 14,["49"] = 14,["50"] = 16,["51"] = 19,["52"] = 20,["53"] = 20,["54"] = 20,["55"] = 20,["56"] = 20,["57"] = 21,["58"] = 22,["59"] = 23,["60"] = 24,["61"] = 25,["62"] = 26,["63"] = 27,["65"] = 21,["66"] = 32,["67"] = 33,["68"] = 33,["69"] = 33,["70"] = 34,["72"] = 35,["73"] = 35,["74"] = 36,["75"] = 36,["76"] = 36,["77"] = 36,["78"] = 36,["79"] = 36,["80"] = 36,["81"] = 35,["84"] = 38,["85"] = 39,["86"] = 33,["87"] = 33,["88"] = 42,["89"] = 43,["90"] = 44});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____player = require("solar.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____hero = require("data.units.hero")
local heroData = ____hero.heroData
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____unit = require("data.units.unit")
local units = ____unit.units
local ____item = require("data.lib.item.index")
local initItem = ____item.default
local ____Dao = require("data.config.items.Dao")
local Dao = ____Dao.Dao
function ____exports.default(self)
    CreateUnit(
        Player(0),
        "H001",
        0,
        0,
        270
    )
    CreateUnit(
        Player(0),
        "H002",
        0,
        0,
        270
    )
    CreateUnit(
        Player(0),
        "H003",
        0,
        0,
        270
    )
    CreateUnit(
        Player(0),
        "hvlt",
        300,
        300,
        270
    )
    initItem(nil)
    local tri = __TS__New(Trigger)
    tri:registerPlayerUnitEvent(
        MapPlayer:fromIndex(0),
        EVENT_PLAYER_UNIT_ATTACKED,
        nil
    )
    tri:addAction(function()
        local unit = GetTriggerUnit()
        local typeId = id2string(GetUnitTypeId(unit))
        local unitData = heroData:get(typeId)
        if unitData ~= nil then
            print_r("暴击率：" .. tostring(unitData.hit))
            print_r("最终伤害：" .. tostring(unitData.damageAdd))
        end
    end)
    local number = 1
    BaseUtil.onTimer(
        5,
        function()
            local unitData = units[number]
            do
                local i = 0
                while i < 3 do
                    CreateUnit(
                        Player(14),
                        unitData.id,
                        0,
                        0,
                        270
                    )
                    i = i + 1
                end
            end
            number = number + 1
            return number <= #units
        end
    )
    __TS__New(Dao)
    __TS__New(Dao)
    __TS__New(Dao)
end
return ____exports
