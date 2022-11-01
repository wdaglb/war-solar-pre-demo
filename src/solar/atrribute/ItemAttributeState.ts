import {Trigger} from "solar/w3ts/handles/trigger";
import BaseUtil from "solar/util/BaseUtil";
import DataBase from "../common/DataBase";
import AttributeUtil from "solar/util/system/AttributeUtil";
import UnitAttributeState from "./UnitAttributeState";
import SelectUtil from "solar/util/unit/SelectUtil";
import SingletonUtil from "../util/lang/SingletonUtil";

/**
 * 物品属性系统
 *
 * 将物品的属性附加到单位身上
 */
export default class ItemAttributeState {
    static config: { [id: string]: SolarAtrribute } = {}

    constructor() {
        if (SingletonUtil.notFirstTime(ItemAttributeState)) {
            print("不能重复new ItemAttributeState()")
            return;
        }
        //根据实时事件 及时刷新
        let trigger = new Trigger()
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM)
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM)
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_PAWN_ITEM)
        trigger.addAction(() => {
            let unitHandle = GetTriggerUnit()
            //不要在此触发直接判断 因为丢弃物品触发执行时 物品还在物品栏里
            BaseUtil.runLater(0.1, () => {
                ItemAttributeState.refreshItemAtrributes2UnitSolarAtrribute(unitHandle)
            })
        })
        //循环 对每个单位 进行刷新属性
        let triggerTimer = new Trigger()
        //5秒刷新一次
        triggerTimer.registerTimerEvent(5.89, true)
        triggerTimer.addAction(() => {
            SelectUtil.forAllUnits(u => {
                ItemAttributeState.refreshItemAtrributes2UnitSolarAtrribute(u);
            })
        })
    }


    /**
     * 统计单位携带的物品的 总属性值
     * @param unitHandle
     */
    static getItemsAtrributes(unitHandle: unit): SolarAtrribute[] {
        //统计装备总计数值
        let itemAtrributes: SolarAtrribute[] = null;
        for (let i = 0; i < 6; i++) {
            let itemHandle = UnitItemInSlot(unitHandle, i);
            if (!IsHandle(itemHandle)) {
                continue
            }
            if (!itemAtrributes) {
                itemAtrributes = [];
            }
            let itemTypeId = GetItemTypeId(itemHandle)
            let itemTypeIdStr = id2string(itemTypeId);
            //solarData 数据
            let itemAtrribute: SolarAtrribute = AttributeUtil.getItemAttribute(itemHandle);
            if (itemAtrribute) {
                itemAtrributes.push(itemAtrribute)
            }
            //type 数据
            let configItemAtrribute = ItemAttributeState.config[itemTypeIdStr];
            if (configItemAtrribute) {
                itemAtrributes.push(configItemAtrribute)
            }
        }

        //计算数值

        return itemAtrributes;
    }

    /**
     * 刷新单位携带的物品的属性值 附加到 单位属性中
     * @param unitHandle
     */
    static refreshItemAtrributes2UnitSolarAtrribute(unitHandle: unit) {
        let itemAtrributes: AppAttribute[] = ItemAttributeState.getItemsAtrributes(unitHandle);
        let unitOldItemSAttr: AppAttribute = DataBase.getUnitSolarData(unitHandle, false)?._SL_totalItemsSolarAtrribute;
        if (unitOldItemSAttr == null) {//如果之前没有旧物品属性 则退出后续逻辑  否则还需将之前的旧属性 移除
            if (itemAtrributes == null || itemAtrributes.length == 0) {
                return
            }
        }
        let totalAtrribute: SolarAtrribute = AttributeUtil.sumAtrributes(itemAtrributes);

        /**
         dmg system
         */
        let solarData = DataBase.getUnitSolarData(unitHandle);
        if (!solarData._SL_solarAtrribute) {
            solarData._SL_solarAtrribute = {}
        }

        AttributeUtil.subtract(solarData._SL_solarAtrribute, unitOldItemSAttr);
        AttributeUtil.add(solarData._SL_solarAtrribute, totalAtrribute);

        solarData._SL_totalItemsSolarAtrribute = totalAtrribute;
        //发送属性改变事件
        UnitAttributeState.refreshUnitSolarAtrribute(unitHandle)
    }


}
