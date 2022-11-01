import {Trigger} from "solar/w3ts/handles/trigger";
import SelectUtil from "solar/util/unit/SelectUtil";
import ItemUtil from "solar/util/game/ItemUtil";

/** @noSelf **/
export default class DebugUtil {
    static noDebug = false;

    /**
     * 显示文本
     * @param text
     */
    static showText(text: string) {
        if (DebugUtil.noDebug) {
            return
        }
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30,
            text)
    }

    /**
     * 计算函数执行耗时
     * @param func
     */
    static countExecuteTime(func: () => void): number {
        // @ts-ignore
        let o: NoSelf = os;
        let start = o.clock();
        func();
        let useTime = o.clock() - start;
        // @ts-ignore
        let stringTs: NoSelf = string
        let info = '函数执行时间=' + stringTs.format("%.3f", (useTime * 1000)) + "毫秒";
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 20, info);
        print(info);
        return useTime
    }


    /**
     * 注册时间到期时的触发事件
     * @param time
     * @param actionFunc
     */
    static onTime(time: number, actionFunc: (this: void) => void) {
        let trigger = new Trigger();
        trigger.registerTimerEvent(time, false)
        trigger.addAction(actionFunc)
    }

    /**
     * 注册聊天事件
     * @param char
     * @param actionFunc
     */
    static onChat(char: string, actionFunc: (this: void) => void) {
        let trigger = new Trigger();
        trigger.registerAnyPlayerChatEvent(char, true)
        trigger.addAction(actionFunc)
    }

    /**当键盘按下时*/
    static onKeyEvent(key: number, actionFunc: (this: void) => void) {
        let t = CreateTrigger();
        DzTriggerRegisterKeyEventByCode(t, key, 1, true, null)
        TriggerAddAction(t, actionFunc)

    }


    static limitTimeCache: { [id: string]: number } = {}

    /**
     * 是否在限制次数
     * @param key
     * @param time
     */
    static isLimitTime(key: string, time: number): boolean {
        if (!DebugUtil.limitTimeCache[key]) {
            DebugUtil.limitTimeCache[key] = 1;
        }
        if (DebugUtil.limitTimeCache[key] > time) {
            return true;
        }
        DebugUtil.limitTimeCache[key] = DebugUtil.limitTimeCache[key] + 1;
        return false;
    }

    /**
     * 打印本地变量
     */
    static printLocalVars() {
        for (let i = 1; i < 1000000; i++) {
            let [name, value] = debug.getlocal(2, i);
            if (!name) {
                break
            }
            print(`${name} :`)
            print_r(value)
        }
    }


    /**
     * 移除所有单位
     */
    static removeAllUnits() {
        SelectUtil.forAllUnits(unit => {
            RemoveUnit(unit)
        })
    }

    /**
     * 移除所有物品
     */
    static removeAllItems() {
        ItemUtil.forItemsInRect(bj_mapInitialPlayableArea, (item) => {
            RemoveItem(item)
        })
    }

}
