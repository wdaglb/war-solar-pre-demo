local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 6,["11"] = 6,["12"] = 6,["14"] = 6,["15"] = 11,["16"] = 12,["19"] = 15,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 20,["26"] = 22,["28"] = 24,["29"] = 11,["30"] = 30,["31"] = 31,["34"] = 34,["35"] = 35,["36"] = 36,["37"] = 37,["38"] = 38,["39"] = 39,["41"] = 41,["43"] = 43,["44"] = 30,["45"] = 54,["46"] = 54,["47"] = 54,["49"] = 55,["50"] = 56,["52"] = 58,["53"] = 58,["54"] = 58,["55"] = 58,["56"] = 58,["57"] = 58,["58"] = 59,["59"] = 59,["60"] = 59,["61"] = 59,["62"] = 59,["63"] = 59,["64"] = 60,["65"] = 61,["66"] = 62,["68"] = 54,["69"] = 74,["70"] = 74,["71"] = 74,["73"] = 75,["74"] = 76,["76"] = 78,["77"] = 78,["78"] = 78,["79"] = 78,["80"] = 78,["81"] = 78,["82"] = 79,["83"] = 80,["84"] = 81,["86"] = 74,["87"] = 93,["88"] = 93,["89"] = 93,["91"] = 94,["92"] = 95,["94"] = 97,["95"] = 97,["96"] = 97,["97"] = 97,["98"] = 97,["99"] = 97,["100"] = 98,["101"] = 99,["102"] = 100,["104"] = 93,["105"] = 111,["106"] = 111,["107"] = 111,["109"] = 112,["110"] = 112,["111"] = 112,["112"] = 112,["113"] = 112,["114"] = 112,["115"] = 113,["116"] = 114,["117"] = 115,["119"] = 111,["120"] = 131,["121"] = 131,["122"] = 131,["124"] = 132,["125"] = 131,["126"] = 142,["127"] = 142,["128"] = 142,["130"] = 143,["131"] = 144,["133"] = 146,["134"] = 146,["135"] = 146,["136"] = 146,["137"] = 146,["138"] = 146,["139"] = 147,["140"] = 148,["141"] = 149,["143"] = 142,["144"] = 167,["145"] = 167,["146"] = 167,["148"] = 168,["149"] = 169,["151"] = 171,["152"] = 172,["153"] = 167,["154"] = 182,["155"] = 182,["156"] = 182,["158"] = 183,["159"] = 183,["160"] = 183,["161"] = 183,["162"] = 183,["163"] = 183,["164"] = 184,["165"] = 185,["166"] = 186,["168"] = 182,["169"] = 197,["170"] = 197,["171"] = 197,["173"] = 198,["174"] = 199,["176"] = 201,["177"] = 201,["178"] = 201,["179"] = 201,["180"] = 201,["181"] = 201,["182"] = 202,["183"] = 203,["184"] = 204,["186"] = 197,["187"] = 216,["188"] = 216,["189"] = 216,["191"] = 217,["192"] = 218,["194"] = 220,["195"] = 221,["196"] = 221,["197"] = 221,["198"] = 221,["199"] = 221,["200"] = 221,["201"] = 222,["202"] = 223,["203"] = 224,["205"] = 216,["206"] = 236,["207"] = 236,["208"] = 236,["210"] = 237,["211"] = 238,["213"] = 240,["214"] = 241,["216"] = 243,["217"] = 243,["218"] = 243,["219"] = 243,["220"] = 243,["221"] = 243,["222"] = 244,["223"] = 245,["224"] = 246,["226"] = 236,["227"] = 258,["228"] = 258,["229"] = 258,["231"] = 259,["232"] = 260,["234"] = 262,["235"] = 262,["236"] = 262,["237"] = 262,["238"] = 262,["239"] = 262,["240"] = 263,["241"] = 264,["242"] = 265,["244"] = 258,["245"] = 277,["246"] = 277,["247"] = 277,["249"] = 278,["250"] = 279,["252"] = 281,["253"] = 281,["254"] = 281,["255"] = 281,["256"] = 281,["257"] = 281,["258"] = 282,["259"] = 283,["260"] = 284,["262"] = 277,["263"] = 296,["264"] = 296,["265"] = 296,["267"] = 297,["268"] = 298,["270"] = 300,["271"] = 300,["272"] = 300,["273"] = 300,["274"] = 300,["275"] = 300,["276"] = 301,["277"] = 302,["278"] = 303,["280"] = 296,["281"] = 315,["282"] = 316,["283"] = 317,["285"] = 320,["286"] = 321,["287"] = 322,["289"] = 325,["290"] = 326,["291"] = 327,["293"] = 330,["294"] = 331,["295"] = 332,["297"] = 335,["298"] = 337,["299"] = 338,["300"] = 339,["302"] = 342,["303"] = 343,["304"] = 344,["307"] = 347,["308"] = 315,["309"] = 6});
local ____exports = {}
local ____TargetType = require("solar.constant.TargetType")
local TargetType = ____TargetType.default
local OptionType = ____TargetType.OptionType
____exports.default = __TS__Class()
local AbilityUtil = ____exports.default
AbilityUtil.name = "AbilityUtil"
function AbilityUtil.prototype.____constructor(self)
end
function AbilityUtil.targets2Num(self, str)
    if not str then
        return
    end
    local result = 0
    local data = __TS__StringSplit(str, ",")
    for ____, name in ipairs(data) do
        local flag = TargetType[name]
        if not flag then
            print("错误的目标允许类型: " .. name)
        end
        result = result + flag
    end
    return result
