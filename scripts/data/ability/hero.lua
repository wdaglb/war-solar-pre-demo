local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 9,["9"] = 12,["10"] = 15,["11"] = 16,["12"] = 17,["13"] = 18,["14"] = 19,["16"] = 20,["17"] = 15,["18"] = 25,["19"] = 25,["20"] = 25,["21"] = 25,["22"] = 25,["23"] = 25,["24"] = 25,["25"] = 25,["26"] = 25,["27"] = 25,["28"] = 25});
local ____exports = {}
____exports.heroAbility = {}
____exports.heroAbilityData = __TS__New(Map)
local function createHeroAbility(____, params)
    params.Tip = ((params.Name .. "(") .. params.Hotkey) .. ")"
    params.Researchhotkey = params.Hotkey
    params.Researchtip = ((("学习" .. params.Name) .. "(") .. params.Hotkey) .. ")"
    ____exports.heroAbilityData:set(params.id, params)
    local ____exports_heroAbility_0 = ____exports.heroAbility
    ____exports_heroAbility_0[#____exports_heroAbility_0 + 1] = __TS__ObjectAssign({}, params)
end
createHeroAbility(nil, {
    id = "a001",
    _parent = "AHtb",
    Name = "锤子",
    Hotkey = "Q",
    levels = "1",
    Cost = "1",
    Cool = "2",
    Rng = "1000",
    hit = "100"
})
return ____exports
