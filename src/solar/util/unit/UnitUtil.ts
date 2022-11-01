import {Unit} from "solar/w3ts/handles/unit";
import DataBase from "solar/common/DataBase";
import MathUtil from "../math/MathUtil";
import UnitStateUtil from "./UnitStateUtil";

const BaseAttributeMax = 10000000;
/** @noSelf **/
export default class UnitUtil {

    /**
     * 计算单位的 属性伤害值
     * @param unitHandle
     * @param dmgPropertySet
     */
    static calculateDamageByPropertySet(unitHandle: unit, dmgPropertySet: {
        strDamageRate?: number,
        agiDamageRate?: number,
        intDamageRate?: number,
        hpDamageRate?: number,
        manaDamageRate?: number,
    }): number {
        let damage = 0;
        if (dmgPropertySet.strDamageRate) {
            damage = GetHeroStr(unitHandle, true) * dmgPropertySet.strDamageRate + damage;
        }
        if (dmgPropertySet.agiDamageRate) {
            damage = GetHeroAgi(unitHandle, true) * dmgPropertySet.agiDamageRate + damage;
        }
        if (dmgPropertySet.intDamageRate) {
            damage = GetHeroInt(unitHandle, true) * dmgPropertySet.intDamageRate + damage;
        }
        if (dmgPropertySet.hpDamageRate) {
            damage = GetUnitState(unitHandle, UNIT_STATE_LIFE) * dmgPropertySet.hpDamageRate + damage;
        }
        if (dmgPropertySet.manaDamageRate) {
            damage = GetUnitState(unitHandle, UNIT_STATE_MANA) * dmgPropertySet.hpDamageRate + damage;
        }
        return damage;
    }


    /**
     * 获取物品类型所在物品栏的序号 1-6
     * @param unitHandle
     * @param id
     * @constructor
     */
    static GetInventoryIndexOfItemType(unitHandle: unit, id: string): number {
        let idint = FourCC(id);

        for (let i = 0; i < 6; i++) {
            let indexItem = UnitItemInSlot(unitHandle, i)
            if (indexItem != null && GetItemTypeId(indexItem) == idint) {
                return i + 1
            }
        }
        return 0
    }

    /**
     * 获取单位物品栏里的指定物品类型的物品
     * @param unitHandle
     * @param idint
     * @constructor
     */
    static GetInventoryOfItemType(unitHandle: unit, idint: number): item {
        for (let i = 0; i < 6; i++) {
            let indexItem = UnitItemInSlot(unitHandle, i)
            if (indexItem != null && GetItemTypeId(indexItem) == idint) {
                return indexItem
            }
        }
        return null
    }


    /**
     * 白字属性
     * 为英雄添加全属性 根据key（如果相同的key则会自动减去之前添加的对应key的值）
     * @param unit
     * @param key
     * @param addNum
     */
    static addHeroProperty(unit: Unit, key: string, addNum: number) {
        if (!unit.isHero()) {
            return
        }
        //力量
        let baseStr = unit.strength;
        if (unit.solarData['UnitUtil_addHeroProperty_strength_' + key]) {
            baseStr = baseStr - unit.solarData['UnitUtil_addHeroProperty_strength_' + key];
        }
        unit.solarData['UnitUtil_addHeroProperty_strength_' + key] = addNum
        unit.strength = baseStr + addNum
        //敏捷
        let baseAgi = unit.agility;
        if (unit.solarData['UnitUtil_addHeroProperty_agility_' + key]) {
            baseAgi = baseAgi - unit.solarData['UnitUtil_addHeroProperty_agility_' + key];
        }
        unit.solarData['UnitUtil_addHeroProperty_agility_' + key] = addNum
        unit.agility = baseAgi + addNum
        //智力
        let baseInt = unit.intelligence;
        if (unit.solarData['UnitUtil_addHeroProperty_intelligence_' + key]) {
            baseInt = baseInt - unit.solarData['UnitUtil_addHeroProperty_intelligence_' + key];
        }
        unit.solarData['UnitUtil_addHeroProperty_intelligence_' + key] = addNum
        unit.intelligence = baseInt + addNum
        //
    }

