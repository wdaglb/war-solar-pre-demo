local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 23,["16"] = 23,["17"] = 23,["19"] = 23,["20"] = 28,["21"] = 29,["22"] = 28,["23"] = 36,["24"] = 37,["25"] = 38,["26"] = 36,["27"] = 46,["28"] = 47,["29"] = 48,["30"] = 46,["31"] = 54,["32"] = 55,["33"] = 56,["34"] = 54,["35"] = 62,["36"] = 63,["37"] = 64,["38"] = 62,["39"] = 72,["40"] = 73,["41"] = 74,["42"] = 75,["44"] = 77,["45"] = 72,["46"] = 87,["47"] = 88,["48"] = 89,["49"] = 90,["50"] = 91,["52"] = 94,["53"] = 95,["54"] = 96,["55"] = 98,["56"] = 99,["57"] = 100,["58"] = 101,["59"] = 101,["60"] = 101,["61"] = 102,["62"] = 101,["63"] = 101,["67"] = 107,["68"] = 108,["70"] = 111,["71"] = 112,["72"] = 87,["73"] = 120,["74"] = 121,["75"] = 122,["77"] = 123,["78"] = 123,["79"] = 124,["80"] = 125,["83"] = 128,["84"] = 129,["85"] = 129,["86"] = 129,["88"] = 129,["89"] = 130,["90"] = 131,["92"] = 133,["93"] = 123,["96"] = 135,["97"] = 136,["98"] = 120,["99"] = 143,["100"] = 144,["101"] = 144,["102"] = 144,["104"] = 144,["105"] = 143,["106"] = 152,["107"] = 153,["108"] = 153,["109"] = 153,["111"] = 153,["112"] = 152,["113"] = 160,["114"] = 161,["115"] = 162,["116"] = 162,["117"] = 162,["119"] = 162,["120"] = 160,["121"] = 169,["122"] = 170,["123"] = 171,["124"] = 171,["125"] = 171,["127"] = 171,["128"] = 172,["129"] = 173,["131"] = 175,["132"] = 176,["133"] = 177,["134"] = 177,["135"] = 177,["137"] = 177,["138"] = 178,["139"] = 179,["142"] = 182,["143"] = 169,["144"] = 190,["145"] = 191,["146"] = 192,["147"] = 193,["148"] = 194,["151"] = 197,["153"] = 191,["154"] = 190,["155"] = 208,["156"] = 209,["157"] = 211,["158"] = 212,["159"] = 212,["160"] = 212,["162"] = 212,["163"] = 213,["164"] = 214,["165"] = 215,["166"] = 216,["167"] = 216,["168"] = 216,["170"] = 216,["171"] = 217,["175"] = 211,["177"] = 224,["178"] = 225,["179"] = 225,["180"] = 225,["182"] = 225,["183"] = 226,["184"] = 227,["185"] = 228,["188"] = 224,["190"] = 208,["191"] = 239,["192"] = 240,["193"] = 241,["196"] = 244,["197"] = 245,["198"] = 246,["199"] = 247,["202"] = 239,["203"] = 258,["204"] = 259,["205"] = 259,["206"] = 259,["208"] = 258,["209"] = 267,["210"] = 267,["211"] = 267,["213"] = 268,["214"] = 269,["217"] = 272,["218"] = 273,["219"] = 274,["220"] = 274,["221"] = 274,["223"] = 274,["224"] = 275,["227"] = 278,["228"] = 278,["229"] = 278,["233"] = 267,["234"] = 289,["235"] = 290,["236"] = 291,["239"] = 294,["240"] = 295,["241"] = 296,["242"] = 296,["243"] = 296,["245"] = 296,["246"] = 296,["247"] = 296,["249"] = 296,["250"] = 297,["253"] = 289,["254"] = 306,["255"] = 307,["256"] = 307,["257"] = 306,["258"] = 313,["259"] = 314,["260"] = 314,["261"] = 313,["262"] = 320,["263"] = 321,["264"] = 321,["265"] = 320,["266"] = 23});
local ____exports = {}
local ____Buff = require("solar.tool.Buff")
local Buff = ____Buff.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____GroupUtil = require("solar.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local BuffUtil = ____exports.default
BuffUtil.name = "BuffUtil"
function BuffUtil.prototype.____constructor(self)
end
function BuffUtil.registerBuffType(self, buffType)
    DataBase:setSolarBuffType(buffType.id, buffType)
end
function BuffUtil.registerBuffCreatedEvent(self, buffTypeId, onCreated)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    buffType.onCreated = onCreated
end
function BuffUtil.registerBuffUpdateEvent(self, buffTypeId, onUpdate)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    buffType.onUpdate = onUpdate
end
function BuffUtil.registerBuffIntervalEvent(self, buffTypeId, onInterval)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    buffType.onInterval = onInterval
end
function BuffUtil.registerBuffDestroyEvent(self, buffTypeId, onDestroy)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    buffType.onDestroy = onDestroy
end
function BuffUtil.getBuffType(self, buffTypeId)
    local bt = DataBase:getSolarBuffType(buffTypeId)
    if not bt then
        log.errorWithTraceBack("BuffType(增益效果类型)不存在!ID=" .. buffTypeId)
    end
    return bt
end
function BuffUtil.addBuff(self, unit, buffTypeId, caster)
    local buffType = DataBase:getSolarBuffType(buffTypeId)
    if not buffType then
        log.errorWithTraceBack("buff不存在!请先使用registerBuffType注册Buff类型! id=" .. buffTypeId)
        return nil
    end
    local oldUnitBuff = ____exports.default:getUnitBuff(unit, buffTypeId)
    if oldUnitBuff then
        if buffType.stackCountMax and buffType.stackCountMax ~= 0 then
            if buffType.stackCountMax == -1 or oldUnitBuff.stackCount < buffType.stackCountMax then
                oldUnitBuff.stackCount = oldUnitBuff.stackCount + 1
                if buffType.stackDurMode then
                    BaseUtil.runLater(
                        buffType.dur,
                        function()
                            oldUnitBuff.stackCount = oldUnitBuff.stackCount - 1
                        end
                    )
                end
            end
        end
        oldUnitBuff:refresh()
        return oldUnitBuff
    end
    local buff = __TS__New(Buff, buffType, unit, caster)
    return buff
end
function BuffUtil.getPlayerUnitBuff(self, player, buffTypeId)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(group, player, nil)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            local buff = ____exports.default:getUnitBuff(unitHandle, buffTypeId)
            local ____buff_buffType_id_0 = buff
            if ____buff_buffType_id_0 ~= nil then
                ____buff_buffType_id_0 = ____buff_buffType_id_0.buffType.id
            end
            if ____buff_buffType_id_0 == buffTypeId then
                GroupUtil.groupObjectPool:returnObject(group)
                return buff
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return nil
end
function BuffUtil.getUnitBuff(self, unit, buffTypeId)
    local ____BuffUtil_getUnitBuffs_result_buffTypeId_2 = ____exports.default:getUnitBuffs(unit)
    if ____BuffUtil_getUnitBuffs_result_buffTypeId_2 ~= nil then
        ____BuffUtil_getUnitBuffs_result_buffTypeId_2 = ____BuffUtil_getUnitBuffs_result_buffTypeId_2[buffTypeId]
    end
    return ____BuffUtil_getUnitBuffs_result_buffTypeId_2
end
function BuffUtil.hasUnitBuff(self, unit, buffTypeId)
    local ____BuffUtil_getUnitBuffs_result_buffTypeId_4 = ____exports.default:getUnitBuffs(unit)
    if ____BuffUtil_getUnitBuffs_result_buffTypeId_4 ~= nil then
        ____BuffUtil_getUnitBuffs_result_buffTypeId_4 = ____BuffUtil_getUnitBuffs_result_buffTypeId_4[buffTypeId]
    end
    return ____BuffUtil_getUnitBuffs_result_buffTypeId_4 ~= nil
end
function BuffUtil.getUnitBuffs(self, unit)
    local unitSolarData = DataBase:getUnitSolarData(unit, false)
    local ____unitSolarData__SL_solarBuffSet_6 = unitSolarData
    if ____unitSolarData__SL_solarBuffSet_6 ~= nil then
        ____unitSolarData__SL_solarBuffSet_6 = ____unitSolarData__SL_solarBuffSet_6._SL_solarBuffSet
    end
    return ____unitSolarData__SL_solarBuffSet_6
end
function BuffUtil.getUnitBuffAttributes(self, unit)
    local unitSolarData = DataBase:getUnitSolarData(unit, false)
    local ____unitSolarData__SL_solarBuffSet_8 = unitSolarData
    if ____unitSolarData__SL_solarBuffSet_8 ~= nil then
        ____unitSolarData__SL_solarBuffSet_8 = ____unitSolarData__SL_solarBuffSet_8._SL_solarBuffSet
    end
    local solarBuffSet = ____unitSolarData__SL_solarBuffSet_8
    if not solarBuffSet then
        return nil
    end
    local atrributes = {}
    for solarBuffSetKey in pairs(solarBuffSet) do
        local ____solarBuffSet_solarBuffSetKey_atrribute_10 = solarBuffSet[solarBuffSetKey]
        if ____solarBuffSet_solarBuffSetKey_atrribute_10 ~= nil then
            ____solarBuffSet_solarBuffSetKey_atrribute_10 = ____solarBuffSet_solarBuffSetKey_atrribute_10.atrribute
        end
        local atrribute = ____solarBuffSet_solarBuffSetKey_atrribute_10
        if atrribute then
            atrributes[#atrributes + 1] = atrribute
        end
    end
    return atrributes
end
function BuffUtil.forAllBuffTypes(self, callback, buffTypeClass)
    DataBase:forSolarBuffTypes(function(____, buffTypeID, buffType)
        if buffTypeClass then
            if buffTypeClass == buffType.class then
                callback(nil, buffType)
            end
        else
            callback(nil, buffType)
        end
    end)
end
function BuffUtil.forAllBuffs(self, callback, buffTypeId)
    if buffTypeId then
        DataBase:forUnitSolarDatas(function(____, id, solarData)
            local ____solarData__SL_solarBuffSet_12 = solarData
            if ____solarData__SL_solarBuffSet_12 ~= nil then
                ____solarData__SL_solarBuffSet_12 = ____solarData__SL_solarBuffSet_12._SL_solarBuffSet
            end
            local _SL_solarBuffSet = ____solarData__SL_solarBuffSet_12
            if _SL_solarBuffSet then
                for tempBuffTypeId in pairs(_SL_solarBuffSet) do
                    local buff = _SL_solarBuffSet[tempBuffTypeId]
                    local ____buff_buffType_id_14 = buff
                    if ____buff_buffType_id_14 ~= nil then
                        ____buff_buffType_id_14 = ____buff_buffType_id_14.buffType.id
                    end
                    if ____buff_buffType_id_14 == buffTypeId then
                        callback(nil, buff)
                    end
                end
            end
        end)
    else
        DataBase:forUnitSolarDatas(function(____, id, solarData)
            local ____solarData__SL_solarBuffSet_16 = solarData
            if ____solarData__SL_solarBuffSet_16 ~= nil then
                ____solarData__SL_solarBuffSet_16 = ____solarData__SL_solarBuffSet_16._SL_solarBuffSet
            end
            local _SL_solarBuffSet = ____solarData__SL_solarBuffSet_16
            if _SL_solarBuffSet then
                for tempBuffTypeId in pairs(_SL_solarBuffSet) do
                    callback(nil, _SL_solarBuffSet[tempBuffTypeId])
                end
            end
        end)
    end
end
function BuffUtil.forUnitBuffs(self, unit, callback)
    local buffSet = ____exports.default:getUnitBuffs(unit)
    if not buffSet then
        return
    end
    for buffTypeId in pairs(buffSet) do
        local buff = buffSet[buffTypeId]
        if buff then
            callback(nil, buff)
        end
    end
end
function BuffUtil.clearUnitBuff(self, unit, buffTypeId)
    local ____BuffUtil_getUnitBuff_result_destroy_result_18 = ____exports.default:getUnitBuff(unit, buffTypeId)
    if ____BuffUtil_getUnitBuff_result_destroy_result_18 ~= nil then
        ____BuffUtil_getUnitBuff_result_destroy_result_18 = ____BuffUtil_getUnitBuff_result_destroy_result_18:destroy()
    end
end
function BuffUtil.clearUnitBuffs(self, unit, onlyDeBuff)
    if onlyDeBuff == nil then
        onlyDeBuff = false
    end
    local buffs = ____exports.default:getUnitBuffs(unit)
    if not buffs then
        return
    end
    for buffsKey in pairs(buffs) do
        if onlyDeBuff then
            local ____buffs_buffsKey_buffType_isDebuff_20 = buffs[buffsKey]
            if ____buffs_buffsKey_buffType_isDebuff_20 ~= nil then
                ____buffs_buffsKey_buffType_isDebuff_20 = ____buffs_buffsKey_buffType_isDebuff_20.buffType.isDebuff
            end
            if ____buffs_buffsKey_buffType_isDebuff_20 then
                buffs[buffsKey]:destroy()
            end
        else
            local ____buffs_buffsKey_destroy_result_22 = buffs[buffsKey]
            if ____buffs_buffsKey_destroy_result_22 ~= nil then
                ____buffs_buffsKey_destroy_result_22 = ____buffs_buffsKey_destroy_result_22:destroy()
            end
        end
    end
end
function BuffUtil.clearUnitBuffsByClass(self, unit, clazz)
    local buffs = ____exports.default:getUnitBuffs(unit)
    if not buffs then
        return
    end
    for buffsKey in pairs(buffs) do
        local buff = buffs[buffsKey]
        local ____buff_buffType_26 = buff
        if ____buff_buffType_26 ~= nil then
            ____buff_buffType_26 = ____buff_buffType_26.buffType
        end
        local ____buff_buffType_class_24 = ____buff_buffType_26
        if ____buff_buffType_class_24 ~= nil then
            ____buff_buffType_class_24 = ____buff_buffType_class_24.class
        end
        if ____buff_buffType_class_24 == clazz then
            buff:destroy()
        end
    end
end
function BuffUtil.addAnyBuffCreatedListener(self, onBuffCreatedListener)
    local ____Buff__sl_anyBuffCreatedListeners_28 = Buff._sl_anyBuffCreatedListeners
    ____Buff__sl_anyBuffCreatedListeners_28[#____Buff__sl_anyBuffCreatedListeners_28 + 1] = onBuffCreatedListener
end
function BuffUtil.addAnyBuffStackCountChangeListener(self, onBuffStackCountChangeListener)
    local ____Buff__sl_anyBuffStackCountChangeListeners_29 = Buff._sl_anyBuffStackCountChangeListeners
    ____Buff__sl_anyBuffStackCountChangeListeners_29[#____Buff__sl_anyBuffStackCountChangeListeners_29 + 1] = onBuffStackCountChangeListener
end
function BuffUtil.addAnyBuffDestroyListener(self, onBuffDestroyListener)
    local ____Buff__sl_anyBuffDestroyListeners_30 = Buff._sl_anyBuffDestroyListeners
    ____Buff__sl_anyBuffDestroyListeners_30[#____Buff__sl_anyBuffDestroyListeners_30 + 1] = onBuffDestroyListener
end
____exports.default = BuffUtil
return ____exports
