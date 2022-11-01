import DamageType from "solar/constant/DamageType";
import SelectUtil from "../unit/SelectUtil";

export default class DamageUtil {

    static damageTypes: damagetype[] = DamageUtil.createDamageTypes();


    /**
     * helper
     * see DamageType
     * damage = 伤害值
     * damageTypeId 0-31可取
     */
    static damageTarget(whichUnit: unit, target: widget, damage: number, damageTypeId: number = DamageType.T4_NORMAL,
                        attackType: attacktype = ATTACK_TYPE_NORMAL, weaponType: weapontype = WEAPON_TYPE_WHOKNOWS,
                        ranged = true, attack = false) {
        let dt: damagetype = DamageUtil.damageTypes[damageTypeId]
        return UnitDamageTarget(whichUnit, target, damage, attack, ranged, attackType, dt, weaponType)
    }

    /**
     * 此方法 在太阳伤害事件中造成的伤害 会继续走太阳伤害事件 请自行通过判断伤害类型等 防止死循环
     * @param whichUnit
     * @param target
     * @param damage
     * @param damageTypeId
     * @param attackType
     * @param weaponType
     * @param ranged
     * @param attack
     */
    static damageTargetSL(whichUnit: unit, target: widget, damage: number, damageTypeId: number = DamageType.T4_NORMAL,
                          attackType: attacktype = ATTACK_TYPE_NORMAL, weaponType: weapontype = WEAPON_TYPE_WHOKNOWS,
                          ranged = true, attack = false) {
        let oldFlag = isSolarDamageEnable;
        isSolarDamageEnable = true;
        let dt: damagetype = DamageUtil.damageTypes[damageTypeId]
        UnitDamageTarget(whichUnit, target, damage, attack, ranged, attackType, dt, weaponType)
        isSolarDamageEnable = oldFlag;
    }


    /**
     * 伤害范围内的敌人
     * @param whichUnit 伤害来源
     * @param radius
     * @param damage
     * @param damageTypeId
     * @param x 范围中心点x
     * @param y 范围中心点y
     * @param attackType
     * @param weaponType
     * @param ranged
     * @param attack
     */
    static damageEnemyUnitsInRange(whichUnit: unit, radius: number, damage: number, damageTypeId: number = DamageType.T4_NORMAL,
                                   x = GetUnitX(whichUnit), y = GetUnitY(whichUnit),
                                   attackType: attacktype = ATTACK_TYPE_NORMAL, weaponType: weapontype = WEAPON_TYPE_WHOKNOWS,
                                   ranged = true, attack = false) {
        let dt: damagetype = DamageUtil.damageTypes[damageTypeId]
        SelectUtil.forEnemyUnitsInRange(whichUnit, radius, (enemy) => {
            UnitDamageTarget(whichUnit, enemy, damage, attack, ranged, attackType, dt, weaponType)
        })
    }

    /**
     * 此伤害会继续走太阳伤害
     * @param whichUnit
     * @param radius
     * @param damage
     * @param damageTypeId
     * @param x
     * @param y
     * @param attackType
     * @param weaponType
     * @param ranged
     * @param attack
     */
    static damageEnemyUnitsInRangeSL(whichUnit: unit, radius: number, damage: number, damageTypeId: number = DamageType.T4_NORMAL,
                                     x = GetUnitX(whichUnit), y = GetUnitY(whichUnit),
                                     attackType: attacktype = ATTACK_TYPE_NORMAL, weaponType: weapontype = WEAPON_TYPE_WHOKNOWS,
                                     ranged = true, attack = false) {
        let dt: damagetype = DamageUtil.damageTypes[damageTypeId]
        let oldFlag = isSolarDamageEnable;
        isSolarDamageEnable = true;
        SelectUtil.forEnemyUnitsInRange(whichUnit, radius, (enemy) => {
            UnitDamageTarget(whichUnit, enemy, damage, attack, ranged, attackType, dt, weaponType)
        })
        isSolarDamageEnable = oldFlag;
    }


    /**
     * 是否物理伤害
     */
    static isEventPhysicalDamage(): boolean {
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL);
    }

    /**
     * 是否攻击伤害
     */
    static isEventAttackDamage(): boolean {
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK);
    }

    /**
     * 是否远程伤害
     */
    static isEventRangedDamage(): boolean {
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED);
    }

    /**
     * 是否某个伤害类型
     * @param damageType
     */
    static isEventDamageType(damageType: damagetype): boolean {
        return damageType == ConvertDamageType(EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE));
    }

    /**
     * 是否某个武器类型
     * @param damageType
     */
    static isEventWeaponType(weaponType: weapontype): boolean {
        return weaponType == ConvertWeaponType(EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE));
    }

    /**
     * 是否某个攻击类型
     * @param damageType
     */
    static isEventAttackType(attackType: attacktype): boolean {
        return attackType == ConvertAttackType(EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE));
    }


    /**
     * @private
     */
    private static createDamageTypes(): damagetype[] {
        let ds: damagetype[] = [];
        for (let i = 0; i < 32; i++) {
            ds[i] = ConvertDamageType(i)
        }
        return ds
    }
}
