import AttributeUtil from "../../../solar/util/system/AttributeUtil";
import UnitAttributeState from "../../../solar/atrribute/UnitAttributeState";

let id = 0;

// 物品事件
export enum ItemEventType {
    // 获得
    pickup,
    // 丢弃
    drop,
    // 使用
    use,
    // 出售
    sell,
}

// 物品实例仓库
export const itemHandleData = new Map<handle, AbstractItem>();

// 抽象物品类
export abstract class AbstractItem {
    public id: number;
    public data: ItemParams = {} as any;
    public x: number;
    public y: number;
    public handle: item;
    protected deathTrigger: trigger;
    public attribute: AppAttribute = {};

    protected constructor(x: number = 0, y: number = 0) {
        this.x = x;
        this.y = y;
        this.id = ++id;
    }

    /**
     * 每个物品类都需要在构造函数下调用一下此方法
     * @protected
     */
    protected init() {
        if (_G.GlobalVars_init) { // 此处判断地图运行时才运行，不然会异常
            this.handle = CreateItem(this.data.id, this.x, this.y);
            itemHandleData.set(this.handle, this);

            // 物品被销毁释放
            this.deathTrigger = CreateTrigger();
            TriggerRegisterDeathEvent(this.deathTrigger, this.handle);
            TriggerAddAction(this.deathTrigger, () => {
                this.destroy();
                DestroyTrigger(this.deathTrigger);
            });
        }
    }

    /**
     * 物编数据填充时.
     * @param data
     */
    public onItemFill(data: iobj) {
        const temps: string[] = [];
        if (this.attribute.attack) {
            temps.push('攻击力：' + this.attribute.attack);
        }
        if (this.attribute.def) {
            temps.push('防御力：' + this.attribute.def);
        }
        if (this.attribute.strength) {
            temps.push('力量：' + this.attribute.strength);
        }
        if (this.attribute.agility) {
            temps.push('敏捷：' + this.attribute.agility);
        }
        if (this.attribute.intelligence) {
            temps.push('智力：' + this.attribute.intelligence);
        }
        data.Description = data.Ubertip = this.data.description + '|n' + temps.join('|n');
    }

    /**
     * 监听事件.
     */
    public listen(): ItemEventType[] {
        return [];
    }

    /**
     * 给单位物品.
     * @param target
     */
    public atUnit(target: unit) {
        UnitAddItem(target, this.handle);
    }

    /**
     * 释放数据.
     */
    public destroy() {
        if (this.handle) {
            itemHandleData.delete(this.handle);
        }
    }

    /**
     * 物品被获得.
     * @param unit 获得单位
     */
    public onPickup(unit: unit) {
        AttributeUtil.setUnitAttribute(unit, this.attribute);
        UnitAttributeState.refreshUnitSolarAtrribute(unit);
    }

    /**
     * 物品被丢弃.
     * @param unit 丢弃单位
     */
    public onDrop(unit: unit) {
        UnitAttributeState.refreshUnitSolarAtrribute(unit);
    }

    /**
     * 物品被使用.
     * @param unit 使用单位
     */
    public onUse(unit: unit) {
    }

    /**
     * 物品被出售.
     * @param unit 触发单位
     */
    public onSell(unit: unit) {
    }
}
