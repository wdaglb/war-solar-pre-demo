/** @noSelfInFile */
/**
 * 太阳框架
 */
/**
 * 游戏难度
 * @deprecated 迁移到 settings.gameDifficulty
 */
declare let gameDifficulty: number


/**
 * 大属性模式 (属性可突破100万 21亿限制  达到数百涧 涧=10的36次方)
 * (此模式下 会重写一些与属性相关的函数 如玩家金币 木材 单位的攻击护甲 英雄的3维等)
 * 默认为false 不开启大属性模式
 * （在大属性模式下 不能斤斤计较）
 * see atrribute/BigAttributeCompatibleState
 */
declare let isBigAttributeMode: boolean

/**
 * 太阳伤害系统 是否启用
 */
declare let isSolarDamageEnable: boolean

/**
 * 游戏设置
 * 比如伤害显示 物品锁 或其他设置
 */
declare let settings: AppSettings


declare interface SolarGlobalVariable {
    /**
     * 下一波倒计时
     */
    nextWaveCountdown?: number
}

/**
 *  全局变量
 */
declare let gv: AppGlobalVariable

/**
 *  太阳事件总线自定义事件类型
 */
declare interface SolarEventType {
    "选择模式": string
    "选择难度": number
    "开始出怪": void
    "双击选择单位": unit
    "游戏结束": void
}

/**
 * 第一个参数url = 需要请求的网址
 *
 * 第二个参数data = 需要发送请求报文数据
 *
 * 第三个参数onResult = http响应后的异步回调，记得使用同步方法同步到其他玩家
 * @deprecated 不要收集玩家用户的信息 以免触犯规则
 */
declare function HttpRequest(url: string, data: string, onResult: (result: string) => void): any;


declare function char2number(char: string): number;

