/** @noSelfInFile */
import mitt from 'solar/lib/mitt'
import Cache from "solar/tool/Cache";
import TriggerUtil from "solar/util/system/TriggerUtil";
import UnitSpellEvent from "solar/tool/event/UnitSpellEvent";
import UnitDeathEvent from "solar/tool/event/UnitDeathEvent";
import UnitAttackedEvent from "solar/tool/event/UnitAttackedEvent";
import UnitDamagedEvent from "../tool/event/UnitDamagedEvent";
import UnitEvent from "../tool/event/UnitEvent";
import UnitItemEvent from "../tool/event/UnitItemEvent";

const emitter = mitt()
const cache = new Cache();

/**
 * 太阳事件(总线)
 * 所有监听的事件回调公用一个触发器去注册
 */
export default class SolarEvent {

    /**
     * 玩家输入聊天信息
     */
    playerChat(chatMessageToDetect: string, callback: (triggerPlayer: player, chatString: string) => void, exactMatchOnly: boolean = true) {
        const key = "playerChat:" + chatMessageToDetect + ":" + exactMatchOnly;
        cache.get(key, () => {
            let trigger = CreateTrigger()
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerChatEvent(trigger, Player(i), chatMessageToDetect, exactMatchOnly);
            }
            TriggerAddAction(trigger, () => {
                emitter.emit(key)
            })
            return true;
        })
        emitter.on(key, () => {
            callback(GetTriggerPlayer(), GetEventPlayerChatString())
        })
    }

    /**
     * 任意单位伤害事件
     */
    unitDamaged(callback: (triggerUnit: unit, damageSourceUnit: unit, damage: number) => void) {
        const key = "unitDamaged";
        cache.get(key, () => {
            let trigger = CreateTrigger()
            TriggerUtil.SystemAnyUnitDamagedRegistTrigger(trigger)
            TriggerAddAction(trigger, () => {
                emitter.emit(key)
            })
            return true;
        })
        emitter.on(key, () => {
            callback(GetTriggerUnit(), GetEventDamageSource(), GetEventDamage())
        })
    }

    onUnitDamaged(callback: (e: UnitDamagedEvent) => void) {
        const key = "onUnitDamaged";
        cache.get(key, () => {
            let trigger = CreateTrigger()
            TriggerUtil.SystemAnyUnitDamagedRegistTrigger(trigger)
            TriggerAddAction(trigger, () => {
                emitter.emit(key)
            })
            return true;
        });
        emitter.on(key, () => {
            callback(UnitDamagedEvent.instance)
        })
    }

    /**
     * 单位进入区域
     */
    enterRect(whichRect: rect = bj_mapInitialPlayableArea, callback: (triggerUnit: unit) => void) {

        const key = "enterRect:" + GetHandleId(whichRect);
        cache.get(key, () => {
            let rectRegion: region = CreateRegion()
            RegionAddRect(rectRegion, whichRect)
            //任意单位死亡事件
            let trigger = CreateTrigger()
            TriggerRegisterEnterRegion(trigger, rectRegion, null);
            TriggerAddAction(trigger, () => {
                emitter.emit(key)
            })
            return true;
        })
        emitter.on(key, () => {
            callback(GetTriggerUnit())
        })
    }

    /**
     * 任意单位事件 - 获得物品
     * @param callback
     */
    unitPickupItem(callback: (triggerUnit: unit, item: item, itemIdStr: string) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, triggerUnit => {
            callback(triggerUnit, GetManipulatedItem(), id2string(GetItemTypeId(GetManipulatedItem())))
        })
    }

    /**
     * 任意单位事件 - 获得物品
     * @param callback
     */
    onUnitPickupItem(callback: (e: UnitItemEvent) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, () => {
            callback(UnitItemEvent.instance)
        })
    }


    /**
     * 任意单位事件 - 丢弃物品
     * @param callback
     */
    unitDropItem(callback: (triggerUnit: unit, item: item, itemIdStr: string) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, triggerUnit => {
            callback(triggerUnit, GetManipulatedItem(), id2string(GetItemTypeId(GetManipulatedItem())))
        })
    }

    /**
     * 任意单位事件 - 丢弃物品
     * @param callback
     */
    onUnitDropItem(callback: (e: UnitItemEvent) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, () => {
            callback(UnitItemEvent.instance)
        })
    }

    /**
     * 任意单位事件 - 使用物品
     * @param callback
     */
    unitUseItem(callback: (triggerUnit: unit, item: item, itemIdStr: string) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_USE_ITEM, triggerUnit => {
            callback(triggerUnit, GetManipulatedItem(), id2string(GetItemTypeId(GetManipulatedItem())))
        })
    }

    /**
     * 任意单位事件 - 使用物品
     * @param callback
     */
    onUnitUseItem(callback: (e: UnitItemEvent) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_USE_ITEM, () => {
            callback(UnitItemEvent.instance)
        })
    }

    /**
     * 玩家单位事件 - 完成建造
     * @param callback
     */
    unitConstructFinish(callback: (triggerUnit: unit) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH, triggerUnit => {
            callback(triggerUnit)
        })
    }

    /**
     * 玩家单位事件 - 完成建筑升级
     * @param callback
     */
    unitUpgradeFinish(callback: (triggerUnit: unit) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_FINISH, triggerUnit => {
            callback(triggerUnit)
        })
    }

    /**
     * 任意玩家单位事件 - 选择单位
     * @param callback
     */
    unitSelected(callback: (triggerUnit: unit, triggerPlayer: player) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_SELECTED, triggerUnit => {
            callback(triggerUnit, GetTriggerPlayer())
        })
    }

    onUnitSelected(callback: (e: UnitEvent) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_SELECTED, () => {
            callback(UnitEvent.instance)
        })
    }

    /**
     * 任意单位事件 - 开始施放技能
     * @param callback
     */
    unitSpellCast(callback: (triggerUnit: unit, spellAbilityIdStr: string) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_SPELL_CAST, triggerUnit => {
            callback(triggerUnit, id2string(GetSpellAbilityId()))
        })
    }

    /**
     * 任意单位事件 - 开始施放技能
     * @param callback
     */
    onUnitSpellCast(callback: (event: UnitSpellEvent) => void, abilityId?: string) {
        this.anyUnitSpellEvent(EVENT_PLAYER_UNIT_SPELL_CAST, callback, abilityId);
    }

    /**
     * 任意单位事件 - 发动技能效果
     * @param callback
     */
    unitSpellEffect(callback: (triggerUnit: unit, spellAbilityIdStr: string) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, triggerUnit => {
            callback(triggerUnit, id2string(GetSpellAbilityId()))
        })
    }

    /**
     * 任意单位事件 - 发动技能效果
     * @param callback
     * @param abilityId
     */
    onUnitSpellEffect(callback: (event: UnitSpellEvent) => void, abilityId?: string) {
        this.anyUnitSpellEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, callback, abilityId);
    }

    /**
     * 任意单位事件 - 死亡
     * @param callback
     */
    unitDeath(callback: (triggerUnit: unit, killingUnit: unit) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_DEATH, triggerUnit => {
            callback(triggerUnit, GetKillingUnit())
        })
    }

    onUnitDeath(callback: (e: UnitDeathEvent) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_DEATH, () => {
            callback(UnitDeathEvent.instance)
        })
    }

    /**
     * 任意单位事件 - 被攻击
     * @param callback
     */
    unitAttacked(callback: (triggerUnit: unit, attacker: unit) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, triggerUnit => {
            callback(triggerUnit, GetAttacker())
        })
    }

    onUnitAttacked(callback: (e: UnitAttackedEvent) => void) {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, () => {
            callback(UnitAttackedEvent.instance)
        })
    }

    /**
     * 任意单位事件
     */
    anyUnitEvent(whichPlayerUnitEvent: playerunitevent, callback: (triggerUnit: unit) => void) {

        const key = "anyUnitEvent:" + GetHandleId(whichPlayerUnitEvent);
        cache.get(key, () => {
            //任意单位攻击事件
            let trigger = CreateTrigger()
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerUnitEvent(trigger, Player(i), whichPlayerUnitEvent, null)
            }
            TriggerAddAction(trigger, () => {
                emitter.emit(key)
            })
            return true;
        })
        emitter.on(key, () => {
            callback(GetTriggerUnit())
        })
    }

    /**
     * 任意单位释放技能总事件
     */
    anyUnitSpellEvent(whichPlayerUnitEvent: playerunitevent, callback: (spellEvent: UnitSpellEvent) => void, spellAbilityId?: string) {
        const key = "anyUnitSpellEvent:" + GetHandleId(whichPlayerUnitEvent);
        cache.get(key, () => {
            //任意单位攻击事件
            let trigger = CreateTrigger()
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerUnitEvent(trigger, Player(i), whichPlayerUnitEvent, null)
            }
            TriggerAddAction(trigger, () => {
                emitter.emit(key);
                let regCallback: (spellEvent: UnitSpellEvent) => void = cache.get(key + ":" + spellAbilityId);
                if (regCallback) {
                    regCallback(UnitSpellEvent.instance)
                }
            })
            return true;
        })
        if (spellAbilityId) {
            cache.put(key + ":" + spellAbilityId, callback);
        } else {
            emitter.on(key, () => {
                callback(UnitSpellEvent.instance)
            })
        }

    }


    /**
     * 注册一个事件接收器
     * @param type
     * @param handler
     */
    on<Key extends keyof AppEventType>(type: Key, handler: (data: AppEventType[Key]) => void) {
        emitter.on(type as any, handler as any)
    }

    /**
     * 发布一个事件
     * @param type
     * @param data
     */
    emit<Key extends keyof AppEventType>(type: Key, data?: AppEventType[Key]) {
        emitter.emit(type as any, data as any)
    }

    /**
     * 清除所有注册的事件
     */
    clear() {
        cache.clear();
        emitter.all.clear();
    }


}
/**
 * se : SolarEvent (太阳事件总线)
 */
declare global {
    let se: SolarEvent;
}