    /**
     * 白字属性
     * 为英雄按比例添加全属性 根据key（如果相同的key则会自动减去之前添加的对应key的值）
     * @param unit
     * @param key
     * @param addNum
     */
    static addHeroPropertyByRate(unit: Unit, key: string, addRate: number) {
        if (!unit.isHero()) {
            return
        }
        let addNum = 0
        //力量
        let baseStr = unit.strength;
        if (unit.solarData['UnitUtil_addHeroPropertyByRate_strength_' + key]) {
            baseStr = baseStr - unit.solarData['UnitUtil_addHeroPropertyByRate_strength_' + key];
        }
        addNum = baseStr * addRate
        unit.solarData['UnitUtil_addHeroPropertyByRate_strength_' + key] = addNum
        unit.strength = baseStr + addNum
        //敏捷
        let baseAgi = unit.agility;
        if (unit.solarData['UnitUtil_addHeroPropertyByRate_agility_' + key]) {
            baseAgi = baseAgi - unit.solarData['UnitUtil_addHeroPropertyByRate_agility_' + key];
        }
        addNum = baseAgi * addRate
        unit.solarData['UnitUtil_addHeroPropertyByRate_agility_' + key] = addNum
        unit.agility = baseAgi + addNum
        //智力
        let baseInt = unit.intelligence;
        if (unit.solarData['UnitUtil_addHeroPropertyByRate_intelligence_' + key]) {
            baseInt = baseInt - unit.solarData['UnitUtil_addHeroPropertyByRate_intelligence_' + key];
        }
        addNum = baseInt * addRate
        unit.solarData['UnitUtil_addHeroPropertyByRate_intelligence_' + key] = addNum
        unit.intelligence = baseInt + addNum
        //
    }


    /**
     *设置附加魔法值
     */
    static setExtraMana(unitHandle: unit, val: number, key: string = "base") {
        let nowValue = GetUnitState(unitHandle, UNIT_STATE_MANA)
        let maxValue = GetUnitState(unitHandle, UNIT_STATE_MAX_MANA)//可能为0
        let bfp = 1;
        if (maxValue > 0) {
            bfp = nowValue / maxValue;
        }
        let oldExtra = UnitUtil.getExtraMana(unitHandle);
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Mana', val, key);
        let add = val - oldExtra
        maxValue += add;
        nowValue = bfp * maxValue;
        SetUnitState(unitHandle, UNIT_STATE_MAX_MANA, maxValue)
        SetUnitState(unitHandle, UNIT_STATE_MANA, nowValue)
    }

