/**
 * 物品参数
 */
declare interface ItemParams {
    id: string;
    /**
     * 物品名
     */
    name: string;
    /**
     * 描述
     */
    description: string;
    /**
     * 图标
     */
    icon: string;
    /**
     * 模型
     */
    model?: string;
    /**
     * 是否为主动使用物品
     */
    use?: boolean;
    /**
     * cd间隔组，四位技能id
     */
    cdGroup?: string;
    /**
     * 拾取时自动使用
     */
    pickupUse?: boolean;
    /**
     * 购买开始时间
     */
    buyStart?: number;
    /**
     * 购买间隔
     */
    buyCD?: number;
    /**
     * 黄金
     */
    money: number;
    /**
     * 木材
     */
    lumber?: number;
    /**
     * 使用次数
     */
    number?: number;
    /**
     * 最大库存，默认1
     */
    stock?: number;
    /**
     * 物品技能
     */
    ability?: string[];
    /**
     * 位置
     */
    pos?: number[];
    /**
     * 热键
     */
    hotKey?: string;
}
