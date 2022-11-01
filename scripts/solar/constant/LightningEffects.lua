local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 18});
local ____exports = {}
local LightningEffects = LightningEffects or ({})
LightningEffects.CHAIN_LIGHTNING_PRIMARY = "CLPB"
LightningEffects.CHAIN_LIGHTNING_SECONDARY = "CLSB"
LightningEffects.DRAIN = "DRAB"
LightningEffects.DRAIN_LIFE = "DRAL"
LightningEffects.DRAIN_MANA = "DRAM"
LightningEffects.FINGER_OF_DEATH = "AFOD"
LightningEffects.FORKED_LIGHTNING = "FORK"
LightningEffects.HEALING_WAVE_PRIMARY = "HWPB"
LightningEffects.HEALING_WAVE_SECONDARY = "HWSB"
LightningEffects.LIGHTNING_ATTACK = "CHIM"
LightningEffects.MAGIC_LEASH = "LEAS"
LightningEffects.MANA_BURN = "MBUR"
LightningEffects.MANA_FLARE = "MFPB"
LightningEffects.SPIRIT_LINK = "SPLK"
____exports.default = LightningEffects
return ____exports
