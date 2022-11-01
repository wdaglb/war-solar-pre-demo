/**
 * 太阳计时器
 */
/** @noSelfInFile **/
/** @noSelf **/
let index = 0;

export class STimer {


    private readonly uuid: number = index++;
    private _elapsed: number = 0;
    private interval: number = 0;
    private _callCount: number = 0;
    private loopCount: number = 1;
    private isPause: boolean = false;
    private _timeout: number = 0;
    private _isDestroy: boolean = false;
    private periodic: boolean = false;
    private lastUpdateTime: number = 0;
    private handlerFunc: (this: void, timer: STimer) => void = null;

    constructor() {

    }

    /**
     * 计时器经过的时间
     */
    public get elapsed(): number {
        return this._elapsed;
    }

    /**
     * 计时器剩余时间
     */
    public get remaining(): number {
        return this._timeout - this._elapsed;
    }

    setLoopCount(loopCount: number) {
        this.loopCount = loopCount;
    }

    //毫秒单位
    update() {
        if (this._isDestroy) {
            return
        }
        if (this.isPause) {
            return
        }
        let tpf = time - this.lastUpdateTime;
        //秒单位
        this._elapsed += tpf;
        this.interval += tpf;
        //计算间隔逻辑回调
        if (this.interval >= this._timeout) {
            this._callCount++;
            this.interval = 0;
            if (!this.periodic && this._callCount >= this.loopCount) {//不是循环的自动销毁
                this.destroy();
            } else {
                //加入下一次系统回调
                STimer._sl_addSTimer2TimeCallBack(this._timeout, this)
            }
            this.handlerFunc(this);
        }
        this.lastUpdateTime = time;
    }

    /**
     * 计时器
     */
    public get timeout(): number {
        return this._timeout;
    }

    public destroy() {
        this._isDestroy = true;
        return this;
    }

    /**
     * @deprecated 暂不支持
     */
    public pause() {
        this.isPause = true;
        return this;
    }

    /**
     * @deprecated 暂不支持
     */
    public resume() {
        this.isPause = false;
        return this;
    }

    /**
     * 启动计时器
     * @param timeoutS  （单位：秒 精度为小数点后2位 0.01）
     * @param handlerFunc
     * @param periodic
     */
    public start(timeoutS: number, handlerFunc: (this: void, timer: STimer) => void, periodic?: boolean) {
        this.handlerFunc = handlerFunc;
        if (periodic != null) {
            this.periodic = periodic;
        }
        if (timeoutS == 0) {
            handlerFunc(this)
            return this;
        }
        // 0.024秒 设置为 20ms
        this._timeout = Math.round(timeoutS * 100) * 10;
        //
        STimer._sl_addSTimer2TimeCallBack(this._timeout, this);
        //
        return this;
    }


    /**
     * 全局静态
     * 注意这个数据是异步的
     */
    private static timeCallBack: { [time: number]: STimer[] } = {};

    static _sl_getSTimerCount(): number {
        let count = 0;
        for (let timeCallBackKey in STimer.timeCallBack) {
            let callBackArray: STimer[] = STimer.timeCallBack[timeCallBackKey];
            if (callBackArray) {
                count += callBackArray.length;
            }
        }
        return count;
    }

    private static _sl_addSTimer2TimeCallBack(timeout: number, sTimer: STimer) {
        let callBackTime = time + timeout;
        let callBackArray: STimer[] = STimer.timeCallBack[callBackTime];
        if (callBackArray == null) {
            callBackArray = []
            STimer.timeCallBack[callBackTime] = callBackArray;
        }
        callBackArray.push(sTimer)
    }

    static _sl_OnTime(this: void) {
        let callBackArray = STimer.timeCallBack[time];
        if (callBackArray) {
            for (let callBackArrayElement of callBackArray) {
                callBackArrayElement.update();
            }
            //删除旧的
            STimer.timeCallBack[time] = null;
        }
    }

}
