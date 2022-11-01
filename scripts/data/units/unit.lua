local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 8,["7"] = 11,["8"] = 13,["9"] = 15,["10"] = 17,["11"] = 20,["12"] = 21,["13"] = 22,["14"] = 23,["16"] = 25,["19"] = 27,["20"] = 27,["21"] = 27,["22"] = 27,["23"] = 27,["24"] = 27,["25"] = 27,["26"] = 27,["27"] = 27,["28"] = 36,["29"] = 20,["30"] = 39,["31"] = 45,["32"] = 45,["33"] = 45,["34"] = 46,["35"] = 45,["36"] = 45});
local ____exports = {}
____exports.units = {}
local lv = 1
local baseAttack = 100
local baseDef = 10
local baseHp = 1000
local function createUnit(____, params)
    local lvStr = ""
    if lv < 10 then
        lvStr = "0" .. tostring(lv)
    else
        lvStr = tostring(lv) .. ""
    end
    local ____exports_units_0 = ____exports.units
    ____exports_units_0[#____exports_units_0 + 1] = {
        id = "u0" .. lvStr,
        _parent = "ogru",
        Name = "进攻怪lv" .. tostring(lv),
        file = params.model,
        dmgplus1 = tostring(baseAttack * lv) .. "",
        def = tostring(baseDef * lv) .. "",
        HP = tostring(baseHp * lv) .. ""
    }
    lv = lv + 1
end
local models = {"units\\orc\\Grunt\\Grunt", "units\\orc\\WolfRider\\WolfRider", "units\\orc\\Tauren\\Tauren", "units\\orc\\HeadHunter\\HeadHunter"}
__TS__ArrayForEach(
    models,
    function(____, model)
        createUnit(nil, {model = model})
    end
)
return ____exports
