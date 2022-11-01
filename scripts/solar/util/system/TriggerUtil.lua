local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 19,["12"] = 20,["15"] = 23,["16"] = 24,["17"] = 25,["18"] = 26,["19"] = 27,["20"] = 28,["21"] = 30,["22"] = 30,["23"] = 30,["24"] = 30,["25"] = 30,["26"] = 30,["29"] = 33,["30"] = 34,["31"] = 19,["32"] = 38,["33"] = 39,["34"] = 41,["35"] = 42,["36"] = 43,["38"] = 45,["40"] = 38,["41"] = 50,["42"] = 51,["43"] = 51,["44"] = 51,["45"] = 51,["46"] = 52,["47"] = 52,["48"] = 52,["49"] = 52,["50"] = 52,["52"] = 54,["53"] = 50,["54"] = 58,["55"] = 59,["56"] = 60,["57"] = 61,["58"] = 62,["59"] = 62,["60"] = 62,["61"] = 62,["62"] = 62,["63"] = 63,["65"] = 65,["66"] = 58,["67"] = 68,["68"] = 69,["69"] = 70,["70"] = 71,["71"] = 72,["72"] = 73,["73"] = 73,["74"] = 73,["75"] = 73,["76"] = 73,["77"] = 74,["78"] = 68,["79"] = 78,["80"] = 79,["81"] = 81,["82"] = 82,["83"] = 83,["85"] = 85,["86"] = 86,["87"] = 87,["88"] = 88,["90"] = 91,["91"] = 92,["92"] = 78,["93"] = 4,["94"] = 6,["95"] = 7,["96"] = 8,["97"] = 10,["98"] = 11,["99"] = 2});
local ____exports = {}
____exports.default = __TS__Class()
local TriggerUtil = ____exports.default
TriggerUtil.name = "TriggerUtil"
function TriggerUtil.prototype.____constructor(self)
end
function TriggerUtil.SystemAnyUnitDamagedRegistTrigger(trg)
    if trg == nil then
        return
    end
    if ____exports.default.DamageEventNumber == 0 then
        ____exports.default.DamageEventTrigger = CreateTrigger()
        TriggerAddAction(____exports.default.DamageEventTrigger, ____exports.default.AnyUnitDamagedTriggerAction)
        ____exports.default.AnyUnitDamagedEnumUnit()
        ____exports.default.AnyUnitDamagedRegistTriggerUnitEnter()
        if ____exports.default.DAMAGE_EVENT_SWAP_ENABLE then
            TimerStart(
                CreateTimer(),
                ____exports.default.DAMAGE_EVENT_SWAP_TIMEOUT,
                true,
                ____exports.default.SyStemAnyUnitDamagedSwap
            )
        end
    end
    ____exports.default.DamageEventQueue[____exports.default.DamageEventNumber + 1] = trg
    ____exports.default.DamageEventNumber = ____exports.default.DamageEventNumber + 1
end
function TriggerUtil.AnyUnitDamagedTriggerAction()
    local i = 0
    while i < ____exports.default.DamageEventNumber do
        if ____exports.default.DamageEventQueue[i + 1] ~= nil and IsTriggerEnabled(____exports.default.DamageEventQueue[i + 1]) and TriggerEvaluate(____exports.default.DamageEventQueue[i + 1]) then
            TriggerExecute(____exports.default.DamageEventQueue[i + 1])
        end
        i = i + 1
    end
end
function TriggerUtil.AnyUnitDamagedFilter()
    if GetUnitAbilityLevel(
        GetFilterUnit(),
        FourCC("Aloc")
    ) <= 0 then
        TriggerRegisterUnitEvent(
            ____exports.default.DamageEventTrigger,
            GetFilterUnit(),
            EVENT_UNIT_DAMAGED
        )
    end
    return false
end
function TriggerUtil.AnyUnitDamagedEnumUnit()
    local g = CreateGroup()
    local i = 0
    while i < 16 do
        GroupEnumUnitsOfPlayer(
            g,
            Player(i),
            Condition(____exports.default.AnyUnitDamagedFilter)
        )
        i = i + 1
    end
    DestroyGroup(g)
end
function TriggerUtil.AnyUnitDamagedRegistTriggerUnitEnter()
    local t = CreateTrigger()
    local r = CreateRegion()
    local world = GetWorldBounds()
    RegionAddRect(r, world)
    TriggerRegisterEnterRegion(
        t,
        r,
        Condition(____exports.default.AnyUnitDamagedFilter)
    )
    RemoveRect(world)
end
function TriggerUtil.SyStemAnyUnitDamagedSwap()
    local isEnabled = IsTriggerEnabled(____exports.default.DamageEventTrigger)
    DisableTrigger(____exports.default.DamageEventTrigger)
    if ____exports.default.DamageEventTriggerToDestory ~= nil then
        DestroyTrigger(____exports.default.DamageEventTriggerToDestory)
    end
    ____exports.default.DamageEventTriggerToDestory = ____exports.default.DamageEventTrigger
    ____exports.default.DamageEventTrigger = CreateTrigger()
    if not isEnabled then
        DisableTrigger(____exports.default.DamageEventTrigger)
    end
    TriggerAddAction(____exports.default.DamageEventTrigger, ____exports.default.AnyUnitDamagedTriggerAction)
    ____exports.default.AnyUnitDamagedEnumUnit()
end
TriggerUtil.DamageEventTrigger = nil
TriggerUtil.DAMAGE_EVENT_SWAP_TIMEOUT = 120
TriggerUtil.DAMAGE_EVENT_SWAP_ENABLE = true
TriggerUtil.DamageEventTriggerToDestory = nil
TriggerUtil.DamageEventQueue = {}
TriggerUtil.DamageEventNumber = 0
____exports.default = TriggerUtil
return ____exports
