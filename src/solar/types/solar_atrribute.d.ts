// spd?: number,//移动速度
// spd_p?: number,
// lifeSpd?: number, //生命恢复速度
// lifeSpd_p?: number,
// manaSpd?: number,
// manaSpd_p?: number,
// cool?: number, //冷却减少时间
// cool_p?: number, //冷却减少百分比

/**
 * 游戏平衡性常数
 * 大数值模式下可使用下面的常数来执行对应奖励
 */
/**力量奖励生命值*/
declare let StrHpBonus: number;
/**敏捷奖励防御 0.01=100点敏捷奖励1点护甲*/
declare let AgiDefenseBonus: number;
/**智力奖励魔法值*/
declare let IntManaBonus: number;
/**主属性奖励攻击力*/
declare let PrimaryAttackBonus: number;
/**护甲减少伤害因子
 * 设此项为a 护甲为x
 * 减少值为 ax/(ax+1)*/
declare let ArmorReducesDamageFactor: number;

declare interface SolarSettings {
    /**挂机模式*/
    isSuspendMode?: boolean
    /**无尽模式*/
    isEndlessMode?: boolean
    /**游戏模式 其他游戏模式*/
    gameMode?: string
    /**游戏难度*/
    gameDifficulty?: number
    /**最大游戏难度*/
    maxGameDifficulty?: number
    /**数值系数*/
    valueCoefficient?: number
    /**敌人上限*/
    enemyUpperLimit?: number
    /**特效显示*/
    isEffectDisplay?: boolean
    /**播放音效*/
    isPlaySoundEffect?: boolean
    /**播放背景音乐*/
    isPlayBackgroundMusic?: boolean
    /**天气效果显示*/
    isWeatherEffectDisplay?: boolean
    /**伤害显示*/
    isDamageDisplay?: boolean
    /**物品锁*/
    isItemLocks?: { [playerId: number]: boolean }
    /**区域锁*/
    isRectLocks?: { [playerId: number]: boolean }
    /**自动施法*/
    isAutoCasts?: { [playerId: number]: boolean }

    [key: string]: any
}

/**
 * 太阳用户自定义值
 */
declare interface SolarData {
    /**太阳属性*/
    _SL_solarAtrribute?: SolarAtrribute
    /**当前由单位物品栏里累加的属性值*/
    _SL_totalItemsSolarAtrribute?: SolarAtrribute
    /**当前由单位所有buff(增益效果)累加的属性值*/
    _SL_totalBuffsSolarAtrribute?: SolarAtrribute
    /**太阳buff 集合*/
    _SL_solarBuffSet?: { [buffTypeId: string]: any }

    // _SL_solarBuffSet?: { [buffTypeId: string]: Buff }
    [key: string]: any
}//& any
/**
 * 基础属性 与游戏原生属性 直接对应
 * 扩展原生限制21亿 做大数值可使用这些属性来辅助记录属性
 * 绿字属性走UnitUtil.setExtraXXX getExtraXXX
 */
declare interface BaseAtrribute {
    //玩家
    /**现有黄金*/
    _SL_BA_gold?: number
    _SL_BA_gold_temp?: number
    /**现有木材*/
    _SL_BA_lumber?: number
    _SL_BA_lumber_temp?: number
    //单位
    /**基础伤害 白字攻击*/
    _SL_BA_damage_base?: number
    /**基础护甲 白字护甲*/
    _SL_BA_armor?: number
    // /**附加伤害 绿字攻击*/
    // _SL_BA_damage_bonus?: number
    // /**附加护甲 绿字护甲*/
    // _SL_BA_armor_bonus?: number
    //英雄
    /**基础力量 白字力量*/
    _SL_BA_str?: number
    /**基础敏捷 白字敏捷*/
    _SL_BA_agi?: number
    /**基础智力 白字智力*/
    _SL_BA_int?: number
    // /**附加力量 绿字力量*/
    // _SL_BA_str_bonus?: number
    // /**附加敏捷 绿字敏捷*/
    // _SL_BA_agi_bonus?: number
    // /**附加智力 绿字智力*/
    // _SL_BA_int_bonus?: number

}

/**
 * 太阳扩展属性系统
 * 由属性词条 与 实数值 组成
 */