    static getExtraMana(unitHandle: unit, key?: string): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Mana', key);
    }

    /**
     *设置附加生命值
     */
    static setExtraHp(unitHandle: unit, val: number, key: string = "base") {
        let nowValue = GetUnitState(unitHandle, UNIT_STATE_LIFE)
        let maxValue = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE)
        let bfp = nowValue / maxValue;
        let oldExtra = UnitUtil.getExtraHp(unitHandle);
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Hp', val, key);
        let add = val - oldExtra
        maxValue += add;
        nowValue = bfp * maxValue;
        SetUnitState(unitHandle, UNIT_STATE_MAX_LIFE, maxValue)
        SetUnitState(unitHandle, UNIT_STATE_LIFE, nowValue)
    }

    static getExtraHp(unitHandle: unit, key?: string): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Hp', key);
    }

    /**
     *设置附加的攻击间隔 负数为减少攻击间隔
     */
    static setExtraDamageCool(unitHandle: unit, val: number, key: string = "base") {
        let oldExtra = UnitUtil.getExtraValue(unitHandle, '_SLExt_DamageCool');
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_DamageCool', val, key);
        let add = val - oldExtra
        UnitStateUtil.addDamageCool(unitHandle, add)
    }

    /**
     *设置附加的攻击范围
     */
    static setExtraDamageRange(unitHandle: unit, val: number, key: string = "base") {
        let oldExtra = UnitUtil.getExtraValue(unitHandle, '_SLExt_DamageRange');
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_DamageRange', val, key);
        let add = val - oldExtra
        UnitStateUtil.addDamageRange(unitHandle, add)
    }

    /**
     *设置附加的移动速度
     */
    static setExtraMoveSpeed(unitHandle: unit, val: number, key: string = "base") {
        let oldExtra = UnitUtil.getExtraValue(unitHandle, '_SLExt_MoveSpeed');
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_MoveSpeed', val, key);
        let add = val - oldExtra
        UnitStateUtil.addMoveSpeed(unitHandle, add)
    }

    /**
     *设置攻击速度 0.5 = 50%
     */
    static setExtraAttackSpd(unitHandle: unit, val: number, key: string = "base") {
        //AIs2 = 能提高进攻速度的物品
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_AttackSpd', val, key);
        UnitUtil.refreshUnitAbilityData(unitHandle, FourCC("AIs2"), ABILITY_DATA_DATA_A, val)
    }

    /**
     * 注意：只获取由 setExtraAttack  设置的值
     * @param unitHandle
     */
    static getExtraAttackSpd(unitHandle: unit): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_AttackSpd');
    }

    /**
     *设置附加攻击 (即绿字攻击力)
     */
    static setExtraAttack(unitHandle: unit, val: number, key: string = "base") {
        //AItg = 攻击之爪+1
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Attack', val, key);
        if (isBigAttributeMode) {
            val = MathUtil.min(val, BaseAttributeMax);
        }
        UnitUtil.refreshUnitAbilityData(unitHandle, FourCC("AItg"), 108, val)
    }

    /**
     * 注意：只获取由 setExtraAttack  设置的值
     * @param unitHandle
     */
    static getExtraAttack(unitHandle: unit): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Attack');
    }

    /**
     *设置附加护甲 (即绿字护甲)
     */
    static setExtraDef(unitHandle: unit, val: number, key: string = "base") {
        //AId1 = 能提高护甲的物品(1)
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Def', val, key);
        if (isBigAttributeMode) {
            //1e
            val = MathUtil.min(val, BaseAttributeMax);
        }
        UnitUtil.refreshUnitAbilityData(unitHandle, FourCC("AId1"), 108, val)
    }

    /**
     * 注意：只获取由 setExtraDef  设置的值
     * @param unitHandle
     */
    static getExtraDef(unitHandle: unit): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Def');
    }

    /**
     * 同时设置3维属性
     * @param unitHandle
     * @param val
     * @param key
     */
    static setExtraStrAgiInt(unitHandle: unit, key: string, str: number, agi: number, int: number) {
        let str_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Str', str, key);
        let agi_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Agi', agi, key);
        let int_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Int', int, key);
        UnitUtil.refreshUnitAamkData(unitHandle, str_val, agi_val, int_val);
    }

    /**
     *设置附加力量 (即绿字力量)
     */
    static setExtraStr(unitHandle: unit, val: number, key: string = "base") {
        let str_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Str', val, key);
        let agi_val = UnitUtil.getExtraAgi(unitHandle);
        let int_val = UnitUtil.getExtraInt(unitHandle);
        UnitUtil.refreshUnitAamkData(unitHandle, str_val, agi_val, int_val)
    }

    /**
     * 注意：只获取由 setExtraStr  设置的值
     * @param unitHandle
     */
    static getExtraStr(unitHandle: unit, key?: string): number {
        if (key) {
            return UnitUtil.getExtraValue(unitHandle, '_SLExt_Str', key);
        }
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Str');
    }

    /**
     *设置附加敏捷 (即绿字敏捷)
     */
    static setExtraAgi(unitHandle: unit, val: number, key: string = "base") {
        let str_val = UnitUtil.getExtraStr(unitHandle);
        let agi_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Agi', val, key);
        let int_val = UnitUtil.getExtraInt(unitHandle);
        UnitUtil.refreshUnitAamkData(unitHandle, str_val, agi_val, int_val)
    }

    /**
     * 注意：只获取由 setExtraAgi  设置的值
     * @param unitHandle
     */
    static getExtraAgi(unitHandle: unit, key?: string): number {
        if (key) {
            return UnitUtil.getExtraValue(unitHandle, '_SLExt_Agi', key);
        }
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Agi');
    }

    /**
     *设置附加智力 (即绿字智力)
     */
    static setExtraInt(unitHandle: unit, val: number, key: string = "base") {
        let str_val = UnitUtil.getExtraStr(unitHandle);
        let agi_val = UnitUtil.getExtraAgi(unitHandle);
        let int_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Int', val, key);
        UnitUtil.refreshUnitAamkData(unitHandle, str_val, agi_val, int_val)
    }

    /**
     * 注意：只获取由 setExtraInt  设置的值
     * @param unitHandle
     */
    static getExtraInt(unitHandle: unit, key?: string): number {
        if (key) {
            return UnitUtil.getExtraValue(unitHandle, '_SLExt_Int', key);
        }
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Int');
    }


    /**
     * 获取扩展属性 (即绿字)
     * type = 扩展的属性类型 (如 攻击力/力量/暴击率等等)
     * 返回这个type类型的总和
     * @param unitHandle
     * @param type
     * @param val
     * @param key
     */
    static extraValueSum(unitHandle: unit, type: string, val: number, key: string = "base"): number {
        let solarData = DataBase.getUnitSolarData(unitHandle);
        let extraData: { [key: string]: number } = solarData[type];
        if (val) {
            if (!extraData) {
                extraData = {};
                solarData[type] = extraData
            }
            extraData[key] = val;
        }
        let count = MathUtil.sum(extraData);
        return count;
    }

    /**
     * 获取单位扩展值
     * @param unitHandle
     * @param type
     * @param key 不传key 则返回此type类型的所有key值的合计值
     */
    static getExtraValue(unitHandle: unit, type: string, key?: string): number {
        let solarData = DataBase.getUnitSolarData(unitHandle, false);
        if (!solarData) {
            return 0;
        }
        let extraData: { [key: string]: number } = solarData[type];
        if (key) {
            return extraData?.[key] ?? 0;
        }
        return MathUtil.sum(extraData);
    }


    /**
     * 刷新 单位技能的 数据值
     * 如果单位没有当前技能则会自动添加
     * @param unitHandle
     * @param abilcode
     * @param data_type
     * @param value
     */
    static refreshUnitAbilityData(unitHandle: unit, abilcode: number, data_type: number, value: number) {
        if (GetUnitAbilityLevel(unitHandle, abilcode) <= 0) {
            UnitAddAbility(unitHandle, abilcode)
        }
        let ability = EXGetUnitAbility(unitHandle, abilcode)
        IncUnitAbilityLevel(unitHandle, abilcode)
        EXSetAbilityDataReal(ability, 1, data_type, value)
        DecUnitAbilityLevel(unitHandle, abilcode)
    }

    /**
     * 刷新单位属性附加的数值
     * (PS:这个技能超过1kw的属性附加绿字 会导致敏捷英雄白字攻击增长。超过1kw可走太阳大数值兼容模式)
     * @param unitHandle
     * @param str
     * @param agi
     * @param int
     */
    private static refreshUnitAamkData(unitHandle: unit, str: number, agi: number, int: number) {
        let abilcode = FourCC("Aamk")
        if (GetUnitAbilityLevel(unitHandle, abilcode) <= 0) {
            UnitAddAbility(unitHandle, abilcode)
            let ability = EXGetUnitAbility(unitHandle, abilcode)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_D, 1)//dataD 隐藏图标
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, 0)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 0)
        }
        let ability = EXGetUnitAbility(unitHandle, abilcode)
        IncUnitAbilityLevel(unitHandle, abilcode)

        if (isBigAttributeMode) {
            //10e
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, MathUtil.min(agi, BaseAttributeMax));
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, MathUtil.min(int, BaseAttributeMax));
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, MathUtil.min(str, BaseAttributeMax));
            //力量奖励生命值
            if (StrHpBonus > 0 && str > BaseAttributeMax) {
                UnitUtil.setExtraHp(unitHandle, (str - BaseAttributeMax) * StrHpBonus, "_SL_refreshUnitAamkData") //将没有走原生力量的 力量 手动转换到生命值上去
            }
            //敏捷在获取护甲处计算
            //智力奖励魔法
            if (IntManaBonus > 0 && int > BaseAttributeMax) {
                UnitUtil.setExtraMana(unitHandle, (int - BaseAttributeMax) * IntManaBonus, "_SL_refreshUnitAamkData") //将没有走原生智力的 智力 手动转换到魔法值上去
            }


        } else {
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, agi)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, int)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, str)
        }
        DecUnitAbilityLevel(unitHandle, abilcode)
    }
}
