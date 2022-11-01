/** @noSelf **/

export default class ItemUtil {
    private static _temp_callBack = null;
    private static _SL_EnumItemsInRectFunc = () => {
        ItemUtil._temp_callBack(GetEnumItem());
    }

    /**
     * 选取矩形区域内的物品做动作
     * @param r
     * @param callBack
     */
    static forItemsInRect(r: rect, callBack: (item: item) => void) {
        if (ItemUtil._temp_callBack != null) {//已在使用中
            log.errorWithTraceBack("不能在此函数回调参数里 再使用此函数!")
            return
        }
        ItemUtil._temp_callBack = callBack;
        //使用命名函数 减少闭包交互
        EnumItemsInRect(r, null, ItemUtil._SL_EnumItemsInRectFunc)
        ItemUtil._temp_callBack = null;//空闲状态
    }

    /**
     * 设置物品提示
     * @param itemcode
     * @param value
     */
    static setItemTip(itemcode: number | string, value: string) {
        EXSetItemDataString(itemcode, 4, value)
    }

    /**
     * 设置物品扩展提示
     * @param itemcode
     * @param value
     */
    static setItemUbertip(itemcode: number | string, value: string) {
        EXSetItemDataString(itemcode, 3, value)
    }

    /**
     * 设置物品图标
     * @param itemcode
     * @param value
     */
    static setItemArt(itemcode: number | string, value: string) {
        EXSetItemDataString(itemcode, 1, value)
    }

    /**
     * 单位是否拥有装备
     */
    static isUnitHasItem(udw: unit, otid: number | string): boolean {
        if (typeof otid === 'string') { otid = FourCC(otid) }
        for (let index = 0; index < 6; index++) {
            let wpid = GetItemTypeId(UnitItemInSlot(udw, index))
            if (wpid == otid) {
                return true
            }
        }
        return false
    }

    /**
     * 单位是否拥有物品数组中所有物品
     */
    static isUnitItemArrayAll(udw: unit, itAy: number[] | string[]): boolean {
        for (const iterator of itAy) {
            if (!ItemUtil.isUnitHasItem(udw, iterator)) {
                return false
            }
        }
        return true
    }
    /**
     * 获取物品栏首个物品
     * @param callback
     */
    static getFirstItemFromUnit(unit: unit): item {
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i)
            if (IsHandle(item)) {
                return item;
            }
        }
        return null;
    }

    /**
     * 获取所有物品
     * @param callback
     */
    static getAllItemFromUnit(unit: unit): item[] {
        let items: item[] = []
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i)
            items[i] = item;
        }
        return items;
    }

    /**
     * 遍历玩家 盟友的玩家组 包括判断的玩家自身
     * @param unit
     */
    static getItemAndChargesFromUnit(unit: unit): { [id: string]: number } {
        let items: { [id: string]: number } = {}
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i)
            let itemTypeStr = id2string(GetItemTypeId(item))
            let itemCharges = GetItemCharges(item);
            if (!itemCharges || itemCharges < 1) {
                itemCharges = 1;
            }
            //添加值
            let oldCharges = items[itemTypeStr]
            if (!oldCharges) {
                oldCharges = 0;
            }
            items[itemTypeStr] = oldCharges + itemCharges
        }
        return items;
    }

    /**
     * 消耗玩家拥有的物品类型的物品使用次数
     * @param unit
     * @param itemId
     * @param charges
     */
    static costItemChargesFromUnit(unit: unit, itemId: number, charges: number): number {
        let costCharges = 0//已经消耗的次数
        let needCostCharges = 0 //还需要消耗的次数
        for (let i = 0; i < 6; i++) {
            needCostCharges = charges - costCharges
            if (costCharges >= charges) {
                return costCharges
            }
            let item = UnitItemInSlot(unit, i)
            if (GetItemTypeId(item) != itemId) {
                continue
            }

            let itemCharges = GetItemCharges(item);
            if (!itemCharges || itemCharges < 1) {
                itemCharges = 1;
            }
            //消耗值
            if (itemCharges <= needCostCharges) {
                costCharges = costCharges + itemCharges
                RemoveItem(item)
            } else if (itemCharges > needCostCharges) {
                costCharges = costCharges + needCostCharges
                SetItemCharges(item, itemCharges - needCostCharges)
            }
        }
        return costCharges;
    }


}
