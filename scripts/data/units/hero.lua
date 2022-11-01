local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 26,["11"] = 29,["12"] = 30,["13"] = 30,["14"] = 30,["15"] = 30,["16"] = 30,["17"] = 35,["18"] = 37,["19"] = 38,["20"] = 39,["21"] = 39,["22"] = 39,["23"] = 40,["24"] = 41,["25"] = 42,["27"] = 39,["28"] = 39,["30"] = 46,["31"] = 46,["32"] = 46,["33"] = 46,["34"] = 46,["35"] = 46,["36"] = 46,["37"] = 46,["38"] = 46,["39"] = 46,["40"] = 46,["41"] = 29,["42"] = 60,["43"] = 61,["44"] = 61,["45"] = 61,["46"] = 61,["47"] = 61,["48"] = 61,["49"] = 61,["50"] = 61,["51"] = 61,["52"] = 61,["53"] = 60,["54"] = 72,["55"] = 72,["56"] = 72,["57"] = 72,["58"] = 72,["59"] = 72,["60"] = 72,["61"] = 72,["62"] = 72,["63"] = 72,["64"] = 60,["65"] = 83,["66"] = 83,["67"] = 83,["68"] = 83,["69"] = 83,["70"] = 83,["71"] = 83,["72"] = 83,["73"] = 83,["74"] = 83,["75"] = 60,["76"] = 60});
local ____exports = {}
local ____hero = require("data.ability.hero")
local heroAbilityData = ____hero.heroAbilityData
____exports.heroData = __TS__New(Map)
local function createHero(____, params)
    local description = {
        "攻击力：" .. tostring(params.attack),
        "防御力：" .. tostring(params.def),
        "生命值：" .. tostring(params.hp)
    }
    ____exports.heroData:set(params.id, params)
    if #params.abilityData > 0 then
        description[#description + 1] = "*******技能*******"
        __TS__ArrayForEach(
            params.abilityData,
            function(____, abiId)
                local data = heroAbilityData:get(abiId)
                if data ~= nil then
                    description[#description + 1] = (((data.Name .. ",冷却：") .. data.Cool) .. "s,蓝耗：") .. data.Cost
                end
            end
        )
    end
    return {
        id = params.id,
        _parent = "Hmkg",
        Name = params.name,
        file = params.model,
        dmgplus1 = tostring(params.attack) .. "",
        def = tostring(params.def) .. "",
        HP = tostring(params.hp) .. "",
        Ubertip = table.concat(description, "|n"),
        heroAbilList = table.concat(params.abilityData, ",")
    }
end
____exports.heros = {
    createHero(nil, {
        id = "H001",
        name = "山丘1",
        model = "units\\human\\Footman\\Footman",
        attack = 100,
        def = 10,
        hp = 1000,
        hit = 10,
        damageAdd = 100,
        abilityData = {"a001"}
    }),
    createHero(nil, {
        id = "H002",
        name = "山丘2",
        model = "units\\human\\Footman\\Footman",
        attack = 200,
        def = 20,
        hp = 2000,
        hit = 20,
        damageAdd = 200,
        abilityData = {}
    }),
    createHero(nil, {
        id = "H003",
        name = "山丘3",
        model = "units\\human\\Footman\\Footman",
        attack = 300,
        def = 30,
        hp = 3000,
        hit = 30,
        damageAdd = 300,
        abilityData = {}
    })
}
return ____exports
