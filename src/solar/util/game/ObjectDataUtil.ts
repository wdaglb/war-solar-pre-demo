/**
 * 获取物遍slk数据
 */
export default class ObjectDataUtil {

    /**
     * 获取单位数字数据
     * @param objIdStr
     * @param property
     */
    static getUnitDataNumber(objIdStr: string, property: string): number {
        return tonumber(this.getItemDataString(objIdStr, property))
    }

    /**
     * 获取单位字符串数据
     * @param objIdStr
     * @param property
     */
    static getUnitDataString(objIdStr: string, property: string): string {
        let obj = unit[objIdStr];
        return obj[property + "1"] ?? obj[property]
    }

    /**
     * 获取物品数字数据
     * @param objIdStr
     * @param property
     */
    static getItemDataNumber(objIdStr: string, property: string): number {
        return tonumber(this.getItemDataString(objIdStr, property))
    }

    /**
     * 获取物品字符串数据
     * @param objIdStr
     * @param property
     */
    static getItemDataString(objIdStr: string, property: string): string {
        let obj = item[objIdStr];
        return obj[property + "1"] ?? obj[property]
    }

    /**
     * 获取技能数字数据
     * @param objIdStr
     * @param property
     */
    static getAbilityDataNumber(objIdStr: string, property: string): number {
        return tonumber(this.getAbilityDataString(objIdStr, property))
    }

    /**
     * 获取技能字符串数据
     * @param objIdStr
     * @param property
     */
    static getAbilityDataString(objIdStr: string, property: string): string {
        let obj = ability[objIdStr];
        return obj[property + "1"] ?? obj[property]
    }


}


