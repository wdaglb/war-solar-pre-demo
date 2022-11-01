local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 9,["10"] = 9,["11"] = 9,["13"] = 9,["14"] = 18,["15"] = 18,["16"] = 18,["18"] = 19,["19"] = 20,["20"] = 21,["22"] = 23,["23"] = 23,["24"] = 23,["26"] = 23,["27"] = 18,["28"] = 31,["29"] = 31,["30"] = 31,["32"] = 32,["33"] = 33,["34"] = 34,["36"] = 36,["37"] = 36,["38"] = 36,["40"] = 36,["41"] = 31,["42"] = 44,["43"] = 44,["44"] = 44,["46"] = 45,["47"] = 46,["48"] = 47,["50"] = 49,["51"] = 49,["52"] = 49,["54"] = 49,["55"] = 44,["56"] = 58,["57"] = 58,["58"] = 58,["60"] = 59,["61"] = 60,["62"] = 61,["63"] = 62,["64"] = 63,["66"] = 65,["67"] = 66,["68"] = 58,["69"] = 75,["70"] = 75,["71"] = 75,["73"] = 76,["74"] = 77,["75"] = 78,["76"] = 79,["77"] = 80,["79"] = 82,["80"] = 83,["81"] = 75,["82"] = 92,["83"] = 92,["84"] = 92,["86"] = 93,["87"] = 94,["88"] = 95,["89"] = 96,["90"] = 97,["92"] = 99,["93"] = 100,["94"] = 92,["95"] = 106,["96"] = 107,["97"] = 108,["98"] = 108,["99"] = 108,["101"] = 108,["102"] = 109,["103"] = 110,["105"] = 107,["106"] = 106,["107"] = 119,["108"] = 120,["109"] = 121,["110"] = 122,["112"] = 124,["113"] = 125,["115"] = 126,["116"] = 127,["118"] = 129,["119"] = 130,["121"] = 132,["126"] = 136,["127"] = 119,["128"] = 143,["129"] = 144,["132"] = 147,["133"] = 148,["134"] = 149,["137"] = 143,["138"] = 158,["139"] = 159,["142"] = 162,["143"] = 163,["144"] = 164,["147"] = 158,["148"] = 173,["149"] = 174,["152"] = 177,["153"] = 178,["155"] = 180,["156"] = 181,["157"] = 182,["160"] = 185,["161"] = 173,["162"] = 9});
local ____exports = {}
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local AttributeUtil = ____exports.default
AttributeUtil.name = "AttributeUtil"
function AttributeUtil.prototype.____constructor(self)
end
function AttributeUtil.getUnitAttribute(self, unitHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getUnitSolarData(unitHandle, createDefault)
    if createDefault and not solarData._SL_solarAtrribute then
        solarData._SL_solarAtrribute = {}
    end
    local ____solarData__SL_solarAtrribute_0 = solarData
    if ____solarData__SL_solarAtrribute_0 ~= nil then
        ____solarData__SL_solarAtrribute_0 = ____solarData__SL_solarAtrribute_0._SL_solarAtrribute
    end
    return ____solarData__SL_solarAtrribute_0
end
function AttributeUtil.getItemAttribute(self, itemHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getItemSolarData(itemHandle, createDefault)
    if createDefault and not solarData._SL_solarAtrribute then
        solarData._SL_solarAtrribute = {}
    end
    local ____solarData__SL_solarAtrribute_2 = solarData
    if ____solarData__SL_solarAtrribute_2 ~= nil then
        ____solarData__SL_solarAtrribute_2 = ____solarData__SL_solarAtrribute_2._SL_solarAtrribute
    end
    return ____solarData__SL_solarAtrribute_2
end
function AttributeUtil.getPlayerAttribute(self, playerHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getPlayerSolarData(playerHandle, createDefault)
    if createDefault and not solarData._SL_solarAtrribute then
        solarData._SL_solarAtrribute = {}
    end
    local ____solarData__SL_solarAtrribute_4 = solarData
    if ____solarData__SL_solarAtrribute_4 ~= nil then
        ____solarData__SL_solarAtrribute_4 = ____solarData__SL_solarAtrribute_4._SL_solarAtrribute
    end
    return ____solarData__SL_solarAtrribute_4
end
function AttributeUtil.setPlayerAttribute(self, playerHandle, atrribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getPlayerSolarData(playerHandle)
    local oldAtrribute = solarData._SL_solarAtrribute
    if oldAtrribute and not allowCover then
        log.errorWithTraceBack("此玩家已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!")
        return oldAtrribute
    end
    solarData._SL_solarAtrribute = atrribute
    return oldAtrribute
end
function AttributeUtil.setUnitAttribute(self, unitHandle, atrribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local unitSolarData = db:getUnitSolarData(unitHandle)
    local oldAtrribute = unitSolarData._SL_solarAtrribute
    if oldAtrribute and not allowCover then
        log.errorWithTraceBack("此单位已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!")
        return oldAtrribute
    end
    unitSolarData._SL_solarAtrribute = atrribute
    return oldAtrribute
end
function AttributeUtil.setItemAttribute(self, itemHandle, atrribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getItemSolarData(itemHandle)
    local oldAtrribute = solarData._SL_solarAtrribute
    if oldAtrribute and not allowCover then
        log.errorWithTraceBack("此物品已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!")
        return oldAtrribute
    end
    solarData._SL_solarAtrribute = atrribute
    return oldAtrribute
end
function AttributeUtil.forAllUnitsAttribute(self, callback)
    DataBase:forUnitSolarDatas(function(____, u, solarData)
        local ____solarData__SL_solarAtrribute_6 = solarData
        if ____solarData__SL_solarAtrribute_6 ~= nil then
            ____solarData__SL_solarAtrribute_6 = ____solarData__SL_solarAtrribute_6._SL_solarAtrribute
        end
        local solarAtrribute = ____solarData__SL_solarAtrribute_6
        if solarAtrribute then
            callback(nil, u, solarAtrribute)
        end
    end)
end
function AttributeUtil.sumAtrributes(self, atrributes)
    local result = {}
    if atrributes == nil then
        return result
    end
    for ____, atrribute in ipairs(atrributes) do
        for key in pairs(atrribute) do
            do
                if type(atrribute[key]) ~= "number" then
                    goto __continue21
                end
                if not result[key] then
                    result[key] = 0
                end
                result[key] = result[key] + atrribute[key]
            end
            ::__continue21::
        end
    end
    return result
end
function AttributeUtil.add(self, atrribute, _atrribute)
    if not _atrribute then
        return
    end
    for key in pairs(_atrribute) do
        if type(_atrribute[key]) == "number" then
            atrribute[key] = (atrribute[key] or 0) + _atrribute[key]
        end
    end
end
function AttributeUtil.subtract(self, atrribute, _atrribute)
    if not _atrribute then
        return
    end
    for key in pairs(_atrribute) do
        if type(_atrribute[key]) == "number" then
            atrribute[key] = (atrribute[key] or 0) - _atrribute[key]
        end
    end
end
function AttributeUtil.multiply(self, atrribute, scale, store)
    if not atrribute then
        return
    end
    if store == nil then
        store = __TS__ObjectAssign({}, atrribute)
    end
    for key in pairs(atrribute) do
        if type(atrribute[key]) == "number" then
            store[key] = (atrribute[key] or 0) * scale
        end
    end
    return store
end
____exports.default = AttributeUtil
return ____exports