declare interface SolarAtrribute extends BaseAtrribute {
    attack?: number, //攻击
    attack_p?: number,//攻击百分比
    life?: number,
    life_p?: number,
    mana?: number, //魔法
    mana_p?: number,
    def?: number,//护甲
    def_p?: number,
    /**全属性*/
    full_property?: number,
    full_property_p?: number,
    /**力量*/
    strength?: number,
    /**力量百分比*/
    strength_p?: number,
    /**敏捷*/
    agility?: number,
    agility_p?: number,
    /**智力*/
    intelligence?: number,
    intelligence_p?: number,
    attackSpd_p?: number,//攻击速度 0.5 = 50%
    /**移动速度 1-522*/
    move_speed?: number,
    /**攻击间隔*/
    damage_cool?: number,//攻击间隔 -0.1 = 减少0.1秒攻击间隔
    /**攻击范围*/
    damage_range?: number,//攻击范围 600 = 增加600攻击范围
    /**物理暴击几率*/
    physical_critical_chance?: number,
    /**物理暴击伤害*/
    physical_critical_damage?: number,
    /**物理增伤*/
    physical_damage_increased?: number,
    /**法术暴击几率*/
    magic_critical_chance?: number,
    /**法术暴击伤害*/
    magic_critical_damage?: number,
    /**法术增伤*/
    magic_damage_increased?: number,
    /**全伤害增幅*/
    damage_increased?: number,
    /**伤害减免*/
    damage_reduction?: number,
    /**伤害吸血*/
    blood_sucking?: number,

    /**     自定义伤害类型 增伤与减免 如自定义金木水火土 增伤与抗性
     根据伤害类型的id（damageType） 增幅 比如神圣伤害 闪电伤害 火焰伤害 冰冻伤害 等等加成 damageType取值 0-31
     key为 "damage_increased_dt_"+damageType  x为damageType 0.5=增加50%伤害
     // [damage_increased_dt_x: string]: number,//特定伤害类型 增幅
     // [damage_reduction_dt_x: string]: number,//特定伤害类型 减免
     */

    //自定义的其他属性词条
    [custom_key: string]: number | string,

}

/**
 * 太阳伤害事件
 */
declare interface SolarDamageEvent {
    //基础
    /*** 基础伤害值 =GetEventDamage()*/
    readonly baseDamage: number,
    /*** 伤害类型 0-31*/
    readonly damageType: number,
    /*** 武器类型 0-23*/
    readonly weaponType: number,
    /*** 受害单位*/
    readonly unit0: unit,
    /*** 伤害来源单位*/
    readonly unit1: unit,
    /*** 受害单位 太阳属性 可能为空 */
    readonly u0sa?: AppAttribute,
    /*** 伤害来源单位 太阳属性 可能为空 */
    readonly u1sa?: AppAttribute,
    /*** 是否攻击伤害 */
    isAttack: boolean,
    /*** 是否远程 */
    isRanged: boolean,
    /*** 是否物理 */
    isPhysical: boolean,
    //扩展值
    /*** 是否已消耗 当设置此值为true时将跳过后续伤害处理器*/
    consumed?: boolean
    /*** 是否暴击 */
    isCritical?: boolean
    /*** 返回最终造成的伤害值 会被EXSetEventDamage(resultDamage)设置到最终伤害*/
    resultDamage?: number

    //自定义的其他数据字段
    [custom_key: string]: any,
}

/**
 *  buff = （增益）效果 修改器
 * 太阳模拟buff 系统
 * buff类型 可以根据类型创建对单个单位起作用的buff
 */
declare interface SolarBuffType {

    /**基础事件*/
    /**当创建时*/
    onCreated?: (buff) => void
    /**当buff系统循环更新此buff时的回调 tpf=每次更新的间隔 毫秒单位*/
    onUpdate?: (buff, tpf: number) => void
    /**当循环间隔到时 比如每2秒造成伤害 持续6秒 则每2秒时会回调用此方法*/
    onInterval?: (buff) => void
    /**buff结束时 返回false可以停止销毁 让buff继续执行*/
    onDestroy?: (buff) => boolean | void
    /**当buff 叠加层数改变时 的回调函数*/
    onStackCountChange?: (buff) => void

    /**基础属性*/
    /**id*/
    id: string,
    /**Lv.1 增益效果类型的类别 传统狭义的buff可使用基础 (羁绊等任意状态附加也是增益效果哦)*/
    class?: "基础" | "羁绊" | "商城" | "存档" | "神器" | "境界" | "入体装备" | "法宝" | "丹药" | "奇遇" | "套装" | "奖励" | "AI" | string,
    /**Lv.2 种类(可做同类buff覆盖的效果标记)*/
    kind?: string,
    /**Lv.3 标签(可对指定标签的buff做特殊操作)*/
    tag?: string,
    // /**唯一种类*/
    // isUniqueKind?: boolean,
    name?: string,
    ubertip?: string,
    /**要求提示*/
    requiredTip?: string,
    /**持续时间 秒单位*/
    dur?: number,
    /**层数减少时间模式，*/
    stackDurMode?: boolean,
    /**间隔 秒单位*/
    interval?: number,
    stackCountMax?: number,
    /**优先权*/
    priority?: number,
    isDebuff?: boolean,
    art?: string,
    /**模型效果附加节点*/
    targetAttach?: string,
    /**效果模型路径*/
    targetArt?: string,
    /**属性附加*/
    atrribute?: AppAttribute,

    [key: string]: any
}