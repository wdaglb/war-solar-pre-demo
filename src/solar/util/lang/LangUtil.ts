/**
 * 编程语言工具
 */
export default class LangUtil {

    /**
     * 判断是否是数字
     * @param obj
     */
    static isNumber(obj: any) {
        if (typeof obj == "number") {
            return true;
        }
    }

    /**
     * 判断是否是字符串
     * @param obj
     */
    static isString(obj: any) {
        if (typeof obj == "string") {
            return true;
        }
    }


    /**
     * 判断是否是函数
     * @param obj
     */
    static isFunction(obj: any) {
        if (typeof obj == "function") {
            return true;
        }
    }

    /**
     * 判断是否是对象
     * @param obj
     */
    static isObject(obj: any) {
        if (typeof obj == "object") {
            return true;
        }
    }

    // static isTable(obj: any) {
    //     if (typeof obj == "table") {
    //         return true;
    //     }
    // }
    //
    // static isUserData(obj: any) {
    //     if (typeof obj == "userdata") {
    //         return true;
    //     }
    // }
}