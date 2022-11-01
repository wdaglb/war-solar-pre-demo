/** @noSelfInFile */

declare interface SolarEventType {
    "选择模式": string
    "选择难度": number
    "开始出怪": void
    "双击选择单位": unit
    "游戏结束": void
}


//SolarEvent (太阳事件总线)
declare interface SolarEventI {


    /**
     * 玩家输入聊天信息
     */
    playerChat(chatMessageToDetect: string, callback: (triggerPlayer: player, chatString: string) => void, exactMatchOnly?: boolean): void;


    /**
     * 任意单位伤害事件
     */
    unitDamaged(callback: (triggerUnit: unit, damageSourceUnit: unit, damage: number) => void): void;

    /**
     * 单位进入区域
     */
    enterRect(whichRect: rect, callback: (triggerUnit: unit) => void): void;

    /**
     * 任意单位事件 - 获得物品
     * @param callback
     */
    unitPickupItem(callback: (triggerUnit: unit, item: item, itemIdStr: string) => void): void;

    /**
     * 任意单位事件 - 丢弃物品
     * @param callback
     */
    unitDropItem(callback: (triggerUnit: unit, item: item, itemIdStr: string) => void): void;

    /**
     * 任意单位事件 - 使用物品
     * @param callback
     */
    unitUseItem(callback: (triggerUnit: unit, item: item, itemIdStr: string) => void): void;

    /**
     * 玩家单位事件 - 完成建造
     * @param callback
     */
    unitConstructFinish(callback: (triggerUnit: unit) => void): void;

    /**
     * 玩家单位事件 - 完成建筑升级
     * @param callback
     */
    unitUpgradeFinish(callback: (triggerUnit: unit) => void): void;

    /**
     * 任意玩家单位事件 - 选择单位
     * @param callback
     */
    unitSelected(callback: (triggerUnit: unit, triggerPlayer: player) => void): void;

    /**
     * 任意单位事件 - 开始施放技能
     * @param callback
     */
    unitSpellCast(callback: (triggerUnit: unit, spellAbilityIdStr: string) => void): void;

    /**
     * 任意单位事件 - 发动技能效果
     * @param callback
     */
    unitSpellEffect(callback: (triggerUnit: unit, spellAbilityIdStr: string) => void): void;

    /**
     * 任意单位事件 - 死亡
     * @param callback
     */
    unitDeath(callback: (triggerUnit: unit, killingUnit: unit) => void): void;

    /**
     * 任意单位事件 - 被攻击
     * @param callback
     */
    unitAttacked(callback: (triggerUnit: unit, attacker: unit) => void): void;

    /**
     * 任意单位事件
     */
    anyUnitEvent(whichPlayerUnitEvent: playerunitevent, callback: (triggerUnit: unit) => void): void;


    /**
     * 注册事件
     * @param type
     * @param handler
     */
    on<Key extends keyof AppEventType>(type: Key, handler: (data: AppEventType[Key]) => void)

    /**
     * 发布一个事件
     * @param type
     * @param data
     */
    emit<Key extends keyof AppEventType>(type: Key, data?: AppEventType[Key])

    /**
     * 清除所有注册的事件
     */
    clear()
}

