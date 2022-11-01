import {STimer} from "../tool/STimer";

time = 0;
/** @noSelf **/
export default class BaseUtil {

    private static uuid: number = 1

    /**
     * 获取唯一id
     */
    static getUUID(): number {
        BaseUtil.uuid++;
        return BaseUtil.uuid
    }

    /**
     *遍历单位组
     *遍历完后会移除单位组的所有单位
     * @deprecated see GroupUtil.for
     */
    static SForGroup(whichGroup: group, callback: (unit: unit) => void) {
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(whichGroup)
            if (!IsHandle(unitHandle)) {
                break
            }
            callback(unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
        }
    }

    /**
     * 中心计时器执行回调函数
     * @param timeOut 延迟的时间 （单位：秒 精度为小数点后2位 0.01）
     * callBack 返回true 代表继续执行 返回false 代表不再执行
     * (count 为执行次数)
     * 常用质数： 3 5 7 9 (11,2)
     * (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)
     * @param onTimerCall
     */
    static onTimer(timeOut: number, onTimerCall: (count: number) => boolean): STimer {
        let sTimer = new STimer();
        let count = 0;
        let callBack = function (this: void) {
            count++;
            let repeat = onTimerCall(count);
            if (!repeat) {
                sTimer.destroy();
            }
        }
        sTimer.start(timeOut, callBack, true)
        return sTimer;
    }

    /**
     *
     * @param timeOut 延迟的时间 （单位：秒）
     * @param callBack
     * @param loopCount
     */
    static runLater(timeOut: number, callBack: (this: void) => void, loopCount: number = 1): STimer {
        let sTimer = new STimer();
        sTimer.setLoopCount(loopCount);
        sTimer.start(timeOut, callBack)
        return sTimer;
    }

    /**
     *  基础中心计时器
     */
    static centerTimer: timer = null;
    //毫秒计算
    /**
     * @deprecated see 全局变量 time
     */
    static time = 0;


    private static _sl_OnTime(this: void) {
        time += 10;
        BaseUtil.time = time;
        STimer._sl_OnTime()
    }

    //返回秒
    static getGameTime(): number {
        return time / 1000;
    }

    static init() {
        //不推荐的函数 在必须使用时 可以使用 （少量使用下不会出现问题）
        BaseUtil.centerTimer = CreateTimer();
        TimerStart(BaseUtil.centerTimer, 0.01, true, BaseUtil._sl_OnTime);
    }

}

