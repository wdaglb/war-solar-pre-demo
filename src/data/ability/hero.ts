// 英雄技能

interface AbilityParams extends aobj {
    // 自定义属性

    hit?: string;
}

export let heroAbility: aobj[] = []

// 技能数据
export let heroAbilityData = new Map<string, AbilityParams>()

// 创建英雄技能
const createHeroAbility = (params: AbilityParams) => {
    params.Tip = params.Name + '(' + params.Hotkey + ')'
    params.Researchhotkey = params.Hotkey
    params.Researchtip = '学习' + params.Name + '(' + params.Hotkey + ')'
    heroAbilityData.set(params.id, params)
    heroAbility.push({
        ...params,
    })
}

createHeroAbility({
    id: 'a001',
    _parent: 'AHtb',
    Name: '锤子',
    Hotkey: 'Q',
    levels: '1',
    Cost: '1',
    Cool: '2',
    Rng: '1000',
    hit: '100',
})
