import {AbstractItem, ItemEventType} from "../../lib/item/common";

export class Dao extends AbstractItem {
    public data: ItemParams = {
        id: 'i001',
        name: '小刀',
        description: '这是一把小刀',
        icon: '',
        money: 1000,
    };
    public attribute: AppAttribute = {
        def: 10,
    };

    constructor() {
        super();
        this.init();
    }

    listen(): ItemEventType[] {
        return [
            ItemEventType.pickup,
            ItemEventType.drop,
        ];
    }

    /**
     * 物品获得
     * @param unit
     */
    onPickup(unit: unit) {
        super.onPickup(unit);
        print('单位：' + GetUnitName(unit) + '获得了' + this.data.name)

        print('物品id：' + this.id)
    }

    /**
     * 物品丢弃
     * @param unit
     */
    onDrop(unit: unit) {
        super.onDrop(unit);
        print('单位：' + GetUnitName(unit) + '丢弃了' + this.data.name)

        print('物品id：' + this.id)
    }
}
