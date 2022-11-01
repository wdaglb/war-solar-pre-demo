local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 14,["22"] = 14,["23"] = 14,["25"] = 18,["26"] = 19,["29"] = 23,["30"] = 24,["31"] = 25,["32"] = 26,["33"] = 27,["34"] = 28,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 31,["39"] = 30,["40"] = 30,["41"] = 27,["42"] = 35,["43"] = 37,["44"] = 38,["45"] = 39,["46"] = 40,["47"] = 39,["48"] = 38,["49"] = 17,["50"] = 50,["51"] = 52,["53"] = 53,["54"] = 53,["56"] = 54,["57"] = 55,["58"] = 56,["60"] = 58,["61"] = 59,["63"] = 61,["64"] = 62,["65"] = 64,["66"] = 65,["67"] = 66,["69"] = 69,["70"] = 70,["71"] = 71,["75"] = 53,["78"] = 77,["79"] = 50,["80"] = 84,["81"] = 85,["82"] = 86,["83"] = 86,["84"] = 86,["86"] = 86,["87"] = 87,["88"] = 88,["92"] = 92,["94"] = 97,["95"] = 98,["96"] = 99,["98"] = 102,["99"] = 103,["100"] = 105,["101"] = 107,["102"] = 84,["103"] = 15,["104"] = 14});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitAttributeState = require("solar.atrribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SelectUtil = require("solar.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____SingletonUtil = require("solar.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local ItemAttributeState = ____exports.default
ItemAttributeState.name = "ItemAttributeState"
function ItemAttributeState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new ItemAttributeState()")
        return
    end
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_PAWN_ITEM)
    trigger:addAction(function()
        local unitHandle = GetTriggerUnit()
        BaseUtil.runLater(
            0.1,
            function()
                ____exports.default:refreshItemAtrributes2UnitSolarAtrribute(unitHandle)
            end
        )
    end)
    local triggerTimer = __TS__New(Trigger)
    triggerTimer:registerTimerEvent(5.89, true)
    triggerTimer:addAction(function()
        SelectUtil.forAllUnits(function(____, u)
            ____exports.default:refreshItemAtrributes2UnitSolarAtrribute(u)
        end)
    end)
end
function ItemAttributeState.getItemsAtrributes(self, unitHandle)
    local itemAtrributes = nil
    do
        local i = 0
        while i < 6 do
            do
                local itemHandle = UnitItemInSlot(unitHandle, i)
                if not IsHandle(itemHandle) then
                    goto __continue9
                end
                if not itemAtrributes then
                    itemAtrributes = {}
                end
                local itemTypeId = GetItemTypeId(itemHandle)
                local itemTypeIdStr = id2string(itemTypeId)
                local itemAtrribute = AttributeUtil:getItemAttribute(itemHandle)
                if itemAtrribute then
                    itemAtrributes[#itemAtrributes + 1] = itemAtrribute
                end
                local configItemAtrribute = ____exports.default.config[itemTypeIdStr]
                if configItemAtrribute then
                    itemAtrributes[#itemAtrributes + 1] = configItemAtrribute
                end
            end
            ::__continue9::
            i = i + 1
        end
    end
    return itemAtrributes
end
function ItemAttributeState.refreshItemAtrributes2UnitSolarAtrribute(self, unitHandle)
    local itemAtrributes = ____exports.default:getItemsAtrributes(unitHandle)
    local ____DataBase_getUnitSolarData_result__SL_totalItemsSolarAtrribute_0 = DataBase:getUnitSolarData(unitHandle, false)
    if ____DataBase_getUnitSolarData_result__SL_totalItemsSolarAtrribute_0 ~= nil then
        ____DataBase_getUnitSolarData_result__SL_totalItemsSolarAtrribute_0 = ____DataBase_getUnitSolarData_result__SL_totalItemsSolarAtrribute_0._SL_totalItemsSolarAtrribute
    end
    local unitOldItemSAttr = ____DataBase_getUnitSolarData_result__SL_totalItemsSolarAtrribute_0
    if unitOldItemSAttr == nil then
        if itemAtrributes == nil or #itemAtrributes == 0 then
            return
        end
    end
    local totalAtrribute = AttributeUtil:sumAtrributes(itemAtrributes)
    --- dmg system
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if not solarData._SL_solarAtrribute then
        solarData._SL_solarAtrribute = {}
    end
    AttributeUtil:subtract(solarData._SL_solarAtrribute, unitOldItemSAttr)
    AttributeUtil:add(solarData._SL_solarAtrribute, totalAtrribute)
    solarData._SL_totalItemsSolarAtrribute = totalAtrribute
    UnitAttributeState:refreshUnitSolarAtrribute(unitHandle)
end
ItemAttributeState.config = {}
____exports.default = ItemAttributeState
return ____exports
