local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 9,["13"] = 9,["14"] = 9,["16"] = 9,["17"] = 23,["18"] = 23,["19"] = 23,["21"] = 23,["22"] = 23,["24"] = 24,["25"] = 24,["27"] = 24,["28"] = 24,["30"] = 25,["31"] = 26,["32"] = 28,["33"] = 29,["34"] = 30,["36"] = 32,["37"] = 33,["38"] = 34,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 37,["44"] = 38,["45"] = 39,["46"] = 40,["47"] = 41,["48"] = 42,["50"] = 44,["51"] = 45,["52"] = 46,["53"] = 47,["54"] = 48,["57"] = 51,["58"] = 52,["59"] = 52,["60"] = 52,["61"] = 52,["62"] = 54,["63"] = 55,["65"] = 57,["66"] = 57,["67"] = 57,["68"] = 57,["69"] = 58,["71"] = 60,["72"] = 61,["73"] = 61,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 61,["78"] = 61,["79"] = 61,["80"] = 61,["81"] = 61,["82"] = 52,["83"] = 52,["85"] = 66,["86"] = 67,["87"] = 68,["88"] = 69,["90"] = 71,["91"] = 72,["93"] = 74,["95"] = 76,["96"] = 36,["97"] = 36,["98"] = 23,["99"] = 9});
local ____exports = {}
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____GroupUtil = require("solar.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local ____SelectUtil = require("solar.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
____exports.default = __TS__Class()
local LeapUtil = ____exports.default
LeapUtil.name = "LeapUtil"
function LeapUtil.prototype.____constructor(self)
end
function LeapUtil.leap(damage_src_handle, angle, range, time, damage, dmgType, effectPath, startX, startY)
    if damage == nil then
        damage = 0
    end
    if dmgType == nil then
        dmgType = DAMAGE_TYPE_NORMAL
    end
    if startX == nil then
        startX = GetUnitX(damage_src_handle)
    end
    if startY == nil then
        startY = GetUnitY(damage_src_handle)
    end
    local execCount = time * 25
    local dis = range / execCount
    local effectHandle = nil
    if effectPath and #effectPath > 0 then
        effectHandle = AddSpecialEffect(effectPath, startX, startY)
    end
    local damagedUnitGroup = nil
    if damage > 0 then
        damagedUnitGroup = GroupUtil.groupObjectPool:borrowObject()
    end
    BaseUtil.onTimer(
        0.04,
        function(____, c)
            local x = 0
            local y = 0
            if effectHandle then
                x = dis * math.cos(angle) + EXGetEffectX(effectHandle)
                y = dis * math.sin(angle) + EXGetEffectY(effectHandle)
                EXSetEffectXY(effectHandle, x, y)
            else
                x = dis * math.cos(angle) + GetUnitX(damage_src_handle)
                y = dis * math.sin(angle) + GetUnitY(damage_src_handle)
                if IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) then
                    SetUnitX(damage_src_handle, x)
                    SetUnitY(damage_src_handle, y)
                end
            end
            if damage > 0 then
                SelectUtil.forEnemyUnitsInRange(
                    damage_src_handle,
                    128,
                    function(____, unit)
                        if IsUnitInGroup(unit, damagedUnitGroup) then
                            return false
                        end
                        if IsUnitEnemy(
                            unit,
                            GetOwningPlayer(damage_src_handle)
                        ) then
                            return true
                        end
                        GroupAddUnit(damagedUnitGroup, unit)
                        UnitDamageTarget(
                            damage_src_handle,
                            unit,
                            damage,
                            false,
                            false,
                            ATTACK_TYPE_NORMAL,
                            dmgType,
                            WEAPON_TYPE_WHOKNOWS
                        )
                    end
                )
            end
            execCount = execCount - 1
            if execCount < 1 then
                if damagedUnitGroup then
                    GroupUtil.groupObjectPool:returnObject(damagedUnitGroup)
                end
                if effectHandle then
                    DestroyEffect(effectHandle)
                end
                return false
            end
            return true
        end
    )
end
____exports.default = LeapUtil
return ____exports
