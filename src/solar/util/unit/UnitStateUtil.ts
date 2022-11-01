/**
 * 单位状态值工具
 */
export default class UnitStateUtil {


    /**
     * 最大生命值
     * @param unitHandle
     */
    static getMaxLife(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE)
    }

    /**
     * 设置最大生命值
     * @param unitHandle
     * @param newVal
     */
    static setMaxLife(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UNIT_STATE_MAX_LIFE, newVal)
    }

    /**
     * 添加最大生命值
     * @param unitHandle
     * @param addVal
     */
    static addMaxLife(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_LIFE, addVal);
    }

    /**
     * 增加最大生命值与当前生命值
     * @param unitHandle
     */
    static addMaxLifeAndLife(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_LIFE, addVal);
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_LIFE, addVal);
    }

    /**
     * 生命值
     * @param unitHandle
     */
    static getLife(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_LIFE)
    }

    /**
     * 设置当前生命值
     * @param unitHandle
     * @param newVal
     */
    static setLife(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UNIT_STATE_LIFE, newVal)
    }

    /**
     * 添加当前生命值 回血
     * @param unitHandle
     * @param addVal
     */
    static addLife(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_LIFE, addVal);
    }

    /**
     * 最大魔法值
     * @param unitHandle
     */
    static getMaxMana(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_MAX_MANA)
    }

    /**
     * 设置最大魔法值
     * @param unitHandle
     * @param newVal
     */
    static setMaxMana(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UNIT_STATE_MAX_MANA, newVal)
    }

    /**
     * 添加最大魔法值
     * @param unitHandle
     * @param addVal
     */
    static addMaxMana(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_MANA, addVal);
    }

    /**
     * 增加最大魔法值与当前魔法值
     * @param unitHandle
     */
    static addMaxManaAndMana(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_MANA, addVal);
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MANA, addVal);
    }

    /**
     * 魔法值
     * @param unitHandle
     */
    static getMana(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_MANA)
    }

    /**
     * 设置当前魔法值
     * @param unitHandle
     * @param newVal
     */
    static setMana(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UNIT_STATE_MANA, newVal)
    }

    /**
     * 添加当前魔法值
     * @param unitHandle
     * @param addVal
     */
    static addMana(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MANA, addVal);
    }

    /**
     *  获取最大伤害
     */
    static getDamageMax(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateDamageMax)
    }

    /**
     *  白字攻击
     */
    static setDamageBase(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UnitStateDamageBase, newVal)
    }

    /**
     * 添加白字攻击
     * @param unitHandle
     * @param addVal
     */
    static addDamageBase(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateDamageBase, addVal);
    }

    /**
     *  获取攻击范围
     */
    static getDamageRange(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateDamageRange)
    }

    /**
     * 设置攻击范围
     * @param unitHandle
     * @param newVal
     */
    static setDamageRange(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UnitStateDamageRange, newVal)
    }

    /**
     * 添加攻击范围
     * @param unitHandle
     * @param addVal
     */
    static addDamageRange(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateDamageRange, addVal);
    }

    /**
     *  获取攻击间隔
     */
    static getDamageCool(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateDamageCool)
    }

    /**
     * 设置攻击间隔
     * @param unitHandle
     * @param newVal
     */
    static setDamageCool(unitHandle: unit, newVal: number) {
        if (newVal < 0.001) {
            newVal = 0.001
        }
        SetUnitState(unitHandle, UnitStateDamageCool, newVal)
    }

    /**
     *  增加攻击间隔(传入负数可减少攻击间隔 以提高攻击频率)
     */
    static addDamageCool(unitHandle: unit, addVal: number) {
        let newVal = GetUnitState(unitHandle, UnitStateDamageCool) + addVal;
        if (newVal < 0.001) {
            newVal = 0.001
        }
        SetUnitState(unitHandle, UnitStateDamageCool, newVal)
    }

    /**
     *  获取攻击速度  默认为1
     *  (ps: +1 = +100%攻击速度)
     */
    static getAttackSpeed(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateAttackSpeed)
    }

    /**
     * 设置攻击速度
     * @param unitHandle
     * @param newVal
     */
    static setAttackSpeed(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UnitStateAttackSpeed, newVal)
    }

    /**
     * 添加攻击速度 1= 100%
     * @param unitHandle
     * @param addVal
     */
    static addAttackSpeed(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateAttackSpeed, addVal);
    }

    /**
     *  获取总护甲
     */
    static getArmor(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateArmor)
    }

    /**
     * 设置总护甲 （修改白字护甲为 总护甲-绿字护甲）
     * @param unitHandle
     * @param newVal
     */
    static setArmor(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UnitStateArmor, newVal)
    }

    /**
     * 添加白字护甲
     * @param unitHandle
     * @param addVal
     */
    static addArmor(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateArmor, addVal);
    }

    /**
     * 添加单位状态值
     * @param unitHandle
     * @param addVal
     */
    static addUnitState(unitHandle: unit, whichUnitState: unitstate, addVal: number): number {
        let newVal = GetUnitState(unitHandle, whichUnitState) + addVal;
        SetUnitState(unitHandle, whichUnitState, newVal)
        return newVal;
    }

    /**
     * 获取移动速度
     */
    static getMoveSpeed(unitHandle: unit): number {
        return GetUnitMoveSpeed(unitHandle);

    }

    /**
     * 设置移动速度
     * @param unitHandle
     * @param newSpeed
     */
    static setMoveSpeed(unitHandle: unit, newSpeed: number) {
        SetUnitMoveSpeed(unitHandle, newSpeed);
    }

    /**
     * 添加移动速度
     * @param unitHandle
     * @param addSpeed
     */
    static addMoveSpeed(unitHandle: unit, addSpeed: number): number {
        let newVal = GetUnitMoveSpeed(unitHandle) + addSpeed;
        SetUnitMoveSpeed(unitHandle, newVal)
        return newVal;
    }
}