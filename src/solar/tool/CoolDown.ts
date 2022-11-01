import BaseUtil from "solar/util/BaseUtil";

/**
 * 冷却时间
 */
export default class CoolDown {
    cool: number;
    lastWorkTime: number = -1000000;


    /**
     *
     * @param cool = 冷却时间
     */
    constructor(cool: number) {
        this.cool = cool;
    }


    /**
     * 判断是否已冷却完毕
     * @param doWork 如果为true 则冷却完毕时马上再次进入冷却状态
     */
    isReady(doWork = true): boolean {
        let r = (BaseUtil.getGameTime() - this.lastWorkTime) > this.cool
        if (r && doWork) {
            this.lastWorkTime = BaseUtil.getGameTime();
        }
        return r;
    }

    /**
     * 判断是否已冷却完毕
     * 如果冷却完毕则执行回调
     */
    ifReady(callBack: () => void): void {
        if (this.isReady()) {
            callBack();
        }
    }


}