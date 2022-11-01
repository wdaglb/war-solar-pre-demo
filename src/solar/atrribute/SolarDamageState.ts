import {Trigger} from "solar/w3ts/handles/trigger"
import AttributeUtil from "solar/util/system/AttributeUtil";
import MathUtil from "solar/util/math/MathUtil";
import SingletonUtil from "../util/lang/SingletonUtil";


/**
 * 太阳伤害系统
 * 可配置config.damageEventHandlers 以自行处理伤害事件
 */

export default class SolarDamageState {

    static config: {
        /**
         * 伤害处理器
         * 按数组先后顺序执行
         * @param event
         */
        damageEventHandlers: ((event: AppDamageEvent) => void)[]
    } = {
        damageEventHandlers: []
    }


    /**
     * 添加伤害处理器
     * @param eventHandler
     */
    static addEventHandler(eventHandler: (event: AppDamageEvent) => void) {
        SolarDamageState.config.damageEventHandlers.push(eventHandler);
    }


    constructor(useBaseAttribute = true) {
        if (SingletonUtil.notFirstTime(SolarDamageState)) {
            print("不能重复new SolarDamageState()")
            return;
        }
        if (useBaseAttribute) {
            //计算基础的属性伤害
            SolarDamageState.addEventHandler(SolarDamageState.calculateAttributeDamage);
        }
        isSolarDamageEnable = true;
        let trigger = new Trigger();
        trigger.registerAnyUnitDamagedEvent();
        trigger.addAction(this.action);
    }


    action(this: void) {
        let eventDamage = GetEventDamage()
        //判断伤害值
        if (eventDamage <= 0) {
            return
        }
        //设置变量
        let unit0 = GetTriggerUnit()
        let unit1 = GetEventDamageSource()
        //判断相关条件
        if (!IsHandle(unit1)) {
            return;
        }
        if (IsUnitAlly(unit0, GetOwningPlayer(unit1))) {
            return
        }
        let isAttack = (0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK));
        if (isBigAttributeMode) {//大属性模式下 走自己的伤害算法
            let u1Attack = GetUnitState(unit1, UnitStateDamageMax);//攻击力
            let u0Armor = GetUnitState(unit0, UnitStateArmor);//受到攻击者的 护甲
            eventDamage = u1Attack * (1 - MathUtil.armorReduction(u0Armor))
            EXSetEventDamage(eventDamage);
        }
        if (!isSolarDamageEnable) {//防止重复死循环触发伤害事件 即在本伤害事件中造成的伤害 不再进入此触发
            return;
        }

        // 需要单位用户数据（全部为实数类型 1  = 100%）

        let u0sa: AppAttribute = AttributeUtil.getUnitAttribute(unit0);
        let u1sa: AppAttribute = AttributeUtil.getUnitAttribute(unit1);
        // if (u0sa == null && u1sa == null) {//没有自定义属性数据的不进入伤害系统
        //     return;
        // }


        //封装太阳伤害事件
        let event: AppDamageEvent = {
            baseDamage: eventDamage,
            damageType: EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE),
            weaponType: EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE),
            unit0: unit0,
            unit1: unit1,
            u0sa: u0sa,
            u1sa: u1sa,
            //
            isAttack: isAttack,
            isRanged: (0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED)),
            isPhysical: (0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL)),
            isCritical: false,
            resultDamage: eventDamage,
        }

        //对太阳伤害事件 执行处理
        isSolarDamageEnable = false;
        for (let damageEventHandler of SolarDamageState.config.damageEventHandlers) {
            damageEventHandler(event);
            if (event.consumed) {//已处理完毕 退出后续处理逻辑
                isSolarDamageEnable = true;
                return;
            }
        }
        isSolarDamageEnable = true;

        // 设置伤害值
        EXSetEventDamage(event.resultDamage);

    }


    /**
     * 计算太阳基础属性伤害
     * @param event
     */
    static calculateAttributeDamage(event: SolarDamageEvent): void {
        // 判断伤害类型(计算物理法术增伤与暴击伤害)
        let newResultDamage = event.resultDamage;
        if (event.isPhysical) {
            // ////物理增伤
            newResultDamage = newResultDamage * ((event.u1sa?.physical_damage_increased ?? 0) + 1)
            // ////物理暴击
            if ((GetRandomReal(0, 1) < (event.u1sa?.physical_critical_chance ?? 0))) {
                //Critical damage 暴击伤害  1 = 增加100%伤害
                newResultDamage = newResultDamage * ((event.u1sa?.physical_critical_damage ?? 0) + 1);
                event.isCritical = true;
            }
        } else {
            // 法术增伤
            newResultDamage *= ((event.u1sa?.magic_damage_increased ?? 0) + 1)
            // 判断暴击
            if ((GetRandomReal(0, 1) < (event.u1sa?.magic_critical_chance ?? 0))) {
                //Critical damage 暴击伤害
                newResultDamage = newResultDamage * ((event.u1sa?.magic_critical_damage ?? 0) + 1)
                event.isCritical = true;
            }
        }
        /**
         * 根据伤害类型 增伤
         */
        let damage_increased_dt_x = "damage_increased_dt_" + event.damageType
        if (event.u1sa?.[damage_increased_dt_x]) {
            newResultDamage *= (1 + (event.u1sa[damage_increased_dt_x] as number))
        }

        /**
         * 最终增伤
         */
        newResultDamage = newResultDamage * ((event.u1sa?.damage_increased ?? 0) + 1)


        /**
         *  计算 受到伤害的单位 的 属性 减免伤害 u0sa
         *  伤害减免Damage Reduction
         */
        if (event.u0sa?.damage_reduction) {
            newResultDamage = newResultDamage * (1 - event.u0sa.damage_reduction)
        }

        /**
         * 根据伤害类型 抗性 减伤
         */
        let damage_reduction_dt_x = "damage_reduction_dt_" + event.damageType
        if (event.u0sa?.[damage_reduction_dt_x]) {
            newResultDamage *= (1 + (event.u0sa[damage_reduction_dt_x] as number))
        }


        /**
         *  吸血
         */
        if (event.u1sa?.blood_sucking) {
            let add_hp = newResultDamage * event.u1sa.blood_sucking
            SetUnitState(event.unit1, UNIT_STATE_LIFE, Math.max(0, GetUnitState(event.unit1, UNIT_STATE_LIFE) + add_hp))
        }

        //
        event.resultDamage = newResultDamage
    }


}