/**
 * 数据库
 * 任意数据都可以放到数据库来管理
 */
export default class DataBase {
    private static idStrHandleMap: { [hIdStr: string]: handle } = {}
    private static dataBaseContext: { [type: string]: { [id: string]: AppData } } = {}

    /**
     * base
     * @param type
     * @param handle
     */
    public static getDataByHandle(type: string, handle: handle, createDefault = true): AppData {
        if (!IsHandle(handle)) {
            log.errorWithTraceBack("DataBase.getData():" + type + ":你传的handle为空或0！")
            return null;
        }
        return DataBase.getDataByTypeId(type, tostring(GetHandleId(handle)), createDefault);
    }


    /**
     * 获取一个类型的所有数据
     * @param type
     */
    public static getTypeData(type: string): { [id: string]: AppData } {
        return DataBase.dataBaseContext[type]
    }

    /**
     * 遍历一个类型的所有数据
     * @param type
     * @param callBack
     */
    public static forTypeDatas(type: string, callBack: (id: string, solarData: AppData) => void) {
        let typeData = DataBase.dataBaseContext[type];
        if (typeData) {
            for (let id in typeData) {
                callBack(id, typeData[id])
            }
        }
    }

    /**
     * 基础的获取数据的方式
     * @param type 类型
     * @param id 数据id
     * @param createDefault 如之前未设置data 则可以返回一个默认的空对象 以供使用
     */
    public static getDataByTypeId(type: string, id: string, createDefault = true): AppData {
        let typeData = DataBase.dataBaseContext[type]
        if (typeData == null && createDefault) {
            typeData = {};
            DataBase.dataBaseContext[type] = typeData;
        }
        if (typeData == null) {
            return null;
        }
        let data = typeData[id]
        if (!data && createDefault) {
            data = {}
            typeData[id] = data
        }
        return data;
    }

    public static setDataByHandle(type: string, handle: handle, obj: any): void {
        if (!IsHandle(handle)) {
            let tb = debug.traceback();
            log.error("DataBase.setData():" + type + ":你传的handle为空或0！")
            log.error(tb)
            return null;
        }
        return DataBase.setDataByTypeId(type, tostring(GetHandleId(handle)), obj);
    }

    /**
     * 基础的设置数据的方式
     * @param type
     * @param id
     * @param obj
     */
    public static setDataByTypeId(type: string, id: string, obj: any): void {
        let typeData = DataBase.dataBaseContext[type]
        if (typeData == null && obj != null) {
            typeData = {};
            DataBase.dataBaseContext[type] = typeData;
        }
        if (obj == null && typeData?.[id] == null) {
            //如果有才清空 没有就不要设置一个key为null了
            return
        }
        typeData[id] = obj
    }

    public static clearDataByHandle(type: string, handle: handle): any {
        if (!IsHandle(handle)) {
            let tb = debug.traceback();
            log.error("DataBase.clearData():" + type + ":你传的handle为空或0！")
            log.error(tb)
            return null;
        }
        DataBase.setDataByTypeId(type, tostring(GetHandleId(handle)), null)
    }

    /**
     * addons Obj Type
     */
    public static getUnitTypeSolarData(id: string, createDefault = true): AppUnitTypeData {
        return DataBase.getDataByTypeId("_SL_UnitType", id, createDefault);
    }

