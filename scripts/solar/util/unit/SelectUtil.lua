local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 11,["16"] = 11,["17"] = 11,["19"] = 11,["20"] = 21,["21"] = 21,["22"] = 21,["24"] = 22,["25"] = 22,["26"] = 22,["27"] = 22,["28"] = 22,["29"] = 22,["31"] = 22,["32"] = 23,["33"] = 24,["35"] = 26,["36"] = 27,["38"] = 29,["39"] = 29,["40"] = 29,["41"] = 31,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 32,["46"] = 32,["48"] = 33,["49"] = 33,["50"] = 34,["51"] = 35,["54"] = 38,["55"] = 44,["56"] = 45,["58"] = 47,["59"] = 33,["62"] = 49,["63"] = 50,["64"] = 29,["65"] = 29,["66"] = 53,["67"] = 54,["69"] = 57,["70"] = 21,["71"] = 64,["72"] = 64,["73"] = 64,["75"] = 65,["76"] = 66,["77"] = 64,["78"] = 73,["79"] = 73,["80"] = 73,["82"] = 74,["83"] = 75,["84"] = 76,["85"] = 77,["86"] = 78,["87"] = 79,["90"] = 82,["91"] = 73,["92"] = 89,["93"] = 89,["94"] = 89,["96"] = 90,["97"] = 91,["98"] = 92,["99"] = 93,["100"] = 94,["101"] = 95,["104"] = 98,["105"] = 89,["106"] = 105,["107"] = 106,["108"] = 107,["110"] = 110,["111"] = 110,["112"] = 110,["113"] = 110,["114"] = 110,["115"] = 111,["116"] = 112,["117"] = 113,["119"] = 115,["120"] = 116,["121"] = 117,["123"] = 119,["124"] = 105,["125"] = 125,["126"] = 126,["127"] = 126,["129"] = 126,["130"] = 126,["132"] = 127,["133"] = 128,["134"] = 128,["135"] = 128,["136"] = 128,["137"] = 128,["138"] = 128,["139"] = 128,["140"] = 129,["142"] = 130,["143"] = 130,["144"] = 131,["145"] = 132,["148"] = 135,["149"] = 136,["151"] = 138,["152"] = 130,["155"] = 140,["156"] = 125,["157"] = 146,["158"] = 147,["159"] = 148,["160"] = 148,["161"] = 148,["162"] = 148,["163"] = 148,["164"] = 148,["165"] = 148,["166"] = 149,["167"] = 150,["168"] = 146,["169"] = 158,["170"] = 159,["171"] = 160,["172"] = 161,["173"] = 162,["176"] = 158,["177"] = 172,["178"] = 173,["179"] = 174,["180"] = 175,["181"] = 176,["182"] = 177,["183"] = 178,["187"] = 182,["188"] = 183,["191"] = 172,["192"] = 193,["193"] = 194,["194"] = 195,["195"] = 196,["196"] = 196,["197"] = 196,["198"] = 196,["199"] = 196,["200"] = 197,["202"] = 198,["203"] = 198,["204"] = 199,["205"] = 200,["208"] = 203,["209"] = 204,["211"] = 206,["212"] = 198,["215"] = 208,["216"] = 209,["217"] = 193,["218"] = 218,["219"] = 219,["220"] = 220,["221"] = 220,["222"] = 220,["223"] = 220,["224"] = 220,["225"] = 221,["226"] = 222,["228"] = 223,["229"] = 223,["230"] = 224,["231"] = 225,["234"] = 228,["235"] = 229,["237"] = 231,["238"] = 223,["242"] = 234,["244"] = 236,["245"] = 218,["246"] = 245,["247"] = 245,["248"] = 245,["250"] = 246,["251"] = 247,["253"] = 248,["254"] = 248,["255"] = 249,["256"] = 250,["259"] = 253,["260"] = 254,["262"] = 256,["263"] = 248,["266"] = 258,["267"] = 245,["268"] = 267,["269"] = 267,["270"] = 267,["272"] = 267,["273"] = 267,["275"] = 267,["276"] = 267,["278"] = 267,["279"] = 267,["281"] = 267,["282"] = 267,["284"] = 268,["285"] = 269,["288"] = 273,["289"] = 275,["290"] = 277,["291"] = 279,["292"] = 280,["294"] = 281,["295"] = 281,["297"] = 282,["298"] = 283,["301"] = 286,["302"] = 287,["303"] = 288,["304"] = 289,["305"] = 290,["306"] = 291,["307"] = 292,["310"] = 295,["311"] = 296,["313"] = 298,["316"] = 281,["319"] = 267,["320"] = 12,["321"] = 11});
local ____exports = {}
local ____GroupUtil = require("solar.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local ____Cache = require("solar.tool.Cache")
local Cache = ____Cache.default
local ____GameCenter = require("solar.common.GameCenter")
local GameCenter = ____GameCenter.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local SelectUtil = ____exports.default
SelectUtil.name = "SelectUtil"
function SelectUtil.prototype.____constructor(self)
end
function SelectUtil.getAnHero(playerIndex, clearCache)
    if clearCache == nil then
        clearCache = false
    end
    local ____DataBase_getPlayerSolarData_result_hero_0 = DataBase:getPlayerSolarData(
        Player(playerIndex),
        false
    )
    if ____DataBase_getPlayerSolarData_result_hero_0 ~= nil then
        ____DataBase_getPlayerSolarData_result_hero_0 = ____DataBase_getPlayerSolarData_result_hero_0.hero
    end
    local hero = ____DataBase_getPlayerSolarData_result_hero_0
    if hero then
        return hero
    end
    if clearCache then
        ____exports.default.cache:remove("PlayerHero:" .. tostring(playerIndex))
    end
    local cacheUnitHandle = ____exports.default.cache:get(
        "PlayerHero:" .. tostring(playerIndex),
        function()
            local group = GroupUtil.groupObjectPool:borrowObject()
            GroupEnumUnitsOfPlayer(
                group,
                Player(playerIndex),
                nil
            )
            do
                local i = 0
                while i <= 1000000 do
                    local unitHandle = FirstOfGroup(group)
                    if not IsHandle(unitHandle) then
                        break
                    end
                    if IsUnitType(unitHandle, UNIT_TYPE_HERO) and GetHeroStr(unitHandle, false) > 1 and not IsUnitType(unitHandle, UNIT_TYPE_PEON) and not IsUnitType(unitHandle, UNIT_TYPE_SUMMONED) and not IsUnitIllusion(unitHandle) and not IsUnitHidden(unitHandle) then
                        GroupUtil.groupObjectPool:returnObject(group)
                        return unitHandle
                    end
                    GroupRemoveUnit(group, unitHandle)
                    i = i + 1
                end
            end
            GroupUtil.groupObjectPool:returnObject(group)
            return nil
        end
    )
    if IsHandle(cacheUnitHandle) then
        return cacheUnitHandle
    end
    return nil
end
function SelectUtil.getAnEnemy(playerIndex)
    if playerIndex == nil then
        playerIndex = 0
    end
    local enemyUnits = ____exports.default.getAllEnemys(playerIndex)
    return enemyUnits[GetRandomInt(0, #enemyUnits - 1) + 1]
end
function SelectUtil.getAllEnemys(playerIndex)
    if playerIndex == nil then
        playerIndex = 0
    end
    local enemyUnits = {}
    local allUnits = GameCenter:getAllUnits()
    local player = Player(playerIndex)
    for ____, unit in ipairs(allUnits) do
        if IsUnitEnemy(unit, player) and GetUnitState(unit, UNIT_STATE_LIFE) >= 1 then
            enemyUnits[#enemyUnits + 1] = unit
        end
    end
    return enemyUnits
end
function SelectUtil.getAllEnemysLength(playerIndex)
    if playerIndex == nil then
        playerIndex = 0
    end
    local allUnits = GameCenter:getAllUnits()
    local player = Player(playerIndex)
    local count = 0
    for ____, unit in ipairs(allUnits) do
        if IsUnitEnemy(unit, player) and GetUnitState(unit, UNIT_STATE_LIFE) >= 1 then
            count = count + 1
        end
    end
    return count
end
function SelectUtil.getRealSelectUnit()
    if isEmbedJapi then
        return GetRealSelectUnit()
    end
    GroupEnumUnitsSelected(
        _tempGroup,
        GetLocalPlayer(),
        nil
    )
    local unit = FirstOfGroup(_tempGroup)
    if not IsHandle(unit) then
        return nil
    end
    GroupRemoveUnit(_tempGroup, unit)
    if IsHandle(FirstOfGroup(_tempGroup)) then
        return nil
    end
    return unit
end
function SelectUtil.forEnemyUnitsInRange(center, radius, callback, x, y)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    local myPlayer = GetOwningPlayer(center)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            if IsUnitEnemy(unitHandle, myPlayer) then
                callback(nil, unitHandle)
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forUnitsInRange(x, y, radius, callback)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    GroupUtil["for"](GroupUtil, group, callback)
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forAllAliveUnits(callback)
    local allUnits = GameCenter:getAllUnits()
    for ____, unitHandle in ipairs(allUnits) do
        if GetUnitState(unitHandle, UNIT_STATE_LIFE) >= 1 then
            callback(nil, unitHandle)
        end
    end
end
function SelectUtil.forAllUnits(callback, unitType)
    local allUnits = GameCenter:getAllUnits()
    if unitType then
        local unitTypeNum = FourCC(unitType)
        for ____, unitHandle in ipairs(allUnits) do
            if unitTypeNum == GetUnitTypeId(unitHandle) then
                callback(nil, unitHandle)
            end
        end
    else
        for ____, unitHandle in ipairs(allUnits) do
            callback(nil, unitHandle)
        end
    end
end
function SelectUtil.getPlayerUnits(playerIndex, unitType)
    local resultUnits = {}
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    local unitTypeNum = FourCC(unitType)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            if unitTypeNum == GetUnitTypeId(unitHandle) then
                resultUnits[#resultUnits + 1] = unitHandle
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return resultUnits
end
function SelectUtil.forPlayerUnits(callback, playerIndex, unitType)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    if unitType then
        local unitTypeNum = FourCC(unitType)
        do
            local i = 0
            while i <= 1000000 do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                if unitTypeNum == GetUnitTypeId(unitHandle) then
                    callback(nil, unitHandle)
                end
                GroupRemoveUnit(group, unitHandle)
                i = i + 1
            end
        end
    else
        GroupUtil["for"](GroupUtil, group, callback)
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forAllEnemyUnits(callback, whoseEnemy)
    if whoseEnemy == nil then
        whoseEnemy = Player(0)
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRect(group, bj_mapInitialPlayableArea, nil)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            if IsUnitEnemy(unitHandle, whoseEnemy) then
                callback(nil, unitHandle)
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forLocalCameraUnits(inCameraUnitsCallback, outCameraUnitsCallback, frustumTop, frustumBottom, frustumLeft, frustumRight)
    if outCameraUnitsCallback == nil then
        outCameraUnitsCallback = nil
    end
    if frustumTop == nil then
        frustumTop = 0.56
    end
    if frustumBottom == nil then
        frustumBottom = 0.13
    end
    if frustumLeft == nil then
        frustumLeft = 0
    end
    if frustumRight == nil then
        frustumRight = 0.8
    end
    if not isEmbedJapi then
        log.errorWithTraceBack("没有内置japi环境！")
        return
    end
    local minX, maxY = screen_to_world(frustumLeft, 0.6 - frustumTop)
    local maxX, max2Y = screen_to_world(frustumRight, 0.6 - frustumTop)
    local max2X, minY = screen_to_world(frustumRight, 0.6 - frustumBottom)
    GroupClear(_tempGroup)
    GroupEnumUnitsInRect(_tempGroup, bj_mapInitialPlayableArea, nil)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(_tempGroup)
                if not IsHandle(unitHandle) then
                    break
                end
                local x = GetUnitX(unitHandle)
                if x > minX and x < maxX then
                    local y = GetUnitY(unitHandle)
                    if y > minY and y < maxY then
                        inCameraUnitsCallback(nil, unitHandle)
                        GroupRemoveUnit(_tempGroup, unitHandle)
                        goto __continue57
                    end
                end
                if outCameraUnitsCallback then
                    outCameraUnitsCallback(nil, unitHandle)
                end
                GroupRemoveUnit(_tempGroup, unitHandle)
            end
            ::__continue57::
            i = i + 1
        end
    end
end
SelectUtil.cache = __TS__New(Cache)
____exports.default = SelectUtil
return ____exports
