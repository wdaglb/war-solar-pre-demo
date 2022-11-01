import DataBase from "solar/common/DataBase";
/**
 * 属性与SolarData的区别为:
 * 属性(Attribute)本质也是存放在SolarData里 属性主要额外提供了可在单位携带物品或buff等时会自动计算总属性值。
 * 通常与战斗相关的伤害词条或携带物品、buff等需要叠加到单位身上的可选择存放在属性里
 *
 * 其他不需要叠加到单位的值可存在SolarData 如玩家杀敌数 单位伤害总计 英雄的职业 物品的归类
 */
export default class AttributeUtil {

    /**
     * 获取属性
     * 如果属性为空则返回null
     * (取值时可使用?.安全访问 与??使用默认值)
     * @param unitHandle
     * @param createDefault 是否在属性对象对象为空时默认创建一个属性对象对象
     */
    static getUnitAttribute(unitHandle: unit, createDefault = false): AppAttribute | null {
        let solarData = db.getUnitSolarData(unitHandle, createDefault);
        if (createDefault && !solarData._SL_solarAtrribute) {
            solarData._SL_solarAtrribute = {}
        }
        return solarData?._SL_solarAtrribute;
    }

    /**
     * 获取物品的属性
     * @param itemHandle
     * @param createDefault 是否在属性对象对象为空时默认创建一个属性对象对象
     */
    static getItemAttribute(itemHandle: item, createDefault = false): AppAttribute | null {
        let solarData = db.getItemSolarData(itemHandle, createDefault);
        if (createDefault && !solarData._SL_solarAtrribute) {
            solarData._SL_solarAtrribute = {}
        }
        return solarData?._SL_solarAtrribute;
    }

    /**
     * 获取玩家属性
     * @param playerHandle
     * @param createDefault
     */
    static getPlayerAttribute(playerHandle: player, createDefault = false): AppAttribute | null {
        let solarData = db.getPlayerSolarData(playerHandle, createDefault);
        if (createDefault && !solarData._SL_solarAtrribute) {
            solarData._SL_solarAtrribute = {}
        }
        return solarData?._SL_solarAtrribute;
    }


    /**
     * 设置所有属性
     * @param Handle
     * @param allowCover = 允许覆盖旧的属性 (不确定的时候不要覆盖旧属性 以免引起属性增减出错)
     */
    static setPlayerAttribute(playerHandle: player, atrribute: AppAttribute, allowCover = false): AppAttribute {
        let solarData = db.getPlayerSolarData(playerHandle);
        let oldAtrribute = solarData._SL_solarAtrribute;
        if (oldAtrribute && !allowCover) {
            log.errorWithTraceBack("此玩家已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!")
            return oldAtrribute;
        }
        solarData._SL_solarAtrribute = atrribute;
        return oldAtrribute;
    }

    /**
     * 设置单位所有属性
     * @param unitHandle
     * @param atrribute
     * @param allowCover 是否允许覆盖 若为false时 则不能为一个已有属性的单位重新设置全部属性
     */
    static setUnitAttribute(unitHandle: unit, atrribute: AppAttribute, allowCover = false): AppAttribute {
        let unitSolarData = db.getUnitSolarData(unitHandle);
        let oldAtrribute = unitSolarData._SL_solarAtrribute;
        if (oldAtrribute && !allowCover) {
            log.errorWithTraceBack("此单位已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!")
            return oldAtrribute;
        }
        unitSolarData._SL_solarAtrribute = atrribute;
        return oldAtrribute;
    }

    /**
     * 设置物品所有属性
     * @param itemHandle
     * @param atrribute
     * @param allowCover
     */
    static setItemAttribute(itemHandle: item, atrribute: AppAttribute, allowCover = false): AppAttribute {
        let solarData = db.getItemSolarData(itemHandle);
        let oldAtrribute = solarData._SL_solarAtrribute;
        if (oldAtrribute && !allowCover) {
            log.errorWithTraceBack("此物品已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!")
            return oldAtrribute;
        }
        solarData._SL_solarAtrribute = atrribute;
        return oldAtrribute;
    }

    /**
     * 循环地图上 所有有属性的单位
     */
    static forAllUnitsAttribute(callback: (unitHandle: unit, atrribute: AppAttribute) => void): void {
        DataBase.forUnitSolarDatas((u, solarData) => {
            let solarAtrribute = solarData?._SL_solarAtrribute;
            if (solarAtrribute) {
                callback(u, solarAtrribute)
            }
        });
    }

    /**
     * 统计属性集合的总值属性集合
     * @param atrributes
     */
    static sumAtrributes(atrributes: SolarAtrribute[]): AppAttribute {
        let result: SolarAtrribute = {}
        if (atrributes == null) {
            return result
        }
        for (let atrribute of atrributes) {
            for (let key in atrribute) {
                if (typeof atrribute[key] != "number") {
                    continue
                }
                if (!result[key]) {
                    result[key] = 0
                }
                result[key] = (result[key] as number) + (atrribute[key] as number)
            }

        }
        return result;
    }

    /**
     *  属性对象相加
     *  atrribute1 + atrribute2
     */
    static add(atrribute: SolarAtrribute, _atrribute: SolarAtrribute): void {
        if (!_atrribute) {
            return
        }
        for (let key in _atrribute) {
            if (typeof _atrribute[key] == "number") {
                atrribute[key] = (atrribute[key] as number ?? 0) + (_atrribute[key] as number)
            }
        }
    }

    /**
     *  属性对象相减
     *  atrribute1 - atrribute2
     */
    static subtract(atrribute: SolarAtrribute, _atrribute: SolarAtrribute): void {
        if (!_atrribute) {
            return
        }
        for (let key in _atrribute) {
            if (typeof _atrribute[key] == "number") {
                atrribute[key] = (atrribute[key] as number ?? 0) - (_atrribute[key] as number)
            }
        }
    }

    /**
     *  属性对象缩放
     *  atrribute * scale
     */
    static multiply(atrribute: SolarAtrribute, scale: number, store?: SolarAtrribute): AppAttribute {
        if (!atrribute) {
            return
        }
        if (store == null) {
            store = {...atrribute}
        }
        for (let key in atrribute) {
            if (typeof atrribute[key] == "number") {
                store[key] = (atrribute[key] as number ?? 0) * scale;
            }
        }
        return store;
    }

}