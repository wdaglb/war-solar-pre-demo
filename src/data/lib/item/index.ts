import {ItemEventType, itemHandleData} from "./common";
import {itemClasses} from "../../config/items";

// 导出物品数据
export let itemData: iobj[] = [];

itemClasses.forEach(item => {
    const data: iobj = {
        id: item.data.id,
        _parent: 'afac',
        Name: item.data.name,
        Tip: item.data.name,
        Description: item.data.description,
        Ubertip: item.data.description,
        Art: item.data.icon,
        file: item.data.model,
        goldcost: item.data.money + '',
        lumbercost: (item.data.lumber ?? 0) + '',
        uses: (item.data.number ?? 0) + '',
        stockStart: (item.data.buyStart ?? 0) + '',
        stockMax: (item.data.stock ?? 1) + '',
        sellable: '1',
        pawnable: '1',
        Level: '1',
    }
    if (item.data.use) {
        data.usable = '1';

        data.cooldownID = item.data.cdGroup;
        data.perishable = '1';
    } else {
        data.perishable = '0';
    }
    if (item.data.buyCD != null) {
        data.stockRegen = item.data.buyCD + '';
    }
    if (item.data.ability) {
        data.abilList = item.data.ability.join(',');
    }
    if (item.data.pos && item.data.pos.length == 2) {
        data.Buttonpos_1 = item.data.pos[0] + '';
        data.Buttonpos_2 = item.data.pos[1] + '';
    }
    if (item.data.hotKey) {
        data.Hotkey = item.data.hotKey + '';
    }
    item.onItemFill(data);
    itemData.push(data);
});

// 地图运行中的入口
export default function initItem() {
    // 物品获得
    let tri = CreateTrigger();
    TriggerRegisterAnyUnitEventBJ(tri, EVENT_PLAYER_UNIT_PICKUP_ITEM);
    TriggerAddAction(tri, () => {
        let unit = GetTriggerUnit();
        let item = GetManipulatedItem();

        if (! itemHandleData.has(item)) {
            return;
        }
        const handle = itemHandleData.get(item);
        // 当前物品没有监听事件直接返回
        if (! handle.listen().includes(ItemEventType.pickup)) {
            return;
        }

        handle.onPickup(unit);
    })

    // 物品丢弃
    tri = CreateTrigger();
    TriggerRegisterAnyUnitEventBJ(tri, EVENT_PLAYER_UNIT_DROP_ITEM);
    TriggerAddAction(tri, () => {
        let unit = GetTriggerUnit();
        let item = GetManipulatedItem();

        if (! itemHandleData.has(item)) {
            return;
        }
        const handle = itemHandleData.get(item);
        // 当前物品没有监听事件直接返回
        if (! handle.listen().includes(ItemEventType.drop)) {
            return;
        }

        handle.onDrop(unit);
    })

    // 物品使用
    tri = CreateTrigger();
    TriggerRegisterAnyUnitEventBJ(tri, EVENT_PLAYER_UNIT_USE_ITEM);
    TriggerAddAction(tri, () => {
        let unit = GetTriggerUnit();
        let item = GetManipulatedItem();

        if (! itemHandleData.has(item)) {
            return;
        }
        const handle = itemHandleData.get(item);
        // 当前物品没有监听事件直接返回
        if (! handle.listen().includes(ItemEventType.use)) {
            return;
        }

        handle.onUse(unit);
    })

    // 物品出售
    tri = CreateTrigger();
    TriggerRegisterAnyUnitEventBJ(tri, EVENT_PLAYER_UNIT_PAWN_ITEM);
    TriggerAddAction(tri, () => {
        let unit = GetTriggerUnit();
        let item = GetSoldItem();

        if (! itemHandleData.has(item)) {
            return;
        }
        const handle = itemHandleData.get(item);
        // 当前物品没有监听事件直接返回
        if (! handle.listen().includes(ItemEventType.sell)) {
            return;
        }

        handle.onSell(unit);
    })
}
