import {Trigger} from "solar/w3ts/handles/trigger";
import UnitUtil from "solar/util/unit/UnitUtil";
import AttributeUtil from "solar/util/system/AttributeUtil";
import SingletonUtil from "../util/lang/SingletonUtil";

/**
 * 单位属性系统
 *
 * 将单位自定义属性数值 对应到 单位实际属性上
 */
export default class UnitAttributeState {
    static config: { [unitTypeId: string]: AppAttribute } = {}

    //vars


    constructor() {
        if (SingletonUtil.notFirstTime(UnitAttributeState)) {
            print("不能重复new UnitAttributeState()")
            return;
        }
        //将单位类型的 属性配置 设置到单位身上
        let enterRectTrigger = new Trigger()
        enterRectTrigger.registerEnterRect(GetPlayableMapRect())
        enterRectTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
        enterRectTrigger.addAction(() => {
            let triggerUnit = GetTriggerUnit();
            let typeStr = id2string(GetUnitTypeId(triggerUnit))
            let utsa = UnitAttributeState.config[typeStr];
            if (utsa) {
                AttributeUtil.setUnitAttribute(triggerUnit, utsa, true)
                UnitAttributeState.refreshUnitSolarAtrribute(triggerUnit, utsa);
            }
        });

        //循环 对每个单位 进行刷新属性
        let triggerTimer = new Trigger()
        //3秒刷新一次
        triggerTimer.registerTimerEvent(3.97, true)
        triggerTimer.addAction(() => {
            AttributeUtil.forAllUnitsAttribute((unitHandle, atrribute) => {
                UnitAttributeState.refreshUnitSolarAtrribute(unitHandle, atrribute);
            })
        })
    }


    /**
     * 刷新单位携带的物品的属性值
     * @param unitHandle
     */
    static refreshUnitSolarAtrribute(unitHandle: unit, atrribute ?: AppAttribute) {
        if (!atrribute) {
            atrribute = AttributeUtil.getUnitAttribute(unitHandle);
        }
        if (!atrribute) {
            return
        }
        //刷新装备总计数值到单位
        //108 = dataA
        //one case 将最新的数据刷新到单位绿字上 若最新的不存在则重置旧的数据到0
        if (atrribute.attack) {
            UnitUtil.setExtraAttack(unitHandle, atrribute.attack ?? 0, "_SLA_attack");
        }
        if (atrribute.attack_p) {
            let base = GetUnitState(unitHandle, UnitStateDamageBase)//基础伤害不包括绿字 和附加伤害 但是会包括主属性绿字奖励的攻击力
            let val = (atrribute.attack_p ?? 0) * base
            UnitUtil.setExtraAttack(unitHandle, val, "_SLA_attack_p");
        }


        //one case
        if (atrribute.life) {
            let val = atrribute.life ?? 0
            UnitUtil.setExtraHp(unitHandle, val, "_SLA_life");
        }

        if (atrribute.life_p) {
            let base = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) - UnitUtil.getExtraHp(unitHandle, "_SLA_life_p");
            let val = (atrribute.life_p ?? 0) * base
            // atrribute.life_p_temp = val
            UnitUtil.setExtraHp(unitHandle, val, "_SLA_life_p");
        }
        //one case
        if (atrribute.mana) {
            let val = atrribute.mana ? atrribute.mana : 0
            UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana");
        }
        if (atrribute.mana_p) {
            let base = GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) - UnitUtil.getExtraMana(unitHandle, "_SLA_mana_p");
            let val = (atrribute.mana_p ?? 0) * base
            // atrribute.mana_p_temp = val
            UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana_p");
        }
        //one case
        if (atrribute.def != null) {
            let val = atrribute.def ?? 0
            UnitUtil.setExtraDef(unitHandle, val, "_SLA_def");
        }
        if (atrribute.def_p != null) {
            let base = GetUnitState(unitHandle, UnitStateArmor)
            let val = (atrribute.def_p ?? 0) * base
            // atrribute.def_p_temp = val
            UnitUtil.setExtraDef(unitHandle, val, "_SLA_def_p");
        }
        //one case
        if (atrribute.attackSpd_p != null) {//攻击速度 0.5 = 50%
            let val = atrribute.attackSpd_p
            UnitUtil.setExtraAttackSpd(unitHandle, val, "_SLA_attackSpd_p");

        }
        //one case
        if (atrribute.damage_cool != null) {//攻击间隔
            UnitUtil.setExtraDamageCool(unitHandle, atrribute.damage_cool, "_SLA_damage_cool");
        }
        //one case
        if (atrribute.damage_range != null) {//攻击范围
            UnitUtil.setExtraDamageRange(unitHandle, atrribute.damage_range, "_SLA_damage_range");
        }
        //one case
        if (atrribute.move_speed != null) {//移动速度
            UnitUtil.setExtraMoveSpeed(unitHandle, atrribute.move_speed, "_SLA_move_speed");
        }
        //one case 属性附加
        let strength = atrribute.full_property ?? 0
        let agility = strength
        let intelligence = strength
        if (atrribute.full_property_p) {
            strength += (atrribute.full_property_p ?? 0) * GetHeroStr(unitHandle, false);
            agility += (atrribute.full_property_p ?? 0) * GetHeroAgi(unitHandle, false);
            intelligence += (atrribute.full_property_p ?? 0) * GetHeroInt(unitHandle, false);
        }
        //
        if (atrribute.strength) {
            strength += atrribute.strength
        }
        if (atrribute.strength_p) {
            let base = GetHeroStr(unitHandle, false);
            let val = (atrribute.strength_p ?? 0) * base
            strength += val
        }
        if (atrribute.agility) {
            agility += atrribute.agility
        }
        if (atrribute.agility_p) {
            let base = GetHeroAgi(unitHandle, false);
            let val = (atrribute.agility_p ?? 0) * base
            agility += val
        }
        if (atrribute.intelligence) {
            intelligence += atrribute.intelligence
        }
        if (atrribute.intelligence_p) {
            let base = GetHeroInt(unitHandle, false);
            let val = (atrribute.intelligence_p ?? 0) * base
            intelligence += val
        }

        UnitUtil.setExtraStrAgiInt(unitHandle, "_SLA_StrAgiInt", strength, agility, intelligence);

    }


}
