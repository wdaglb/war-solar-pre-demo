local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["29"] = 21,["30"] = 22,["31"] = 23,["32"] = 23,["33"] = 23,["35"] = 27,["36"] = 28,["39"] = 31,["40"] = 32,["41"] = 33,["42"] = 34,["43"] = 26,["44"] = 44,["45"] = 46,["46"] = 47,["47"] = 48,["48"] = 48,["49"] = 48,["50"] = 48,["51"] = 48,["52"] = 50,["53"] = 52,["54"] = 53,["56"] = 47,["57"] = 57,["58"] = 58,["59"] = 59,["60"] = 59,["61"] = 59,["62"] = 59,["63"] = 59,["64"] = 61,["65"] = 58,["66"] = 64,["67"] = 65,["68"] = 66,["69"] = 66,["70"] = 66,["71"] = 66,["72"] = 66,["73"] = 68,["74"] = 71,["75"] = 72,["77"] = 65,["78"] = 77,["79"] = 78,["80"] = 79,["81"] = 79,["82"] = 79,["83"] = 79,["85"] = 79,["86"] = 80,["87"] = 81,["88"] = 82,["89"] = 83,["92"] = 86,["93"] = 78,["94"] = 88,["95"] = 89,["96"] = 90,["97"] = 90,["98"] = 90,["99"] = 90,["101"] = 90,["102"] = 91,["103"] = 92,["104"] = 93,["105"] = 94,["108"] = 97,["109"] = 89,["110"] = 99,["111"] = 100,["112"] = 101,["113"] = 101,["114"] = 101,["115"] = 101,["117"] = 101,["118"] = 102,["119"] = 103,["120"] = 104,["121"] = 105,["124"] = 108,["125"] = 100,["126"] = 44,["127"] = 116,["128"] = 118,["129"] = 119,["130"] = 121,["131"] = 122,["132"] = 122,["133"] = 122,["134"] = 122,["135"] = 122,["136"] = 123,["137"] = 124,["138"] = 125,["139"] = 125,["140"] = 125,["141"] = 125,["142"] = 125,["143"] = 126,["145"] = 128,["147"] = 119,["148"] = 132,["149"] = 133,["150"] = 135,["151"] = 136,["152"] = 136,["153"] = 136,["155"] = 136,["156"] = 138,["157"] = 139,["158"] = 140,["160"] = 142,["161"] = 143,["162"] = 144,["163"] = 145,["164"] = 146,["165"] = 147,["166"] = 148,["167"] = 149,["169"] = 151,["170"] = 152,["171"] = 154,["172"] = 154,["173"] = 154,["174"] = 154,["176"] = 154,["177"] = 155,["178"] = 156,["179"] = 157,["181"] = 160,["182"] = 162,["183"] = 163,["184"] = 164,["185"] = 165,["186"] = 166,["188"] = 168,["189"] = 169,["192"] = 174,["193"] = 175,["194"] = 176,["195"] = 176,["196"] = 176,["198"] = 176,["199"] = 178,["200"] = 179,["201"] = 180,["203"] = 182,["204"] = 183,["205"] = 184,["206"] = 185,["207"] = 186,["208"] = 187,["210"] = 189,["211"] = 190,["214"] = 193,["216"] = 195,["217"] = 133,["218"] = 116,["219"] = 203,["220"] = 205,["221"] = 206,["222"] = 208,["223"] = 209,["224"] = 211,["225"] = 212,["226"] = 212,["227"] = 212,["228"] = 212,["229"] = 213,["230"] = 214,["231"] = 215,["232"] = 216,["233"] = 216,["234"] = 216,["235"] = 216,["236"] = 217,["237"] = 218,["239"] = 206,["240"] = 223,["241"] = 224,["242"] = 226,["243"] = 227,["244"] = 227,["245"] = 227,["247"] = 227,["248"] = 229,["249"] = 230,["250"] = 230,["251"] = 230,["253"] = 230,["255"] = 233,["256"] = 224,["257"] = 236,["258"] = 237,["260"] = 238,["261"] = 238,["262"] = 239,["263"] = 239,["264"] = 239,["265"] = 239,["266"] = 239,["267"] = 239,["268"] = 239,["269"] = 240,["270"] = 240,["271"] = 240,["272"] = 240,["273"] = 240,["274"] = 240,["275"] = 240,["276"] = 238,["279"] = 243,["280"] = 243,["281"] = 243,["282"] = 244,["283"] = 245,["284"] = 246,["285"] = 247,["286"] = 248,["289"] = 251,["290"] = 252,["291"] = 254,["292"] = 255,["293"] = 256,["294"] = 243,["295"] = 243,["296"] = 258,["297"] = 258,["298"] = 258,["299"] = 259,["300"] = 260,["301"] = 261,["302"] = 262,["303"] = 263,["306"] = 266,["307"] = 267,["308"] = 269,["309"] = 270,["310"] = 271,["311"] = 258,["312"] = 258,["313"] = 203,["314"] = 23});
local ____exports = {}
local ____AttributeUtil = require("solar.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitUtil = require("solar.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____HeroUtil = require("solar.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____NativeFrameUtil = require("solar.util.frame.NativeFrameUtil")
local NativeFrameUtil = ____NativeFrameUtil.default
local ____TextUtil = require("solar.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____SingletonUtil = require("solar.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
--- 大数值属性 兼容state
-- 
-- 通过自定义实数number类型 存储数值
-- 
-- 在魔兽原本的设置属性和获取属性  走自定义属性值
-- 
-- 如果超过上限 则底层设置到限制值 属性值走自定义变量存储  显示时需自行需自行用UI显示这些大值
-- 
-- 注意：在大数值模式下一些方法计算并不严谨和准确 如果对数值扣的很细很准 请不要做大数值！
-- （在大属性模式下 不能斤斤计较）
-- link solar_atrribute.d.ts ArmorReducesDamageFactor
local BaseAttributeMax = 10000000
local AgiDefenseBase = S2R(misc.Misc.AgiDefenseBase)
____exports.default = __TS__Class()
local BigAttributeCompatibleState = ____exports.default
BigAttributeCompatibleState.name = "BigAttributeCompatibleState"
function BigAttributeCompatibleState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new BigAttributeCompatibleState()")
        return
    end
    isBigAttributeMode = true
    self:playerAttributeCompatible()
    self:unitAttributeCompatible()
    self:heroAttributeCompatible()
end
function BigAttributeCompatibleState.prototype.heroAttributeCompatible(self)
    local oldSetHeroStr = SetHeroStr
    _G.SetHeroStr = function(whichHero, newStr, permanent)
        oldSetHeroStr(
            whichHero,
            math.min(newStr, BaseAttributeMax),
            permanent
        )
        AttributeUtil:getUnitAttribute(whichHero, true)._SL_BA_str = newStr
        if StrHpBonus > 0 and newStr > BaseAttributeMax then
            UnitUtil.setExtraHp(whichHero, (newStr - BaseAttributeMax) * StrHpBonus, "_SL_SetHeroStr")
        end
    end
    local oldSetHeroAgi = SetHeroAgi
    _G.SetHeroAgi = function(whichHero, newAgi, permanent)
        oldSetHeroAgi(
            whichHero,
            math.min(newAgi, BaseAttributeMax),
            permanent
        )
        AttributeUtil:getUnitAttribute(whichHero, true)._SL_BA_agi = newAgi
    end
    local oldSetHeroInt = SetHeroInt
    _G.SetHeroInt = function(whichHero, newInt, permanent)
        oldSetHeroInt(
            whichHero,
            math.min(newInt, BaseAttributeMax),
            permanent
        )
        AttributeUtil:getUnitAttribute(whichHero, true)._SL_BA_int = newInt
        if IntManaBonus > 0 and newInt > BaseAttributeMax then
            UnitUtil.setExtraMana(whichHero, (newInt - BaseAttributeMax) * IntManaBonus, "_SL_SetHeroInt")
        end
    end
    local oldGetHeroStr = GetHeroStr
    _G.GetHeroStr = function(whichHero, includeBonuses)
        local ____oldGetHeroStr_result_2 = oldGetHeroStr(whichHero, includeBonuses)
        local ____AttributeUtil_getUnitAttribute_result__SL_BA_str_0 = AttributeUtil:getUnitAttribute(whichHero)
        if ____AttributeUtil_getUnitAttribute_result__SL_BA_str_0 ~= nil then
            ____AttributeUtil_getUnitAttribute_result__SL_BA_str_0 = ____AttributeUtil_getUnitAttribute_result__SL_BA_str_0._SL_BA_str
        end
        local val = math.max(____oldGetHeroStr_result_2, ____AttributeUtil_getUnitAttribute_result__SL_BA_str_0 or 0)
        if includeBonuses then
            local exVal = UnitUtil.getExtraStr(whichHero)
            if exVal > BaseAttributeMax then
                val = val + (exVal - BaseAttributeMax)
            end
        end
        return val
    end
    local oldGetHeroAgi = GetHeroAgi
    _G.GetHeroAgi = function(whichHero, includeBonuses)
        local ____oldGetHeroAgi_result_5 = oldGetHeroAgi(whichHero, includeBonuses)
        local ____AttributeUtil_getUnitAttribute_result__SL_BA_agi_3 = AttributeUtil:getUnitAttribute(whichHero)
        if ____AttributeUtil_getUnitAttribute_result__SL_BA_agi_3 ~= nil then
            ____AttributeUtil_getUnitAttribute_result__SL_BA_agi_3 = ____AttributeUtil_getUnitAttribute_result__SL_BA_agi_3._SL_BA_agi
        end
        local val = math.max(____oldGetHeroAgi_result_5, ____AttributeUtil_getUnitAttribute_result__SL_BA_agi_3 or 0)
        if includeBonuses then
            local exVal = UnitUtil.getExtraAgi(whichHero)
            if exVal > BaseAttributeMax then
                val = val + (exVal - BaseAttributeMax)
            end
        end
        return val
    end
    local oldGetHeroInt = GetHeroInt
    _G.GetHeroInt = function(whichHero, includeBonuses)
        local ____oldGetHeroInt_result_8 = oldGetHeroInt(whichHero, includeBonuses)
        local ____AttributeUtil_getUnitAttribute_result__SL_BA_int_6 = AttributeUtil:getUnitAttribute(whichHero)
        if ____AttributeUtil_getUnitAttribute_result__SL_BA_int_6 ~= nil then
            ____AttributeUtil_getUnitAttribute_result__SL_BA_int_6 = ____AttributeUtil_getUnitAttribute_result__SL_BA_int_6._SL_BA_int
        end
        local val = math.max(____oldGetHeroInt_result_8, ____AttributeUtil_getUnitAttribute_result__SL_BA_int_6 or 0)
        if includeBonuses then
            local exVal = UnitUtil.getExtraInt(whichHero)
            if exVal > BaseAttributeMax then
                val = val + (exVal - BaseAttributeMax)
            end
        end
        return val
    end
end
function BigAttributeCompatibleState.prototype.unitAttributeCompatible(self)
    local oldSetUnitState = SetUnitState
    _G.SetUnitState = function(whichUnit, whichUnitState, newVal)
        if whichUnitState == UnitStateDamageBase then
            oldSetUnitState(
                whichUnit,
                whichUnitState,
                math.min(newVal, BaseAttributeMax)
            )
            AttributeUtil:getUnitAttribute(whichUnit, true)._SL_BA_damage_base = newVal
        elseif whichUnitState == UnitStateArmor then
            oldSetUnitState(
                whichUnit,
                whichUnitState,
                math.min(newVal, BaseAttributeMax)
            )
            AttributeUtil:getUnitAttribute(whichUnit, true)._SL_BA_armor = newVal
        else
            oldSetUnitState(whichUnit, whichUnitState, newVal)
        end
    end
    local oldGetUnitState = GetUnitState
    _G.GetUnitState = function(whichUnit, whichUnitState)
        if whichUnitState == UnitStateDamageBase then
            local ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_9 = AttributeUtil:getUnitAttribute(whichUnit)
            if ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_9 ~= nil then
                ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_9 = ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_9._SL_BA_damage_base
            end
            local val = ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_9 or oldGetUnitState(whichUnit, whichUnitState)
            if HeroUtil:isHero(whichUnit) then
                local primaryValue = HeroUtil:getHeroPrimaryValue(whichUnit, false)
                val = val + primaryValue * PrimaryAttackBonus
            end
            return val
        elseif whichUnitState == UnitStateDamageBonus then
            local val = UnitUtil.getExtraAttack(whichUnit)
            if HeroUtil:isHero(whichUnit) then
                local primaryAndBonusValue = HeroUtil:getHeroPrimaryValue(whichUnit, true)
                local primaryValue = HeroUtil:getHeroPrimaryValue(whichUnit, false)
                local primaryBonusValue = primaryAndBonusValue - primaryValue
                val = val + primaryBonusValue * PrimaryAttackBonus
            end
            return val
        elseif whichUnitState == UnitStateArmor then
            local ____oldGetUnitState_result_13 = oldGetUnitState(whichUnit, whichUnitState)
            local ____AttributeUtil_getUnitAttribute_result__SL_BA_armor_11 = AttributeUtil:getUnitAttribute(whichUnit)
            if ____AttributeUtil_getUnitAttribute_result__SL_BA_armor_11 ~= nil then
                ____AttributeUtil_getUnitAttribute_result__SL_BA_armor_11 = ____AttributeUtil_getUnitAttribute_result__SL_BA_armor_11._SL_BA_armor
            end
            local val = math.max(____oldGetUnitState_result_13, ____AttributeUtil_getUnitAttribute_result__SL_BA_armor_11 or 0)
            local exVal = UnitUtil.getExtraDef(whichUnit)
            if exVal > BaseAttributeMax then
                val = val + (exVal - BaseAttributeMax)
            end
            if HeroUtil:isHero(whichUnit) and AgiDefenseBonus > 0 then
                local primaryAndBonusValue = GetHeroAgi(whichUnit, true)
                local primaryValue = GetHeroAgi(whichUnit, false)
                local primaryBonusValue = primaryAndBonusValue - primaryValue
                if primaryValue > BaseAttributeMax then
                    val = val + (primaryValue - BaseAttributeMax) * AgiDefenseBonus
                end
                if primaryBonusValue > BaseAttributeMax then
                    val = val + (primaryBonusValue - BaseAttributeMax) * AgiDefenseBonus
                end
            end
            return val
        elseif whichUnitState == UnitStateDamageMix or whichUnitState == UnitStateDamageMax then
            local ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_14 = AttributeUtil:getUnitAttribute(whichUnit)
            if ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_14 ~= nil then
                ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_14 = ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_14._SL_BA_damage_base
            end
            local val = ____AttributeUtil_getUnitAttribute_result__SL_BA_damage_base_14 or oldGetUnitState(whichUnit, whichUnitState)
            local extVal = UnitUtil.getExtraAttack(whichUnit)
            if extVal > BaseAttributeMax then
                val = val + (extVal - BaseAttributeMax)
            end
            if HeroUtil:isHero(whichUnit) then
                local primaryAndBonusValue = HeroUtil:getHeroPrimaryValue(whichUnit, true)
                local primaryValue = HeroUtil:getHeroPrimaryValue(whichUnit, false)
                local primaryBonusValue = primaryAndBonusValue - primaryValue
                if primaryValue > BaseAttributeMax then
                    val = val + (primaryValue - BaseAttributeMax) * PrimaryAttackBonus
                end
                if primaryBonusValue > BaseAttributeMax then
                    val = val + (primaryBonusValue - BaseAttributeMax) * PrimaryAttackBonus
                end
            end
            return val
        end
        return oldGetUnitState(whichUnit, whichUnitState)
    end
end
function BigAttributeCompatibleState.prototype.playerAttributeCompatible(self)
    local oldSetPlayerState = SetPlayerState
    _G.SetPlayerState = function(whichPlayer, whichPlayerState, value)
        local temp = math.min(value, 1000000)
        oldSetPlayerState(whichPlayer, whichPlayerState, temp)
        if whichPlayerState == PLAYER_STATE_RESOURCE_GOLD then
            DzFrameSetText(
                NativeFrameUtil:getGoldText(),
                TextUtil:toCnUnit(value)
            )
            AttributeUtil:getPlayerAttribute(whichPlayer, true)._SL_BA_gold = value
            AttributeUtil:getPlayerAttribute(whichPlayer, true)._SL_BA_gold_temp = temp
        elseif whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER then
            DzFrameSetText(
                NativeFrameUtil:getLumberText(),
                TextUtil:toCnUnit(value)
            )
            AttributeUtil:getPlayerAttribute(whichPlayer, true)._SL_BA_lumber = value
            AttributeUtil:getPlayerAttribute(whichPlayer, true)._SL_BA_lumber_temp = temp
        end
    end
    local oldGetPlayerState = GetPlayerState
    _G.GetPlayerState = function(whichPlayer, whichPlayerState)
        if whichPlayerState == PLAYER_STATE_RESOURCE_GOLD then
            local ____AttributeUtil_getPlayerAttribute_result__SL_BA_gold_16 = AttributeUtil:getPlayerAttribute(whichPlayer)
            if ____AttributeUtil_getPlayerAttribute_result__SL_BA_gold_16 ~= nil then
                ____AttributeUtil_getPlayerAttribute_result__SL_BA_gold_16 = ____AttributeUtil_getPlayerAttribute_result__SL_BA_gold_16._SL_BA_gold
            end
            return ____AttributeUtil_getPlayerAttribute_result__SL_BA_gold_16 or oldGetPlayerState(whichPlayer, whichPlayerState)
        elseif whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER then
            local ____AttributeUtil_getPlayerAttribute_result__SL_BA_lumber_18 = AttributeUtil:getPlayerAttribute(whichPlayer)
            if ____AttributeUtil_getPlayerAttribute_result__SL_BA_lumber_18 ~= nil then
                ____AttributeUtil_getPlayerAttribute_result__SL_BA_lumber_18 = ____AttributeUtil_getPlayerAttribute_result__SL_BA_lumber_18._SL_BA_lumber
            end
            return ____AttributeUtil_getPlayerAttribute_result__SL_BA_lumber_18 or oldGetPlayerState(whichPlayer, whichPlayerState)
        end
        return oldGetPlayerState(whichPlayer, whichPlayerState)
    end
    local goldTrigger = CreateTrigger()
    local lumberTrigger = CreateTrigger()
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerStateEvent(
                goldTrigger,
                Player(i),
                PLAYER_STATE_RESOURCE_GOLD,
                NOT_EQUAL,
                -1
            )
            TriggerRegisterPlayerStateEvent(
                lumberTrigger,
                Player(i),
                PLAYER_STATE_RESOURCE_LUMBER,
                NOT_EQUAL,
                -1
            )
            i = i + 1
        end
    end
    TriggerAddAction(
        goldTrigger,
        function()
            local player = GetTriggerPlayer()
            local playerAttribute = AttributeUtil:getPlayerAttribute(player, true)
            local nowTempGold = oldGetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD)
            if not playerAttribute._SL_BA_gold or not playerAttribute._SL_BA_gold_temp then
                playerAttribute._SL_BA_gold_temp = nowTempGold
                return
            end
            local add = nowTempGold - playerAttribute._SL_BA_gold_temp
            playerAttribute._SL_BA_gold = playerAttribute._SL_BA_gold + add
            DisableTrigger(GetTriggeringTrigger())
            SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, playerAttribute._SL_BA_gold)
            EnableTrigger(GetTriggeringTrigger())
        end
    )
    TriggerAddAction(
        lumberTrigger,
        function()
            local player = GetTriggerPlayer()
            local playerAttribute = AttributeUtil:getPlayerAttribute(player, true)
            local nowTempGold = oldGetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER)
            if not playerAttribute._SL_BA_lumber or not playerAttribute._SL_BA_lumber_temp then
                playerAttribute._SL_BA_lumber_temp = nowTempGold
                return
            end
            local add = nowTempGold - playerAttribute._SL_BA_lumber_temp
            playerAttribute._SL_BA_lumber = playerAttribute._SL_BA_lumber + add
            DisableTrigger(GetTriggeringTrigger())
            SetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER, playerAttribute._SL_BA_lumber)
            EnableTrigger(GetTriggeringTrigger())
        end
    )
end
____exports.default = BigAttributeCompatibleState
return ____exports
