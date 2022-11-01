/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import {Unit} from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";

export default class UnitSpellEvent extends UnitEvent {

    static instance = new UnitSpellEvent();

    protected constructor() {
        super();
    }

    /**
     * 施法目标(handle)
     */
    get spellTargetUnit(): unit {
        return GetSpellTargetUnit();
    }

    /**
     * 施法目标(包装对象)
     */
    get spellTargetUnitObj(): Unit {
        return Unit.fromHandle(GetSpellTargetUnit());
    }

    get spellTargetUnitAttribute(): AppAttribute {
        return AttributeUtil.getUnitAttribute(GetSpellTargetUnit());
    }

    get spellTargetUnitX(): number {
        return GetUnitX(GetSpellTargetUnit());
    }

    get spellTargetUnitY(): number {
        return GetUnitY(GetSpellTargetUnit());
    }

    get spellTargetUnitFacing(): number {
        return GetUnitFacing(GetSpellTargetUnit());
    }

    /**
     * 施法目标单位所属玩家
     */
    get spellTargetUnitOwner(): player {
        return GetOwningPlayer(GetSpellTargetUnit());
    }

    get spellTargetUnitOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(GetSpellTargetUnit()));
    }
}