end
function AbilityUtil.option2Num(self, str)
    if not str then
        return
    end
    local result = 0
    local data = __TS__StringSplit(str, ",")
    for ____, name in ipairs(data) do
        local flag = OptionType[name]
        if not flag then
            print("错误的图标选项类型: " .. name)
        end
        result = result + flag
    end
    return result
end
function AbilityUtil.setUnitAbilityName(self, udw, abilityId, name, isref)
    if isref == nil then
        isref = false
    end
    if not name then
        print("不存在技能名字")
    end
    EXSetAbilityDataString(
        EXGetUnitAbility(udw, abilityId),
        1,
        ABILITY_DATA_NAME,
        name
    )
    EXSetAbilityDataString(
        EXGetUnitAbility(udw, abilityId),
        1,
        ABILITY_DATA_TIP,
        name
    )
    if isref then
        IncUnitAbilityLevel(udw, abilityId)
        DecUnitAbilityLevel(udw, abilityId)
    end
end
function AbilityUtil.setUnitAbilityArt(self, udw, abilityId, art, isref)
    if isref == nil then
        isref = false
    end
    if not art then
        print("不存在技能图标路径")
    end
    EXSetAbilityDataString(
        EXGetUnitAbility(udw, abilityId),
        1,
        ABILITY_DATA_ART,
        art
    )
    if isref then
        IncUnitAbilityLevel(udw, abilityId)
        DecUnitAbilityLevel(udw, abilityId)
    end
end
function AbilityUtil.setUnitAbilityUbertip(self, udw, skid, Ubertip, isref)
    if isref == nil then
        isref = false
    end
    if not Ubertip then
        print("不存在技能提示拓展")
    end
    EXSetAbilityDataString(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_UBERTIP,
        Ubertip
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitAbilityDataA(self, udw, skid, data, isref)
    if isref == nil then
        isref = false
    end
    EXSetAbilityDataReal(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_DATA_A,
        data
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitANclAbilityTarget(self, udw, skid, target_type, isref)
    if isref == nil then
        isref = false
    end
    ____exports.default:setUnitAbilityDataB(udw, skid, target_type, isref)
end
function AbilityUtil.setUnitAbilityDataB(self, udw, skid, DataB, isref)
    if isref == nil then
        isref = false
    end
    if not DataB then
        print("不存在技能图标路径")
    end
    EXSetAbilityDataReal(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_DATA_B,
        DataB
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitANclAbilityOption(self, udw, skid, options, isref)
    if isref == nil then
        isref = false
    end
    if not options then
        print("不存在技能选项")
    end
    local data = ____exports.default:option2Num(options)
    ____exports.default:setUnitAbilityDataC(udw, skid, data, isref)
end
function AbilityUtil.setUnitAbilityDataC(self, udw, skid, data, isref)
    if isref == nil then
        isref = false
    end
    EXSetAbilityDataReal(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_DATA_C,
        data
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitAbilityDataD(self, udw, skid, data, isref)
    if isref == nil then
        isref = false
    end
    if not data then
        print("不存在技能选项")
    end
    EXSetAbilityDataReal(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_DATA_D,
        data
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitAbilityTargs(self, udw, skid, Targs, isref)
    if isref == nil then
        isref = false
    end
    if not Targs then
        print("不存在技能目标允许")
    end
    local data = ____exports.default:targets2Num(Targs)
    EXSetAbilityDataInteger(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_TARGS,
        R2I(data)
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitAbilityCool(self, udw, skid, Cool, isref)
    if isref == nil then
        isref = false
    end
    if type(skid) == "string" then
        skid = FourCC(skid)
    end
    if not Cool then
        print("不存在技能释放间隔")
    end
    EXSetAbilityDataReal(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_COOL,
        Cool
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitAbilityCost(self, udw, skid, Cost, isref)
    if isref == nil then
        isref = false
    end
    if not Cost then
        print("不存在技能魔法消耗")
    end
    EXSetAbilityDataInteger(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_CAST,
        Cost
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitAbilityRng(self, udw, skid, Rng, isref)
    if isref == nil then
        isref = false
    end
    if not Rng then
        print("不存在技能施法距离")
    end
    EXSetAbilityDataReal(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_RNG,
        Rng
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.setUnitAbilityArea(self, udw, skid, Area, isref)
    if isref == nil then
        isref = false
    end
    if not Area then
        print("不存在技能影响区域")
    end
    EXSetAbilityDataReal(
        EXGetUnitAbility(udw, skid),
        1,
        ABILITY_DATA_AREA,
        Area
    )
    if isref then
        IncUnitAbilityLevel(udw, skid)
        DecUnitAbilityLevel(udw, skid)
    end
end
function AbilityUtil.getSpellXY(self, attype, store)
    if not store then
        store = {}
    end
    if attype == 0 then
        store.x = GetUnitX(GetTriggerUnit())
        store.y = GetUnitY(GetTriggerUnit())
    end
    if attype == 1 then
        store.x = GetUnitX(GetSpellTargetUnit())
        store.y = GetUnitY(GetSpellTargetUnit())
    end
    if attype == 2 then
        store.x = GetSpellTargetX()
        store.y = GetSpellTargetY()
    end
    if attype == 2 then
        if GetSpellTargetX() ~= 0 and GetSpellTargetY() ~= 0 then
            store.x = GetSpellTargetX()
            store.y = GetSpellTargetY()
        end
        if GetUnitX(GetSpellTargetUnit()) ~= 0 and GetUnitY(GetSpellTargetUnit()) ~= 0 then
            store.x = GetUnitX(GetSpellTargetUnit())
            store.y = GetUnitY(GetSpellTargetUnit())
        end
    end
    return store
end
____exports.default = AbilityUtil
return ____exports
