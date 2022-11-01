/**
 * 单位事件 里的常用函数集合
 */
import DataBase from "solar/common/DataBase";
import {Unit} from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";

export default class UnitEvent {

    static instance = new UnitEvent();

    protected constructor() {

    }


    /**
     * 获得触发单位(handle)
     */
    get trigUnit(): unit {
        return GetTriggerUnit();
    }

    /**
     * 获得触发单位(包装对象)
     */
    get trigUnitObj(): Unit {
        return Unit.fromHandle(GetTriggerUnit());
    }

    /**
     * 获得触发单位自定义值
     */
    get trigUnitSolarData(): AppUnitData {
        return DataBase.getUnitSolarData(GetTriggerUnit());
    }

    get trigUnitAttribute(): AppAttribute {
        return AttributeUtil.getUnitAttribute(GetTriggerUnit());
    }

    /**
     * 获得触发单位类型的自定义值
     */
    get trigUnitTypeSolarData(): AppUnitTypeData {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetTriggerUnit())));
    }

    get trigUnitX(): number {
        return GetUnitX(GetTriggerUnit());
    }

    get trigUnitY(): number {
        return GetUnitY(GetTriggerUnit());
    }

    get trigUnitFacing(): number {
        return GetUnitFacing(GetTriggerUnit());
    }

    /**
     * 触发单位所属玩家
     */
    get trigUnitOwner(): player {
        return GetOwningPlayer(GetTriggerUnit());
    }

    get trigUnitOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(GetTriggerUnit()));
    }


}