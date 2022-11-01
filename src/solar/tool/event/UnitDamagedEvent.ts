/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import {Unit} from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";

export default class UnitDamagedEvent extends UnitEvent {

    static instance: UnitDamagedEvent = new UnitDamagedEvent();

    protected constructor() {
        super();
    }

    /**
     * 伤害值
     */
    get damage(): number {
        return GetEventDamage();
    }

    /**
     * 伤害来源单位
     */
    get damageSource(): unit {
        return GetEventDamageSource();
    }

    /**
     * 伤害来源单位(包装对象)
     */
    get damageSourceObj(): Unit {
        return Unit.fromHandle(GetEventDamageSource());
    }

    /**
     * 获得单位自定义值
     */
    get damageSourceSolarData(): AppUnitData {
        return DataBase.getUnitSolarData(GetEventDamageSource());
    }

    /**
     * 获得单位属性
     */
    get damageSourceAttribute(): AppAttribute {
        return AttributeUtil.getUnitAttribute(GetEventDamageSource());
    }

    /**
     * 获得单位类型的自定义值
     */
    get damageSourceTypeSolarData(): AppUnitTypeData {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetEventDamageSource())));
    }

    get damageSourceX(): number {
        return GetUnitX(GetEventDamageSource());
    }

    get damageSourceY(): number {
        return GetUnitY(GetEventDamageSource());
    }

    get damageSourceFacing(): number {
        return GetUnitFacing(GetEventDamageSource());
    }

    /**
     * 伤害来源所属玩家
     */
    get damageSourceOwner(): player {
        return GetOwningPlayer(GetEventDamageSource());
    }

    get damageSourceOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(GetEventDamageSource()));
    }
}