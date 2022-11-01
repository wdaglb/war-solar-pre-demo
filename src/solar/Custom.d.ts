/**
 * 太阳自定义类型声明
 * 可将此处的类型复制到 新建.d.ts编写这些声明 以便分文件管理
 * (PS:在ts项目中相同名字的interface 会自动合并)
 *
 */


/**
 *可以在这里自定义 此地图 可用的属性词条
 * (可在太阳代码仓库demo/TestAppAttribute找到太阳属性系统的使用方式)
 *
 * 属性与SolarData的区别为:
 * 属性(Attribute)本质也是存放在SolarData里 属性主要额外提供了可在单位携带物品或buff等时会自动计算总属性值。
 * 通常与战斗相关的伤害词条或携带物品、buff等需要叠加到单位身上的可选择存放在属性里
 *
 * 其他不需要叠加到单位的值可存在SolarData 如玩家杀敌数 单位伤害总计 英雄的职业 物品的归类
 */
declare interface AppAttribute extends SolarAtrribute {
    strength_increased_every3seconds?: number //每3秒增加力量
    lv_zi_min_jie_m3s?: number //每3秒增加敏捷 (拼音命名)
    gold_increased_per_second?: number //每秒增加金币
    damage_increased_dt_1?: number //1号伤害类型增伤   (如 火系伤害)
    split_damage?: number //分裂伤害 0.5=50%

    /**
     * "huo" 火系
     * "shui" 水系
     */
    nature_type?: "huo" | "shui" | any; // 所属类型  可在伤害系统里做属性相克计算 如火系单位对水系单位造成的伤害 会减免50%


    /**
     *  lucky_value 这个幸运值属性 需自行在 受幸运值的触发里自行判断 如抽奖触发里
     *  AttributeUtil.getAttribute(GetTriggerUnit())?.lucky_value
     */

    lucky_value?: number //幸运值 比如0.1 = 10%的几率加强

}


/**
 * 自定义buff系统额外属性
 */
declare interface AppBuffType extends SolarBuffType {
}

/**
 * 自定义伤害事件扩展属性
 */
declare interface AppDamageEvent extends SolarDamageEvent {
}

/**
 * 自定义游戏设置
 */
declare interface AppSettings extends SolarSettings {
}

/**
 * 自定义中心事件类型
 */
declare interface AppEventType extends SolarEventType {
}

/**
 * 自定义全局变量的类型
 */
declare interface AppGlobalVariable extends SolarGlobalVariable {
}


/**
 * 自定义 太阳 基础 数据
 */
declare interface AppData extends SolarData {
}

/**
 * 自定义 太阳 单位 数据
 */
declare interface AppUnitData extends AppData {
}

/**
 * 自定义 太阳 玩家 数据
 */
declare interface AppPlayerData extends AppData {
    /**
     * 杀敌数
     */
    killCount?: number;
    /**
     * 玩家英雄单位
     */
    hero?: unit;
    /**
     * 助理  宝宝 建造师 召唤师
     */
    assistant?: unit;
}

/**
 * 自定义 太阳 物品 数据
 */
declare interface AppItemData extends AppData {
}

/**
 * 自定义 太阳 单位类型 数据
 */
declare interface AppUnitTypeData extends AppData {
}

/**
 * 自定义 太阳 物品类型 数据
 */
declare interface AppItemTypeData extends AppData {
}

/**
 * 自定义 太阳 技能类型 数据
 */
declare interface AppAbilityTypeData extends AppData {
}

/**
 * 自定义 太阳 buff 数据
 */
declare interface AppSolarBuffData extends AppData {
}
