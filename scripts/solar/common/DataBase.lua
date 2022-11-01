local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 5,["7"] = 5,["8"] = 5,["10"] = 5,["11"] = 14,["12"] = 14,["13"] = 14,["15"] = 15,["16"] = 16,["17"] = 17,["19"] = 19,["20"] = 19,["21"] = 19,["22"] = 19,["23"] = 19,["24"] = 14,["25"] = 27,["26"] = 28,["27"] = 27,["28"] = 36,["29"] = 37,["30"] = 38,["31"] = 39,["32"] = 40,["35"] = 36,["36"] = 51,["37"] = 51,["38"] = 51,["40"] = 52,["41"] = 53,["42"] = 54,["43"] = 55,["45"] = 57,["46"] = 58,["48"] = 60,["49"] = 61,["50"] = 62,["51"] = 63,["53"] = 65,["54"] = 51,["55"] = 68,["56"] = 69,["57"] = 70,["58"] = 71,["59"] = 72,["60"] = 73,["62"] = 75,["63"] = 75,["64"] = 75,["65"] = 75,["66"] = 75,["67"] = 68,["68"] = 84,["69"] = 85,["70"] = 86,["71"] = 87,["72"] = 88,["74"] = 90,["76"] = 90,["77"] = 90,["78"] = 90,["80"] = 90,["82"] = 90,["85"] = 94,["86"] = 84,["87"] = 97,["88"] = 98,["89"] = 99,["90"] = 100,["91"] = 101,["92"] = 102,["94"] = 104,["95"] = 104,["96"] = 104,["97"] = 104,["98"] = 104,["99"] = 97,["100"] = 110,["101"] = 110,["102"] = 110,["104"] = 111,["105"] = 110,["106"] = 114,["107"] = 115,["108"] = 114,["109"] = 118,["110"] = 118,["111"] = 118,["113"] = 119,["114"] = 118,["115"] = 122,["116"] = 123,["117"] = 122,["118"] = 126,["119"] = 126,["120"] = 126,["122"] = 127,["123"] = 126,["124"] = 130,["125"] = 131,["126"] = 130,["127"] = 138,["128"] = 139,["129"] = 138,["130"] = 142,["131"] = 143,["132"] = 142,["133"] = 146,["134"] = 147,["135"] = 148,["136"] = 149,["137"] = 150,["140"] = 146,["141"] = 160,["142"] = 160,["143"] = 160,["145"] = 161,["146"] = 160,["147"] = 164,["148"] = 165,["149"] = 164,["150"] = 168,["151"] = 169,["152"] = 168,["153"] = 175,["154"] = 175,["155"] = 175,["157"] = 176,["158"] = 175,["159"] = 179,["160"] = 180,["161"] = 179,["162"] = 188,["163"] = 189,["164"] = 190,["165"] = 191,["166"] = 192,["167"] = 193,["168"] = 194,["169"] = 195,["171"] = 197,["174"] = 188,["175"] = 202,["176"] = 202,["177"] = 202,["179"] = 203,["180"] = 202,["181"] = 206,["182"] = 207,["183"] = 206,["184"] = 210,["185"] = 211,["186"] = 210,["187"] = 214,["188"] = 215,["189"] = 214,["190"] = 218,["191"] = 218,["192"] = 218,["194"] = 219,["195"] = 218,["196"] = 222,["197"] = 223,["198"] = 222,["199"] = 236,["200"] = 236,["201"] = 236,["203"] = 237,["204"] = 238,["205"] = 239,["207"] = 241,["208"] = 241,["209"] = 241,["211"] = 241,["212"] = 242,["213"] = 243,["214"] = 244,["216"] = 246,["217"] = 236,["218"] = 6,["219"] = 7,["220"] = 5});
local ____exports = {}
____exports.default = __TS__Class()
local DataBase = ____exports.default
DataBase.name = "DataBase"
function DataBase.prototype.____constructor(self)
end
function DataBase.getDataByHandle(self, ____type, handle, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    if not IsHandle(handle) then
        log.errorWithTraceBack(("DataBase.getData():" .. ____type) .. ":你传的handle为空或0！")
        return nil
    end
    return ____exports.default:getDataByTypeId(
        ____type,
        tostring(GetHandleId(handle)),
        createDefault
    )
end
function DataBase.getTypeData(self, ____type)
    return ____exports.default.dataBaseContext[____type]
end
function DataBase.forTypeDatas(self, ____type, callBack)
    local typeData = ____exports.default.dataBaseContext[____type]
    if typeData then
        for id in pairs(typeData) do
            callBack(nil, id, typeData[id])
        end
    end
end
function DataBase.getDataByTypeId(self, ____type, id, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    local typeData = ____exports.default.dataBaseContext[____type]
    if typeData == nil and createDefault then
        typeData = {}
        ____exports.default.dataBaseContext[____type] = typeData
    end
    if typeData == nil then
        return nil
    end
    local data = typeData[id]
    if not data and createDefault then
        data = {}
        typeData[id] = data
    end
    return data
end
function DataBase.setDataByHandle(self, ____type, handle, obj)
    if not IsHandle(handle) then
        local tb = debug.traceback()
        log.error(("DataBase.setData():" .. ____type) .. ":你传的handle为空或0！")
        log.error(tb)
        return nil
    end
    return ____exports.default:setDataByTypeId(
        ____type,
        tostring(GetHandleId(handle)),
        obj
    )
end
function DataBase.setDataByTypeId(self, ____type, id, obj)
    local typeData = ____exports.default.dataBaseContext[____type]
    if typeData == nil and obj ~= nil then
        typeData = {}
        ____exports.default.dataBaseContext[____type] = typeData
    end
    local ____temp_2 = obj == nil
    if ____temp_2 then
        local ____typeData_id_0 = typeData
        if ____typeData_id_0 ~= nil then
            ____typeData_id_0 = ____typeData_id_0[id]
        end
        ____temp_2 = ____typeData_id_0 == nil
    end
    if ____temp_2 then
        return
    end
    typeData[id] = obj
end
function DataBase.clearDataByHandle(self, ____type, handle)
    if not IsHandle(handle) then
        local tb = debug.traceback()
        log.error(("DataBase.clearData():" .. ____type) .. ":你传的handle为空或0！")
        log.error(tb)
        return nil
    end
    ____exports.default:setDataByTypeId(
        ____type,
        tostring(GetHandleId(handle)),
        nil
    )
end
function DataBase.getUnitTypeSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    return ____exports.default:getDataByTypeId("_SL_UnitType", id, createDefault)
end
function DataBase.setUnitTypeSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_UnitType", id, obj)
end
function DataBase.getItemTypeSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    return ____exports.default:getDataByTypeId("_SL_ItemType", id, createDefault)
end
function DataBase.setItemTypeSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_ItemType", id, obj)
end
function DataBase.getAbilityTypeSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    return ____exports.default:getDataByTypeId("_SL_AbilityType", id, createDefault)
end
function DataBase.setAbilityTypeSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_AbilityType", id, obj)
end
function DataBase.getSolarBuffType(self, sBuffTypeId)
    return ____exports.default:getDataByTypeId("_SL_SolarBuffType", sBuffTypeId, false)
end
function DataBase.setSolarBuffType(self, sBuffTypeId, appBuffType)
    ____exports.default:setDataByTypeId("_SL_SolarBuffType", sBuffTypeId, appBuffType)
end
function DataBase.forSolarBuffTypes(self, callBack)
    local typeData = ____exports.default.dataBaseContext._SL_SolarBuffType
    if typeData then
        for id in pairs(typeData) do
            callBack(nil, id, typeData[id])
        end
    end
end
function DataBase.getSolarBuffSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    return ____exports.default:getDataByTypeId("_SL_SolarBuff", id, createDefault)
end
function DataBase.setSolarBuffSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_SolarBuff", id, obj)
end
function DataBase.forSolarBuffSolarData(self, callBack)
    ____exports.default:forTypeDatas("_SL_SolarBuff", callBack)
end
function DataBase.getUnitSolarData(self, handle, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    return ____exports.default:getDataByHandle("+w3u", handle, createDefault)
end
function DataBase.clearUnitSolarData(self, handle)
    ____exports.default:clearDataByHandle("+w3u", handle)
end
function DataBase.forUnitSolarDatas(self, callBack)
    local typeData = ____exports.default.dataBaseContext["+w3u"]
    if typeData then
        for id in pairs(typeData) do
            local handle = ____exports.default.idStrHandleMap[id]
            if handle == nil then
                handle = i2h(tonumber(id))
                ____exports.default.idStrHandleMap[id] = handle
            end
            callBack(nil, handle, typeData[id])
        end
    end
end
function DataBase.getItemSolarData(self, handle, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    return ____exports.default:getDataByHandle("item", handle, createDefault)
end
function DataBase.clearItemSolarData(self, handle)
    ____exports.default:clearDataByHandle("item", handle)
end
function DataBase.getDialogButtonSolarData(self, handle)
    return ____exports.default:getDataByHandle("+dlb", handle)
end
function DataBase.clearDialogButtonSolarData(self, handle)
    ____exports.default:clearDataByHandle("+dlb", handle)
end
function DataBase.getPlayerSolarData(self, handle, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    return ____exports.default:getDataByHandle("+ply", handle, createDefault)
end
function DataBase.clearPlayerSolarData(self, handle)
    ____exports.default:clearDataByHandle("+ply", handle)
end
function DataBase.sd(self, handle, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    if not IsHandle(handle) then
        log.errorWithTraceBack("sd:你传的handle为空或0！")
        return nil
    end
    local ____handledef_result_type_3 = handledef(handle)
    if ____handledef_result_type_3 ~= nil then
        ____handledef_result_type_3 = ____handledef_result_type_3.type
    end
    local ____type = ____handledef_result_type_3
    if not ____type then
        log.errorWithTraceBack(("sd:" .. ____type) .. ":你传的handle类型不存在！")
        return nil
    end
    return ____exports.default:getDataByHandle(____type, handle, createDefault)
end
DataBase.idStrHandleMap = {}
DataBase.dataBaseContext = {}
____exports.default = DataBase
return ____exports