    public static setUnitTypeSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_UnitType", id, obj);
    }

    public static getItemTypeSolarData(id: string, createDefault = true): AppItemTypeData {
        return DataBase.getDataByTypeId("_SL_ItemType", id, createDefault);
    }

    public static setItemTypeSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_ItemType", id, obj);
    }

    public static getAbilityTypeSolarData(id: string, createDefault = true): AppAbilityTypeData {
        return DataBase.getDataByTypeId("_SL_AbilityType", id, createDefault);
    }

    public static setAbilityTypeSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_AbilityType", id, obj);
    }

    /**
     * Solar Buff Type
     * 存储太阳增益效果类型
     */
    public static getSolarBuffType(sBuffTypeId: string): AppBuffType {
        return DataBase.getDataByTypeId("_SL_SolarBuffType", sBuffTypeId, false) as AppBuffType;
    }

    public static setSolarBuffType(sBuffTypeId: string, appBuffType: AppBuffType) {
        DataBase.setDataByTypeId("_SL_SolarBuffType", sBuffTypeId, appBuffType);
    }

    public static forSolarBuffTypes(callBack: (sBuffTypeId: string, appBuffType: AppBuffType) => void) {
        let typeData = DataBase.dataBaseContext["_SL_SolarBuffType"];
        if (typeData) {
            for (let id in typeData) {
                callBack(id, typeData[id] as AppBuffType)
            }
        }
    }

    /**
     * 获取太阳buff的自定义值
     * @param id
     * @param createDefault
     */
    public static getSolarBuffSolarData(id: string, createDefault = true): AppSolarBuffData {
        return DataBase.getDataByTypeId("_SL_SolarBuff", id, createDefault);
    }

    public static setSolarBuffSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_SolarBuff", id, obj);
    }

    public static forSolarBuffSolarData(callBack: (id: string, solarData: AppSolarBuffData) => void) {
        DataBase.forTypeDatas("_SL_SolarBuff", callBack);
    }

    /**
     * addons Handle
     */
    public static getUnitSolarData(handle: unit, createDefault = true): AppUnitData {
        return DataBase.getDataByHandle("+w3u", handle, createDefault)
    }

    public static clearUnitSolarData(handle: unit) {
        DataBase.clearDataByHandle("+w3u", handle)
    }

    /**
     * 遍历所有单位的 solarData
     * @param handle
     * @param callBack
     */
    public static forUnitSolarDatas(callBack: (unit: unit, solarData: AppUnitData) => void) {
        let typeData = DataBase.dataBaseContext["+w3u"];
        if (typeData) {
            for (let id in typeData) {
                let handle = DataBase.idStrHandleMap[id];
                if (handle == null) {
                    handle = i2h(tonumber(id));
                    DataBase.idStrHandleMap[id] = handle;
                }
                callBack(handle as unit, typeData[id])
            }
        }
    }

    public static getItemSolarData(handle: item, createDefault = true): AppItemData {
        return DataBase.getDataByHandle("item", handle, createDefault)
    }

    public static clearItemSolarData(handle: item) {
        DataBase.clearDataByHandle("item", handle)
    }

    public static getDialogButtonSolarData(handle: button): AppData {
        return DataBase.getDataByHandle("+dlb", handle)
    }

    public static clearDialogButtonSolarData(handle: button) {
        DataBase.clearDataByHandle("+dlb", handle)
    }

    public static getPlayerSolarData(handle: player, createDefault = true): AppPlayerData {
        return DataBase.getDataByHandle("+ply", handle, createDefault)
    }

    public static clearPlayerSolarData(handle: player) {
        DataBase.clearDataByHandle("+ply", handle)
    }


    /**获取单位的 solar data */
    public static sd(handle: unit, createDefault?: boolean): AppUnitData;
    /**获取物品的 solar data */
    public static sd(handle: item, createDefault?: boolean): AppItemData;
    /**获取玩家的 solar data */
    public static sd(handle: player, createDefault?: boolean): AppPlayerData;
    /**获取按钮的 solar data */
    public static sd(handle: button, createDefault?: boolean): AppData;
    /**获取handle的 solar data */
    public static sd(handle: any, createDefault = true): any {
        if (!IsHandle(handle)) {
            log.errorWithTraceBack("sd:你传的handle为空或0！")
            return null;
        }
        let type = handledef(handle)?.type;
        if (!type) {
            log.errorWithTraceBack("sd:" + type + ":你传的handle类型不存在！")
            return null;
        }
        return DataBase.getDataByHandle(type, handle, createDefault)
    }


}

/**
 * 使用缩写开发
 */
declare global {
    let db: typeof DataBase
    /**获取handle的 solar data */
    let sd: typeof DataBase.sd
}