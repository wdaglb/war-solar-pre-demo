import Buff from "solar/tool/Buff";
import DataBase from "solar/common/DataBase";
import GroupUtil from "solar/util/unit/GroupUtil";
import BaseUtil from "../BaseUtil";

/**
 * buff = 增益效果
 * 太阳模拟buff系统 工具类
 *
 * (buff不单包括常规的增益减益状态 还包括羁绊、神器、入体装备、境界、法宝、丹药等任何自定义属性附加)
 *
 *
 *   buff会经过4个生命周期
 *    onCreated 创建buff
 *    onUpdate buff更新时 默认为每0.1秒调此方法
 *     onInterval 间隔到期
 *    onDestroy  buff结束销毁时
 */
declare type BuffSet = { //buff集合
    [buffTypeId: string]: Buff
}

export default class BuffUtil {
    /**
     * 注册buff类型
     * @param buffType
     */
    static registerBuffType(buffType: AppBuffType) {
        DataBase.setSolarBuffType(buffType.id, buffType);
    }

    /**
     * 注册buff 事件
     * 不能重复注册
     */
    static registerBuffCreatedEvent(buffTypeId: string, onCreated: (buff: Buff) => void) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        buffType.onCreated = onCreated;
    }

    /**
     * 注册buff更新事件 取决于buff更新系统 通常为0.1秒更新一次 可用则绑定UI动画
     * @param buffTypeId
     * @param onUpdate
     */
    static registerBuffUpdateEvent(buffTypeId: string, onUpdate: (buff: Buff, tpf: number) => void) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        buffType.onUpdate = onUpdate;
    }

    /**
     * 注册buff 间隔到期事件
     */
    static registerBuffIntervalEvent(buffTypeId: string, onInterval: (buff: Buff) => void) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        buffType.onInterval = onInterval;
    }

    /**
     * 注册buff 销毁事件
     */
    static registerBuffDestroyEvent(buffTypeId: string, onDestroy: (buff: Buff) => void) {
        let buffType = BuffUtil.getBuffType(buffTypeId);
        buffType.onDestroy = onDestroy;
    }


    /**
     * 根据buffTypeId返回Buff类型
     * @param buffTypeId
     */
    static getBuffType(buffTypeId: string): AppBuffType {
        let bt = DataBase.getSolarBuffType(buffTypeId);
        if (!bt) {
            log.errorWithTraceBack("BuffType(增益效果类型)不存在!ID=" + buffTypeId)
        }
        return bt;
    }


    /**
     * 给单位上一个buff
     * @param unit 给哪个单位上
     * @param buffTypeId
     * @param caster buff来源单位
     */
    static addBuff(unit: unit, buffTypeId: string, caster?: unit): Buff {
        let buffType = DataBase.getSolarBuffType(buffTypeId);
        if (!buffType) {
            log.errorWithTraceBack("buff不存在!请先使用registerBuffType注册Buff类型! id=" + buffTypeId)
            return null;
        }
        //判断是否已存在buff
        let oldUnitBuff = BuffUtil.getUnitBuff(unit, buffTypeId);
        if (oldUnitBuff) {
            if (buffType.stackCountMax && buffType.stackCountMax != 0) {//可叠加
                //-1 = 无限叠加
                if (buffType.stackCountMax == -1 || oldUnitBuff.stackCount < buffType.stackCountMax) {
                    oldUnitBuff.stackCount++;//增加叠加层数
                    if (buffType.stackDurMode) {
                        BaseUtil.runLater(buffType.dur, () => {
                            oldUnitBuff.stackCount--;
                        })
                    }
                }
            }
            oldUnitBuff.refresh()
            return oldUnitBuff;
        }
        //新建buff
        let buff = new Buff(buffType, unit, caster);
        return buff;
    }


    /**
     * 获取某个玩家的所有单位拥有的增益效果的 第一个
     * @param unit
     */
    static getPlayerUnitBuff(player: player, buffTypeId: string): Buff {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsOfPlayer(group, player, null)
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }
            let buff = BuffUtil.getUnitBuff(unitHandle, buffTypeId);
            if (buff?.buffType.id == buffTypeId) {
                GroupUtil.groupObjectPool.returnObject(group);
                return buff
            }
            GroupRemoveUnit(group, unitHandle)
        }
        GroupUtil.groupObjectPool.returnObject(group);
        return null;
    }

    /**
     * 获取单位的某个类型的buff
     * @param unit
     */
    static getUnitBuff(unit: unit, buffTypeId: string): Buff {
        return BuffUtil.getUnitBuffs(unit)?.[buffTypeId];
    }

    /**
     * 判断是否拥有某个类型的buff
     * @param unit
     * @param buffTypeId
     */
    static hasUnitBuff(unit: unit, buffTypeId: string): boolean {
        return BuffUtil.getUnitBuffs(unit)?.[buffTypeId] != null;
    }

    /**
     * 获取单位身上所有buff
     * @param unit
     */
    static getUnitBuffs(unit: unit): BuffSet {
        let unitSolarData = DataBase.getUnitSolarData(unit, false);
        return unitSolarData?._SL_solarBuffSet;
    }

    /**
     * 获取单位身上所有buff 的属性值
     * @param unit
     */
    static getUnitBuffAttributes(unit: unit): AppAttribute[] {
        let unitSolarData = DataBase.getUnitSolarData(unit, false);
        let solarBuffSet: BuffSet = unitSolarData?._SL_solarBuffSet;
        if (!solarBuffSet) {
            return null;
        }
        let atrributes: AppAttribute[] = [];
        for (let solarBuffSetKey in solarBuffSet) {
            let atrribute = solarBuffSet[solarBuffSetKey]?.atrribute;
            if (atrribute) {
                atrributes.push(atrribute)
            }
        }
        return atrributes;
    }

    /**
     * 遍历所有buff类型
     * @param callback 遍历回调函数
     * @param buffTypeClass 增益效果类型的类别
     */
    static forAllBuffTypes(callback: (buffType: AppBuffType) => void, buffTypeClass?: string): void {
        DataBase.forSolarBuffTypes((buffTypeID, buffType) => {
            if (buffTypeClass) {
                if (buffTypeClass == buffType.class) {
                    callback(buffType)
                }
            } else {
                callback(buffType)
            }
        });

    }

    /**
     * 遍历地图上所有单位的所有buffs
     * @param callback
     * @param buffTypeId 只对某个buffType做遍历
     */
    static forAllBuffs(callback: (buff: Buff) => void, buffTypeId?: string): void {
        if (buffTypeId) {//遍历单个类型
            //遍历所有
            DataBase.forUnitSolarDatas((id, solarData: AppData) => {
                let _SL_solarBuffSet: BuffSet = solarData?._SL_solarBuffSet;
                if (_SL_solarBuffSet) {
                    for (let tempBuffTypeId in _SL_solarBuffSet) {
                        let buff = _SL_solarBuffSet[tempBuffTypeId];
                        if (buff?.buffType.id == buffTypeId) {
                            callback(buff)
                        }
                    }
                }
            })
        } else {
            //遍历所有
            DataBase.forUnitSolarDatas((id, solarData: AppData) => {
                let _SL_solarBuffSet: BuffSet = solarData?._SL_solarBuffSet;
                if (_SL_solarBuffSet) {
                    for (let tempBuffTypeId in _SL_solarBuffSet) {
                        callback(_SL_solarBuffSet[tempBuffTypeId])
                    }
                }
            })
        }

    }

    /**
     * 遍历此单位的 所有buff
     */
    static forUnitBuffs(unit: unit, callback: (buff: Buff) => void): void {
        let buffSet = BuffUtil.getUnitBuffs(unit);
        if (!buffSet) {
            return
        }
        for (let buffTypeId in buffSet) {
            let buff = buffSet[buffTypeId];
            if (buff) {
                callback(buff)
            }
        }

    }

    /**
     * 清除单位某个类型的buff
     * @param unit
     * @param buffTypeId
     */
    static clearUnitBuff(unit: unit, buffTypeId: string) {
        BuffUtil.getUnitBuff(unit, buffTypeId)?.destroy();
    }

    /**
     * 清除单位所有buff
     * @param unit 单位
     * @param onlyDeBuff 只清除debuff
     */
    static clearUnitBuffs(unit: unit, onlyDeBuff = false) {
        let buffs: BuffSet = BuffUtil.getUnitBuffs(unit);
        if (!buffs) {
            return;
        }
        for (let buffsKey in buffs) {
            if (onlyDeBuff) {
                if (buffs[buffsKey]?.buffType.isDebuff) {
                    buffs[buffsKey].destroy();
                }
            } else {
                buffs[buffsKey]?.destroy();
            }

        }
    }

    /**
     * 清除单位身上某个类别的所有buff
     * @param unit 单位
     * @param class buff 类型 如基础 羁绊 入体装备 等
     */
    static clearUnitBuffsByClass(unit: unit, clazz: string) {
        let buffs: BuffSet = BuffUtil.getUnitBuffs(unit);
        if (!buffs) {
            return;
        }
        for (let buffsKey in buffs) {
            let buff = buffs[buffsKey];
            if (buff?.buffType?.class == clazz) {
                buff.destroy()
            }
        }
    }


    /**
     * 添加任意buff创建事件 监听回调
     */
    static addAnyBuffCreatedListener(onBuffCreatedListener: (buff: Buff) => void) {
        Buff._sl_anyBuffCreatedListeners.push(onBuffCreatedListener);
    }

    /**
     * 添加任意buff叠加层数改变事件 监听回调
     */
    static addAnyBuffStackCountChangeListener(onBuffStackCountChangeListener: (buff: Buff) => void) {
        Buff._sl_anyBuffStackCountChangeListeners.push(onBuffStackCountChangeListener);
    }

    /**
     * 添加任意buff销毁事件 监听回调
     */
    static addAnyBuffDestroyListener(onBuffDestroyListener: (buff: Buff) => void) {
        Buff._sl_anyBuffDestroyListeners.push(onBuffDestroyListener);
    }
}