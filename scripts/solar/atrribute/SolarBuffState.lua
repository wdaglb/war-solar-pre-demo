local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 14,["24"] = 14,["25"] = 15,["26"] = 15,["27"] = 18,["28"] = 18,["29"] = 18,["31"] = 41,["32"] = 42,["36"] = 46,["37"] = 47,["38"] = 48,["39"] = 50,["40"] = 51,["41"] = 50,["42"] = 48,["43"] = 56,["44"] = 57,["45"] = 57,["46"] = 57,["47"] = 57,["48"] = 57,["49"] = 57,["50"] = 57,["51"] = 57,["52"] = 59,["53"] = 60,["54"] = 61,["55"] = 64,["56"] = 66,["57"] = 67,["58"] = 70,["59"] = 71,["60"] = 72,["62"] = 40,["63"] = 77,["64"] = 78,["65"] = 79,["66"] = 80,["67"] = 81,["68"] = 82,["69"] = 83,["70"] = 84,["72"] = 77,["73"] = 88,["74"] = 89,["75"] = 90,["76"] = 88,["77"] = 96,["78"] = 97,["79"] = 98,["80"] = 99,["83"] = 104,["84"] = 105,["85"] = 106,["88"] = 110,["89"] = 111,["90"] = 112,["91"] = 113,["93"] = 114,["94"] = 115,["95"] = 116,["97"] = 118,["98"] = 119,["99"] = 120,["100"] = 121,["101"] = 122,["102"] = 124,["103"] = 125,["107"] = 128,["108"] = 129,["109"] = 128,["110"] = 96,["111"] = 138,["112"] = 139,["113"] = 140,["114"] = 139,["115"] = 138,["116"] = 152,["117"] = 153,["118"] = 154,["119"] = 154,["120"] = 154,["122"] = 154,["123"] = 155,["124"] = 156,["128"] = 160,["130"] = 165,["131"] = 166,["132"] = 167,["134"] = 170,["135"] = 171,["136"] = 173,["137"] = 175,["138"] = 152,["139"] = 21,["140"] = 28,["141"] = 28,["142"] = 28,["143"] = 29,["144"] = 30,["145"] = 31,["146"] = 32,["147"] = 33,["148"] = 34,["149"] = 28,["150"] = 28,["151"] = 36,["152"] = 37,["153"] = 38,["154"] = 18});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BuffUtil = require("solar.util.system.BuffUtil")
local BuffUtil = ____BuffUtil.default
local ____ObjectPool = require("solar.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
local ____frame = require("solar.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____SelectUtil = require("solar.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____ColorStr = require("solar.constant.ColorStr")
local ColorStr = ____ColorStr.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitAttributeState = require("solar.atrribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SingletonUtil = require("solar.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local SolarBuffState = ____exports.default
SolarBuffState.name = "SolarBuffState"
function SolarBuffState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarBuffState()")
        return
    end
    --- buff 属性更新到单位属性
    local trigger2 = __TS__New(Trigger)
    trigger2:registerTimerEvent(0.83, true)
    trigger2:addAction(function()
        DataBase:forUnitSolarDatas(function(____, u, solarData)
            ____exports.default:refreshBuffAtrributes2UnitSolarAtrribute(u)
        end)
    end)
    if ____exports.default.config.showSolarBuffUI then
        ____exports.default.ubertipFrameBD = __TS__New(
            Frame,
            "BACKDROP",
            nil,
            nil,
            "_sl_border_backdrop",
            0
        )
        ____exports.default.ubertipFrameText = Frame:createTEXT()
        ____exports.default.ubertipFrameText:setAbsPoint(FRAMEPOINT_BOTTOMRIGHT, 0.78, 0.17)
        ____exports.default.ubertipFrameText:setSize(0.16, 0)
        ____exports.default.ubertipFrameBD:setPoints(____exports.default.ubertipFrameText.current, 0.01, 0.01)
        ____exports.default.ubertipFrameBD.visible = false
        ____exports.default.ubertipFrameText.visible = false
        local trigger = __TS__New(Trigger)
        trigger:registerTimerEvent(0.1, true)
        trigger:addAction(self.refreshSolarBuffUI)
    end
end
function SolarBuffState.showUbertip()
    local frameH = DzGetTriggerUIEventFrame()
    local buff = ____exports.default.frameBuffMap["f" .. tostring(frameH)]
    if buff then
        local buffTips = (((((((ColorStr.yellow .. buff:getName()) .. "|n|n") .. ColorStr.green) .. "Buff层数: ") .. tostring(buff.stackCount)) .. "|n|n") .. ColorStr.white) .. buff:getUbertip()
        ____exports.default.ubertipFrameText:setText(buffTips)
        ____exports.default.ubertipFrameBD.visible = true
        ____exports.default.ubertipFrameText.visible = true
    end
end
function SolarBuffState.hideUbertip()
    ____exports.default.ubertipFrameBD.visible = false
    ____exports.default.ubertipFrameText.visible = false
end
function SolarBuffState.prototype.refreshSolarBuffUI()
    local realSelectUnit = SelectUtil.getRealSelectUnit()
    if not IsHandle(realSelectUnit) then
        ____exports.default:showBuffsUI(false)
        return
    end
    local unitBuffs = BuffUtil:getUnitBuffs(realSelectUnit)
    if not unitBuffs then
        ____exports.default:showBuffsUI(false)
        return
    end
    local objectPool = ____exports.default.objectPool
    objectPool:setAllIdleStatus(true)
    local index = 0
    for buffTypeId in pairs(unitBuffs) do
        do
            local buff = unitBuffs[buffTypeId]
            if buff.buffType.class and buff.buffType.class ~= "基础" then
                goto __continue14
            end
            local frames = objectPool:borrowObject()
            local frame = frames[1]
            frame.visible = true
            frames[2]:setTexture(buff.buffType.art)
            frame:setAbsPoint(FRAMEPOINT_BOTTOMLEFT, 0.37 + index * 0.016, 0.007)
            ____exports.default.frameBuffMap["f" .. tostring(frame.current)] = buff
            index = index + 1
        end
        ::__continue14::
    end
    objectPool:forDirtyObjects(function(____, frames)
        frames[1].visible = false
    end)
end
function SolarBuffState.showBuffsUI(self, show)
    ____exports.default.objectPool:forActiveObjects(function(____, frames)
        frames[1].visible = show
    end)
end
function SolarBuffState.refreshBuffAtrributes2UnitSolarAtrribute(self, unitHandle)
    local atrributes = BuffUtil:getUnitBuffAttributes(unitHandle)
    local ____DataBase_getUnitSolarData_result__SL_totalBuffsSolarAtrribute_0 = DataBase:getUnitSolarData(unitHandle, false)
    if ____DataBase_getUnitSolarData_result__SL_totalBuffsSolarAtrribute_0 ~= nil then
        ____DataBase_getUnitSolarData_result__SL_totalBuffsSolarAtrribute_0 = ____DataBase_getUnitSolarData_result__SL_totalBuffsSolarAtrribute_0._SL_totalBuffsSolarAtrribute
    end
    local unitOldBuffsAttr = ____DataBase_getUnitSolarData_result__SL_totalBuffsSolarAtrribute_0
    if unitOldBuffsAttr == nil then
        if atrributes == nil or #atrributes == 0 then
            return
        end
    end
    local totalAtrribute = AttributeUtil:sumAtrributes(atrributes)
    --- dmg system
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if not solarData._SL_solarAtrribute then
        solarData._SL_solarAtrribute = {}
    end
    AttributeUtil:subtract(solarData._SL_solarAtrribute, unitOldBuffsAttr)
    AttributeUtil:add(solarData._SL_solarAtrribute, totalAtrribute)
    solarData._SL_totalBuffsSolarAtrribute = totalAtrribute
    UnitAttributeState:refreshUnitSolarAtrribute(unitHandle)
end
SolarBuffState.config = {showSolarBuffUI = true}
SolarBuffState.objectPool = __TS__New(
    ObjectPool,
    function()
        local frame = Frame:createBUTTON()
        local backgroundImage = frame:addBackgroundImage("")
        frame:setOnMouseEnter(____exports.default.showUbertip)
        frame:setOnMouseLeave(____exports.default.hideUbertip)
        frame:setSize(0.015, 0.015)
        return {frame, backgroundImage}
    end
)
SolarBuffState.frameBuffMap = {}
SolarBuffState.ubertipFrameBD = nil
SolarBuffState.ubertipFrameText = nil
____exports.default = SolarBuffState
return ____exports
