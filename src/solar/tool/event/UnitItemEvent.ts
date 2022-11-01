/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import AttributeUtil from "../../util/system/AttributeUtil";
import {Unit} from "../../w3ts/handles/unit";
import {Item} from "../../w3ts/handles/item";

export default class UnitItemEvent extends UnitEvent {

    static instance = new UnitItemEvent();

    protected constructor() {
        super();
    }


    /**
     * 被操作的物品(handle)
     */
    get manipulatedItem(): item {
        return GetManipulatedItem();
    }

    /**
     * 被操作的物品(包装对象)
     */
    get manipulatedItemObj(): Item {
        return Item.fromHandle(GetManipulatedItem());
    }

    /**
     * 被操作的物品
     */
    get manipulatedItemSolarData(): AppItemData {
        return DataBase.getItemSolarData(GetManipulatedItem());
    }

    get manipulatedItemTypeSolarData(): AppItemTypeData {
        return DataBase.getItemTypeSolarData(id2string(GetItemTypeId(GetManipulatedItem())));
    }

    get manipulatedItemAttribute(): AppAttribute {
        return AttributeUtil.getItemAttribute(GetManipulatedItem());
    }


}