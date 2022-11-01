import BaseUtil from "solar/util/BaseUtil";
import DataBase from "../common/DataBase";
import {STimer} from "./STimer";

/**
 * 一个buff 有buff的BuffType的类型
 *
 * buff会经过4个生命周期
 *    onCreated 创建buff
 *    onUpdate buff更新时 默认为每0.1秒调此方法
 *    onInterval 间隔到期
 *    onDestroy  buff结束销毁时
 *
 *    比如 一个 给敌人施加一个每秒造成10点伤害 持续3秒的buff
 *    即 parent = 受到伤害的单位
 *    caster = 发出这个buff的来源单位
 *
 *    每1秒会回调 onInterval 方法
 *
 */
let index = 0;
export default class Buff {

    readonly uuid: string = "sb" + index++;
    buffType: AppBuffType;
    ubertip: string;
    /** 间隔触发时间毫秒单位 MS = 毫秒*/
    intervalMS: number = 0;
    durMS: number = 0;
    ability: ability = null;//获取产生这个Buff的技能。
    atrribute?: AppAttribute;

    /**自定义数据*/
    [userDataKey: string]: any;

    /** 叠加层数*/
    private _stackCount: number = 1;
    /** 如圣骑士给友军上了一个增加护甲的buff 则caster为圣骑士 友军为parent */
    private parent: unit; //该buff在哪个单位身上
    private caster: unit | null = null;//获取产生这个Buff的单位 施法者 可为空
    /** 创建时间  毫秒单位 1000=1秒 */
    private creationTime: number;
    //太阳刷新临时计时变量
    private _SL_interval: number = 0;
    /**
     * 关联的计时器
     * @private
     */
    private sTimer: STimer = null;
    private lastUpdateTime: number = time;
    private _SL_targetattachEffect: effect;

    /**
     *
     * @param buffType buff类型
     * @param parent 寄生所在的单位
     * @param caster buff来源单位 可为空 如羁绊增益效果 就没有来源单位
     */
    constructor(buffType: AppBuffType, parent: unit, caster?: unit | null) {
        this.buffType = buffType;
        this.parent = parent;
        this.caster = caster;
        if (buffType.atrribute) {
            this.atrribute = {...buffType.atrribute};//复制基础属性
        }
        this.intervalMS = Math.floor((buffType.interval ?? 0) * 1000);
        this.durMS = Math.floor((buffType.dur ?? 0) * 1000);
        this.ubertip = buffType.ubertip;
        // 初始化buff关联的计时器 永久buff无间隔的没有计时器
        if (buffType.interval && buffType.interval > 0) {
            this.sTimer = new STimer();
            this.sTimer.start(buffType.interval, () => {
                this.update();
            }, true)
        } else if (buffType.dur && buffType.dur > 0) {//每秒更新
            this.sTimer = new STimer();
            this.sTimer.start(1, () => {
                this.update();
            }, true)
        }

        //添加到buff 单位自定义数据里
        let solarData = DataBase.getUnitSolarData(parent);
        if (!solarData._SL_solarBuffSet) {
            solarData._SL_solarBuffSet = {}
        }
        solarData._SL_solarBuffSet[buffType.id] = this;
        //刷新创建时间
        this.refresh();
        //添加寄生单位的特效
        if (buffType.targetArt != null && buffType.targetArt.length > 1) {
            this._SL_targetattachEffect = AddSpecialEffectTarget(buffType.targetArt, parent, buffType.targetAttach);
        }
        //如果有创建事件监听 则回调此事件监听
        buffType.onCreated?.(this);
        //任意buff创建 事件回调
        for (let anyBuffCreatedListener of Buff._sl_anyBuffCreatedListeners) {
            anyBuffCreatedListener(this);
        }
    }

    public get solarData(): AppSolarBuffData {
        return DataBase.getSolarBuffSolarData(this.uuid)
    }

    public set solarData(obj: { [key: string]: any }) {
        DataBase.setSolarBuffSolarData(this.uuid, obj)
    }

    get stackCount(): number {
        return this._stackCount;
    }

    set stackCount(value: number) {
        this._stackCount = value;
        //如果有创建事件监听 则回调此事件监听
        this.buffType.onStackCountChange?.(this);
        //任意buff层数改变事件
        for (let listener of Buff._sl_anyBuffStackCountChangeListeners) {
            listener(this);
        }
    }

    /**
     * 刷新这个buff
     */
    refresh() {
        this.creationTime = time;
    }

    /**获得buff来源单位*/
    getCaster(): unit {
        return this.caster;
    }

    setCaster(value: unit) {
        this.caster = value;
    }

    /**获得寄生单位*/
    getParent(): unit {
        return this.parent;
    }

    setParent(parent: unit): void {
        this.parent = parent;
    }

    /**
     * 获取这个Mordifier的创建时间 毫秒单位
     */
    getCreationTime(): number {
        return this.creationTime;
    }

    /**
     *    获取这个buff的终止时间
     */
    getDieTime(): number {
        return this.creationTime + this.durMS
    }

    /**
     *    获取剩余时间 毫秒单位
     */
    getRemainingTime(): number {
        return this.creationTime + this.durMS - BaseUtil.time;
    }

    getName(): string {
        return this.buffType.name;
    }

    getUbertip(): string {
        return this.ubertip;
    }

    //由自身的太阳中心计时器 执行此方法
    private update() {
        //更新回调
        let tpf: number = time - this.lastUpdateTime
        this.buffType.onUpdate?.(this, tpf)
        //计算间隔逻辑回调
        this._SL_interval += tpf;
        if (this.intervalMS > 0 && this._SL_interval >= this.intervalMS) {
            this._SL_interval = 0;
            if (this.buffType.onInterval) {
                this.buffType.onInterval(this)
            }
        }
        //计算是否销毁 //durMS为0的则为永久存在 只能手动销毁
        if (this.durMS > 0 && this.getRemainingTime() <= 0) {
            this.destroy()
        }
        this.lastUpdateTime = time;
    }

    getAttribute(createDefault = false): AppAttribute | null {
        if (!this.atrribute && createDefault) {
            this.atrribute = {};
        }
        return this.atrribute;
    }

    /**
     * 销毁此buff
     */
    destroy(): void {
        //如果有创建事件监听 则回调此事件监听
        if (this.buffType.onDestroy) {
            let flag = this.buffType.onDestroy(this);
            if (flag == false) {
                return
            }
        }
        //任意buff销毁事件
        for (let listener of Buff._sl_anyBuffDestroyListeners) {
            listener(this);
        }
        if (this._SL_targetattachEffect) {
            DestroyEffect(this._SL_targetattachEffect)
        }
        //清空数据
        let solarData = DataBase.getUnitSolarData(this.parent, false);
        if (solarData?._SL_solarBuffSet) {//清除buff
            solarData._SL_solarBuffSet[this.buffType.id] = null;
        }
        this.sTimer?.destroy();
        this.solarData = null;
    }


    /**
     * 全局任意buff 事件
     */
    static _sl_anyBuffCreatedListeners: ((buff: Buff) => void)[] = [];
    static _sl_anyBuffStackCountChangeListeners: ((buff: Buff) => void)[] = [];
    static _sl_anyBuffDestroyListeners: ((buff: Buff) => void)[] = [];
}