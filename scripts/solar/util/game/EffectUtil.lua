local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 7,["12"] = 9,["13"] = 10,["15"] = 12,["17"] = 7,["18"] = 19,["19"] = 20,["20"] = 19,["21"] = 26,["22"] = 27,["23"] = 28,["25"] = 30,["27"] = 26,["28"] = 37,["29"] = 38,["30"] = 37,["31"] = 1});
local ____exports = {}
____exports.default = __TS__Class()
local EffectUtil = ____exports.default
EffectUtil.name = "EffectUtil"
function EffectUtil.prototype.____constructor(self)
end
function EffectUtil.addSpecialEffect(self, modelName, x, y)
    if settings.isEffectDisplay == false then
        return AddSpecialEffect("", x, y)
    else
        return AddSpecialEffect(modelName, x, y)
    end
end
function EffectUtil.addSpecialEffectAndDestroy(self, modelName, x, y)
    DestroyEffect(____exports.default:addSpecialEffect(modelName, x, y))
end
function EffectUtil.addSpecialEffectTarget(self, modelName, targetWidget, attachPointName)
    if settings.isEffectDisplay == false then
        return AddSpecialEffectTarget("", targetWidget, attachPointName)
    else
        return AddSpecialEffectTarget(modelName, targetWidget, attachPointName)
    end
end
function EffectUtil.addSpecialEffectTargetAndDestroy(self, modelName, targetWidget, attachPointName)
    DestroyEffect(____exports.default:addSpecialEffectTarget(modelName, targetWidget, attachPointName))
end
____exports.default = EffectUtil
return ____exports
