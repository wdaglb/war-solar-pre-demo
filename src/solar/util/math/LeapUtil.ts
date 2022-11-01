import BaseUtil from "../BaseUtil";
import GroupUtil from "../unit/GroupUtil";
import SelectUtil from "../unit/SelectUtil";

/**
 * 冲锋
 */
/** @noSelf **/
export default class LeapUtil {

    /**
     *
     * @param damage_src_handle
     * @param angle 传入角度
     * @param range
     * @param time
     * @param damage
     * @param dmgType
     * @param effectPath  // 有特效则 只移动特效 比如发射投射物冲锋
     * @param startX
     * @param startY
     */
    static leap(damage_src_handle: unit, angle: number, range: number, time: number, damage: number = 0, dmgType: damagetype = DAMAGE_TYPE_NORMAL,
                effectPath?: string, startX: number = GetUnitX(damage_src_handle), startY: number = GetUnitY(damage_src_handle)) {
        let execCount = time * 25
        let dis = range / execCount;
        // angle = MathUtil.angle2radian(angle)
        let effectHandle: effect = null
        if (effectPath && effectPath.length > 0) {
            effectHandle = AddSpecialEffect(effectPath, startX, startY)
        }
        let damagedUnitGroup: group = null;
        if (damage > 0) {
            damagedUnitGroup = GroupUtil.groupObjectPool.borrowObject();
        }
        BaseUtil.onTimer(0.04, (c) => {
            let x = 0;
            let y = 0;
            if (effectHandle) {
                x = dis * Math.cos(angle) + EXGetEffectX(effectHandle);
                y = dis * Math.sin(angle) + EXGetEffectY(effectHandle)
                EXSetEffectXY(effectHandle, x, y);
            } else {
                x = dis * Math.cos(angle) + GetUnitX(damage_src_handle);
                y = dis * Math.sin(angle) + GetUnitY(damage_src_handle)
                if (IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                    SetUnitX(damage_src_handle, x);
                    SetUnitY(damage_src_handle, y);
                }
            }
            if (damage > 0) {
                SelectUtil.forEnemyUnitsInRange(damage_src_handle, 128, unit => {
                    //说明已经伤害过了
                    if (IsUnitInGroup(unit, damagedUnitGroup)) {
                        return false
                    }
                    if (IsUnitEnemy(unit, GetOwningPlayer(damage_src_handle))) {
                        return true
                    }
                    GroupAddUnit(damagedUnitGroup, unit);
                    UnitDamageTarget(damage_src_handle, unit, damage, false, false,
                        ATTACK_TYPE_NORMAL, dmgType, WEAPON_TYPE_WHOKNOWS)
                });
            }
            //DestroyTimer
            execCount = execCount - 1;
            if (execCount < 1) {
                if (damagedUnitGroup) {
                    GroupUtil.groupObjectPool.returnObject(damagedUnitGroup);
                }
                if (effectHandle) {
                    DestroyEffect(effectHandle)
                }
                return false;
            }
            return true;
        })
    }


}
