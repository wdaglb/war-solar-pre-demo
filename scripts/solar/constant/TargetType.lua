local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 4,["17"] = 4,["18"] = 4,["19"] = 4,["20"] = 4,["21"] = 4,["22"] = 4,["23"] = 4,["24"] = 4,["25"] = 4,["26"] = 4,["27"] = 4,["28"] = 4,["29"] = 4,["30"] = 4,["31"] = 4,["32"] = 4,["33"] = 4,["34"] = 4,["35"] = 4,["36"] = 4,["37"] = 4,["38"] = 4,["39"] = 4,["40"] = 4,["41"] = 4,["42"] = 4,["43"] = 4,["44"] = 4,["45"] = 4,["46"] = 4,["47"] = 4,["48"] = 4,["49"] = 4,["50"] = 4,["51"] = 4,["52"] = 4,["53"] = 4,["54"] = 4,["55"] = 4,["56"] = 4,["57"] = 4,["58"] = 4,["59"] = 4,["60"] = 4,["61"] = 4,["62"] = 4,["63"] = 4,["64"] = 4,["65"] = 4,["66"] = 4,["67"] = 4,["68"] = 4,["69"] = 41,["71"] = 44,["73"] = 46,["75"] = 48,["77"] = 50,["79"] = 55,["80"] = 56,["81"] = 56,["82"] = 57,["83"] = 57,["84"] = 58,["85"] = 58,["86"] = 59,["87"] = 59,["88"] = 60,["89"] = 60});
local ____exports = {}
--- 转换目标允许
local TargetType = TargetType or ({})
TargetType.ground = 2
TargetType[TargetType.ground] = "ground"
TargetType.air = 4
TargetType[TargetType.air] = "air"
TargetType.structure = 8
TargetType[TargetType.structure] = "structure"
TargetType.ward = 16
TargetType[TargetType.ward] = "ward"
TargetType.item = 32
TargetType[TargetType.item] = "item"
TargetType.tree = 64
TargetType[TargetType.tree] = "tree"
TargetType.wall = 128
TargetType[TargetType.wall] = "wall"
TargetType.debris = 256
TargetType[TargetType.debris] = "debris"
TargetType.decoration = 512
TargetType[TargetType.decoration] = "decoration"
TargetType.bridge = 1024
TargetType[TargetType.bridge] = "bridge"
TargetType.self = 4096
TargetType[TargetType.self] = "self"
TargetType.player = 8192
TargetType[TargetType.player] = "player"
TargetType.allies = 16384
TargetType[TargetType.allies] = "allies"
TargetType.neutral = 32768
TargetType[TargetType.neutral] = "neutral"
TargetType.enemies = 65536
TargetType[TargetType.enemies] = "enemies"
TargetType.vulnerable = 1048576
TargetType[TargetType.vulnerable] = "vulnerable"
TargetType.invulnerable = 2097152
TargetType[TargetType.invulnerable] = "invulnerable"
TargetType.hero = 4194304
TargetType[TargetType.hero] = "hero"
TargetType.nonhero = 8388608
TargetType[TargetType.nonhero] = "nonhero"
TargetType.alive = 16777216
TargetType[TargetType.alive] = "alive"
TargetType.dead = 33554432
TargetType[TargetType.dead] = "dead"
TargetType.organic = 67108864
TargetType[TargetType.organic] = "organic"
TargetType.mechanical = 134217728
TargetType[TargetType.mechanical] = "mechanical"
TargetType.nonsapper = 268435456
TargetType[TargetType.nonsapper] = "nonsapper"
TargetType.sapper = 536870912
TargetType[TargetType.sapper] = "sapper"
TargetType.nonancient = 1073741824
TargetType[TargetType.nonancient] = "nonancient"
TargetType.ancient = 2147483648
TargetType[TargetType.ancient] = "ancient"
TargetType.notself = 2048
TargetType[TargetType.notself] = "notself"
TargetType.terrain = 131072
TargetType[TargetType.terrain] = "terrain"
TargetType.none = 262144
TargetType[TargetType.none] = "none"
TargetType.friend = 524288
TargetType[TargetType.friend] = "friend"
____exports.default = TargetType
--- 无目标
____exports.TARGET_TYPE_NONE = 0
--- 单位目标
____exports.TARGET_TYPE_UNIT = 1
--- 点目标
____exports.TARGET_TYPE_POINT = 2
--- 单位或点
____exports.TARGET_TYPE_UNIT_OR_POINT = 3
--- 图标选项
____exports.OptionType = OptionType or ({})
____exports.OptionType.visible = 1
____exports.OptionType[____exports.OptionType.visible] = "visible"
____exports.OptionType.targimage = 2
____exports.OptionType[____exports.OptionType.targimage] = "targimage"
____exports.OptionType.physical = 4
____exports.OptionType[____exports.OptionType.physical] = "physical"
____exports.OptionType.universal = 8
____exports.OptionType[____exports.OptionType.universal] = "universal"
____exports.OptionType.unique = 16
____exports.OptionType[____exports.OptionType.unique] = "unique"
return ____exports
