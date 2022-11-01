/**
 共计32种伤害类型 可以自行对应这些类型到自己的设计的属性上
 */
enum DamageType {
    //base
    /**未知   */T0_UNKNOWN = 0,
    /**普通   */T4_NORMAL = 4,
    /**强化   */T5_ENHANCED = 5,
    /**火焰   */T8_FIRE = 8,
    /**冰冻   */T9_COLD = 9,
    /**闪电   */T10_LIGHTNING = 10,
    /**毒药   */T11_POISON = 11,
    /**疾病   */T12_DISEASE = 12,
    /**神圣   */T13_DIVINE = 13,
    /**魔法   */T14_MAGIC = 14,
    /**音速   */T15_SONIC = 15,
    /**酸性   */T16_ACID = 16,
    /**力量   */T17_FORCE = 17,
    /**死亡   */T18_DEATH = 18,
    /**精神   */T19_MIND = 19,
    /**植物   */T20_PLANT = 20,
    /**防御   */T21_DEFENSIVE = 21,
    /**破坏   */T22_DEMOLITION = 22,
    /**慢性毒药*/T23_SLOW_POISON = 23,
    /**灵魂锁链*/T24_SPIRIT_LINK = 24,
    /**暗影突袭*/T25_SHADOW_STRIKE = 25,
    /**通用   */T26_UNIVERSAL = 26,
    //solar addon
    /**自定义伤害类型 */T1_C = 1,
    /**自定义伤害类型 */T2_C = 2,
    /**自定义伤害类型 */T3_C = 3,
    /**自定义伤害类型 */T6_C = 6,
    /**自定义伤害类型 */T7_C = 7,
    /**自定义伤害类型 */T27_C = 27,
    /**自定义伤害类型 */T28_C = 28,
    /**自定义伤害类型 */T29_C = 29,
    /**自定义伤害类型 */T30_C = 30,
    /**自定义伤害类型 */T31_C = 31,
}

export default DamageType


