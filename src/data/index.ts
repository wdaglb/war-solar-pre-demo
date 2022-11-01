import {heros} from "./units/hero";
import {units} from "./units/unit";
import {heroAbility} from "./ability/hero";
import {itemData} from "./lib/item";

// 全局单位
export let global_units: uobj[] = [
    ...heros,
    ...units,
]

// 全局技能
export let global_ability: aobj[] = [
    ...heroAbility,
]

// 全局物品
export let global_items: iobj[] = [
    ...itemData,
]
