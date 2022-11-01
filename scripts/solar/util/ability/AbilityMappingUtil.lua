local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 10,["10"] = 10,["11"] = 10,["13"] = 10,["14"] = 25,["15"] = 27,["16"] = 29,["17"] = 30,["18"] = 31,["19"] = 32,["21"] = 34,["22"] = 25,["23"] = 43,["24"] = 44,["25"] = 45,["26"] = 46,["27"] = 47,["29"] = 43,["30"] = 56,["31"] = 57,["32"] = 58,["33"] = 59,["34"] = 60,["36"] = 56,["37"] = 68,["38"] = 69,["39"] = 68,["40"] = 75,["41"] = 76,["44"] = 80,["45"] = 81,["46"] = 82,["47"] = 84,["48"] = 85,["49"] = 85,["50"] = 85,["52"] = 85,["53"] = 86,["54"] = 88,["56"] = 91,["57"] = 81,["58"] = 94,["59"] = 95,["60"] = 98,["61"] = 99,["62"] = 100,["64"] = 103,["65"] = 104,["66"] = 105,["67"] = 107,["70"] = 111,["71"] = 112,["72"] = 95,["73"] = 116,["74"] = 75,["75"] = 16,["76"] = 73,["77"] = 10});
local ____exports = {}
local ____LangUtil = require("solar.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
local CJ = require("jass.common")
____exports.default = __TS__Class()
local AbilityMappingUtil = ____exports.default
AbilityMappingUtil.name = "AbilityMappingUtil"
function AbilityMappingUtil.prototype.____constructor(self)
end
function AbilityMappingUtil.mapping(self, unit, templateId, targetId)
    ____exports.default:_sl_init_mapping_system()
    local unitHandleId = GetHandleId(unit)
    local mappingDatum = ____exports.default.abilityMappingData[unitHandleId]
    if not mappingDatum then
        ____exports.default.abilityMappingData[unitHandleId] = {}
    end
    mappingDatum[FourCC(templateId)] = FourCC(targetId)
end
function AbilityMappingUtil.removeMappings(self, unit)
    local unitHandleId = GetHandleId(unit)
    local mappingDatum = ____exports.default.abilityMappingData[unitHandleId]
    if mappingDatum then
        ____exports.default.abilityMappingData[unitHandleId] = nil
    end
end
function AbilityMappingUtil.removeMapping(self, unit, templateId)
    local unitHandleId = GetHandleId(unit)
    local mappingDatum = ____exports.default.abilityMappingData[unitHandleId]
    if mappingDatum then
        mappingDatum[FourCC(templateId)] = nil
    end
end
function AbilityMappingUtil.getRealSpellAbilityId(self)
    return CJ.GetSpellAbilityId()
end
function AbilityMappingUtil._sl_init_mapping_system(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    local oldGetSpellAbilityId = GetSpellAbilityId
    _G.GetSpellAbilityId = function()
        local cjRealId = oldGetSpellAbilityId()
        local unitHandleId = GetHandleId(GetTriggerUnit())
        local ____AbilityMappingUtil_abilityMappingData_unitHandleId_cjRealId_0 = ____exports.default.abilityMappingData[unitHandleId]
        if ____AbilityMappingUtil_abilityMappingData_unitHandleId_cjRealId_0 ~= nil then
            ____AbilityMappingUtil_abilityMappingData_unitHandleId_cjRealId_0 = ____AbilityMappingUtil_abilityMappingData_unitHandleId_cjRealId_0[cjRealId]
        end
        local targetId = ____AbilityMappingUtil_abilityMappingData_unitHandleId_cjRealId_0
        if targetId then
            return targetId
        end
        return cjRealId
    end
    local oldGetUnitAbilityLevel = GetUnitAbilityLevel
    _G.GetUnitAbilityLevel = function(whichUnit, abilcode)
        local unitHandleId = GetHandleId(whichUnit)
        if LangUtil:isString(abilcode) then
            abilcode = FourCC(abilcode)
        end
        local mappingDatum = ____exports.default.abilityMappingData[unitHandleId]
        for templateIdNum in pairs(mappingDatum) do
            if mappingDatum[templateIdNum] == abilcode then
                return oldGetUnitAbilityLevel(whichUnit, templateIdNum)
            end
        end
        local cjRealLv = oldGetUnitAbilityLevel(whichUnit, abilcode)
        return cjRealLv
    end
    ____exports.default._sl_isInitialized = true
end
AbilityMappingUtil.abilityMappingData = {}
AbilityMappingUtil._sl_isInitialized = false
____exports.default = AbilityMappingUtil
return ____exports
