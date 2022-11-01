/**
 * 太阳自定义值清理类
 *
 * 由于自定义值是绑定在handle上的  handle会重用 所以在handle重用前 要清理自定义值
 *
 */
import DataBase from "../common/DataBase";
import SingletonUtil from "../util/lang/SingletonUtil";
import BaseUtil from "../util/BaseUtil";

export default class SolarDataClearState {

    constructor(delay: number = 5) {
        if (SingletonUtil.notFirstTime(SolarDataClearState)) {
            print("不能重复new SolarDataClearState()")
            return;
        }


        se.unitDeath(whichUnit => {
            handle_ref(whichUnit)//防止单位死亡或其他方式导致handle被重用
            BaseUtil.runLater(delay, () => {
                DataBase.clearUnitSolarData(whichUnit)
                handle_unref(whichUnit)
                RemoveUnit(whichUnit);
            })
        });//
    }


    /**
     * 清理数据 当移除handle时
     */
    static _sl_hookClearHandle() {
        //
        let jassRemoveUnit = RemoveUnit;
        _G.RemoveUnit = function (this: void, whichUnit: unit): void {
            DataBase.clearUnitSolarData(whichUnit)
            jassRemoveUnit(whichUnit)
        }
        //
        let jassRemoveItem = RemoveItem;
        _G.RemoveItem = function (this: void, whichItem: item): void {
            DataBase.clearItemSolarData(whichItem)
            jassRemoveItem(whichItem)
        }
    }


}