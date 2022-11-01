// 英雄

import {heroAbilityData} from "../ability/hero";

interface HeroParams {
    id: string;
    // 英雄名字
    name: string;
    // 模型
    model: string;
    // 攻击力
    attack: number;
    // 防御力
    def: number;
    // 生命值
    hp: number;
    // 暴击率
    hit: number;
    // 最终伤害%加成
    damageAdd: number;
    // 技能列表
    abilityData: string[];
}

// 英雄数据
export let heroData = new Map<string, HeroParams>()

// 创建英雄
const createHero = (params: HeroParams): uobj => {
    let description = [
        '攻击力：' + params.attack,
        '防御力：' + params.def,
        '生命值：' + params.hp,
    ]
    heroData.set(params.id, params)
    // 生成技能描述文本
    if (params.abilityData.length > 0) {
        description.push('*******技能*******')
        params.abilityData.forEach(abiId => {
            let data = heroAbilityData.get(abiId)
            if (data != null) {
                description.push(data.Name + ',冷却：' + data.Cool + 's,蓝耗：' + data.Cost)
            }
        })
    }
    return {
        id: params.id,
        _parent: 'Hmkg',
        Name: params.name,
        file: params.model,
        dmgplus1: params.attack + '',
        def: params.def + '',
        HP: params.hp + '',
        Ubertip: description.join('|n'),
        heroAbilList: params.abilityData.join(','),
    }
}

// 导出
export let heros: uobj[] = [
    createHero({
        id: 'H001',
        name: '山丘1',
        model: 'units\\human\\Footman\\Footman',
        attack: 100,
        def: 10,
        hp: 1000,
        hit: 10,
        damageAdd: 100,
        abilityData: ['a001'],
    }),
    createHero({
        id: 'H002',
        name: '山丘2',
        model: 'units\\human\\Footman\\Footman',
        attack: 200,
        def: 20,
        hp: 2000,
        hit: 20,
        damageAdd: 200,
        abilityData: [],
    }),
    createHero({
        id: 'H003',
        name: '山丘3',
        model: 'units\\human\\Footman\\Footman',
        attack: 300,
        def: 30,
        hp: 3000,
        hit: 30,
        damageAdd: 300,
        abilityData: [],
    }),
]


