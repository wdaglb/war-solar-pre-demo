local ____lualib = require("lualib_bundle")
local __TS__SparseArrayNew = ____lualib.__TS__SparseArrayNew
local __TS__SparseArrayPush = ____lualib.__TS__SparseArrayPush
local __TS__SparseArraySpread = ____lualib.__TS__SparseArraySpread
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 8,["19"] = 9,["21"] = 7,["22"] = 13,["23"] = 18});
local ____exports = {}
local ____hero = require("data.units.hero")
local heros = ____hero.heros
local ____unit = require("data.units.unit")
local units = ____unit.units
local ____hero = require("data.ability.hero")
local heroAbility = ____hero.heroAbility
local ____item = require("data.lib.item.index")
local itemData = ____item.itemData
local ____array_0 = __TS__SparseArrayNew(table.unpack(heros))
__TS__SparseArrayPush(
    ____array_0,
    table.unpack(units)
)
____exports.global_units = {__TS__SparseArraySpread(____array_0)}
____exports.global_ability = {table.unpack(heroAbility)}
____exports.global_items = {table.unpack(itemData)}
return ____exports
