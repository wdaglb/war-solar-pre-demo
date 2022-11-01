local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 6,["9"] = 6,["10"] = 6,["12"] = 6,["13"] = 9,["14"] = 11,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 11,["20"] = 17,["21"] = 18,["22"] = 17,["23"] = 23,["24"] = 24,["25"] = 23,["26"] = 28,["27"] = 29,["28"] = 29,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 28,["33"] = 32,["34"] = 33,["35"] = 33,["36"] = 33,["37"] = 33,["38"] = 32,["39"] = 38,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 40,["46"] = 38,["47"] = 44,["48"] = 45,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 46,["53"] = 46,["54"] = 46,["55"] = 46,["56"] = 44,["57"] = 49,["58"] = 50,["59"] = 50,["60"] = 50,["61"] = 51,["62"] = 52,["64"] = 50,["65"] = 50,["66"] = 50,["67"] = 49,["68"] = 58,["69"] = 59,["70"] = 59,["71"] = 59,["72"] = 60,["73"] = 61,["75"] = 59,["76"] = 59,["77"] = 59,["78"] = 58,["79"] = 68,["80"] = 70,["81"] = 70,["82"] = 70,["83"] = 73,["84"] = 74,["85"] = 75,["86"] = 76,["87"] = 77,["88"] = 79,["89"] = 80,["90"] = 81,["91"] = 83,["92"] = 84,["93"] = 85,["94"] = 86,["95"] = 87,["96"] = 87,["97"] = 87,["98"] = 87,["99"] = 87,["100"] = 87,["103"] = 91,["104"] = 92,["105"] = 93,["106"] = 94,["107"] = 94,["108"] = 94,["109"] = 94,["110"] = 94,["111"] = 94,["114"] = 97,["115"] = 98,["116"] = 99,["117"] = 99,["118"] = 99,["119"] = 99,["120"] = 99,["121"] = 100,["122"] = 101,["124"] = 103,["125"] = 103,["126"] = 103,["127"] = 103,["128"] = 103,["129"] = 103,["134"] = 109,["135"] = 109,["136"] = 109,["137"] = 109,["138"] = 109,["139"] = 109,["140"] = 110,["142"] = 114,["143"] = 70,["144"] = 70,["145"] = 68,["146"] = 120,["147"] = 122,["148"] = 120,["149"] = 126,["150"] = 128,["151"] = 128,["152"] = 128,["153"] = 128,["154"] = 128,["155"] = 126,["156"] = 133,["157"] = 135,["158"] = 135,["159"] = 135,["160"] = 135,["161"] = 135,["162"] = 135,["163"] = 133,["164"] = 9,["165"] = 6});
local ____exports = {}
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local YDWE = ____exports.default
YDWE.name = "YDWE"
function YDWE.prototype.____constructor(self)
end
function YDWE._sl_init(self)
    _G.YDWEAngleBetweenUnits = function(fromUnit, toUnit)
        return bj_RADTODEG * Atan2(
            GetUnitY(toUnit) - GetUnitY(fromUnit),
            GetUnitX(toUnit) - GetUnitX(fromUnit)
        )
    end
    _G.YDWEDistanceBetweenUnits = function(a, b)
        return SquareRoot((GetUnitX(a) - GetUnitX(b)) * (GetUnitX(a) - GetUnitX(b)) + (GetUnitY(a) - GetUnitY(b)) * (GetUnitY(a) - GetUnitY(b)))
    end
    _G.YDWESetEventDamage = function(amount)
        return EXSetEventDamage(amount)
    end
    _G.YDWESetUnitAbilityState = function(u, abilcode, state_type, value)
        return EXSetAbilityState(
            EXGetUnitAbility(u, abilcode),
            state_type,
            value
        )
    end
    _G.YDWEGetUnitAbilityState = function(u, abilcode, state_type)
        return EXGetAbilityState(
            EXGetUnitAbility(u, abilcode),
            state_type
        )
    end
    _G.YDWESetUnitAbilityDataReal = function(u, abilcode, level, data_type, value)
        return EXSetAbilityDataReal(
            EXGetUnitAbility(u, abilcode),
            level,
            data_type,
            value
        )
    end
    _G.YDWEFlyEnable = function(u)
        UnitAddAbility(
            u,
            FourCC("Amrf")
        )
        UnitRemoveAbility(
            u,
            FourCC("Amrf")
        )
    end
    _G.YDWETimerRemoveUnit = function(time, u)
        BaseUtil.runLater(
            time,
            function()
                if IsHandle(u) then
                    RemoveUnit(u)
                end
            end,
            1
        )
    end
    _G.YDWETimerDestroyEffect = function(time, e)
        BaseUtil.runLater(
            time,
            function()
                if IsHandle(e) then
                    DestroyEffect(e)
                end
            end,
            1
        )
    end
    _G.YDWESetGuard = function(pet, captain, timeout, guardRanger, returnRanger, outRanger, percent)
        BaseUtil.onTimer(
            timeout,
            function()
                local p = percent
                local x = GetUnitX(captain) - GetUnitX(pet)
                local y = GetUnitY(captain) - GetUnitY(pet)
                local d = x * x + y * y
                local v = guardRanger
                if GetUnitState(pet, UNIT_STATE_LIFE) > 0 and GetUnitState(captain, UNIT_STATE_LIFE) > 0 then
                    if d < v * v then
                        if OrderId2String(GetUnitCurrentOrder(pet)) == nil and GetRandomInt(0, 100) < p then
                            local x = GetUnitX(captain)
                            local y = GetUnitY(captain)
                            d = GetRandomReal(0, v)
                            local a = GetRandomReal(0, 360)
                            IssuePointOrder(
                                pet,
                                "patrol",
                                x + d * CosBJ(a),
                                y + d * SinBJ(a)
                            )
                        end
                    else
                        v = returnRanger
                        if d < v * v then
                            if OrderId2String(GetUnitCurrentOrder(pet)) == nil then
                                IssuePointOrder(
                                    pet,
                                    "patrol",
                                    GetUnitX(captain),
                                    GetUnitY(captain)
                                )
                            end
                        else
                            v = outRanger
                            if d ~= 0 and d > v * v then
                                SetUnitPosition(
                                    pet,
                                    GetUnitX(captain),
                                    GetUnitY(captain)
                                )
                                local e = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", captain, "chest")
                                DestroyEffect(e)
                            else
                                IssuePointOrder(
                                    pet,
                                    "move",
                                    GetUnitX(captain),
                                    GetUnitY(captain)
                                )
                            end
                        end
                    end
                else
                    IssuePointOrder(
                        pet,
                        "attack",
                        GetUnitX(captain),
                        GetUnitY(captain)
                    )
                    return false
                end
                return true
            end
        )
    end
    _G.YDWEGetItemDataString = function(ItemTypeId, Type)
        return EXGetItemDataString(ItemTypeId, Type)
    end
    _G.YDWEGetUnitAbilityDataString = function(u, abilcode, level, data_type)
        return EXGetAbilityDataString(
            EXGetUnitAbility(u, abilcode),
            level,
            data_type
        )
    end
    _G.YDWESetUnitAbilityDataString = function(u, abilcode, level, data_type, value)
        EXSetAbilityDataString(
            EXGetUnitAbility(u, abilcode),
            level,
            data_type,
            value
        )
    end
end
____exports.default = YDWE
return ____exports
