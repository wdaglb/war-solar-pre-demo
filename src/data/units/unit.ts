// 敌人

interface UnitParams {
    // 模型
    model: string;
}

export let units: uobj[] = []

// 等级
let lv = 1;
// 基础攻击力
const baseAttack = 100;
// 基础防御力
const baseDef = 10;
// 基础生命值
const baseHp = 1000;

// 创建敌人
const createUnit = (params: UnitParams) => {
    let lvStr = '';
    if (lv < 10) {
        lvStr = '0' + lv
    } else {
        lvStr = lv + ''
    }
    units.push({
        id: 'u0' + lvStr,
        _parent: 'ogru',
        Name: '进攻怪lv' + lv,
        file: params.model,
        dmgplus1: (baseAttack * lv) + '',
        def: (baseDef * lv) + '',
        HP: (baseHp * lv) + '',
    })
    lv++
}

let models = [
    'units\\orc\\Grunt\\Grunt',
    'units\\orc\\WolfRider\\WolfRider',
    'units\\orc\\Tauren\\Tauren',
    'units\\orc\\HeadHunter\\HeadHunter',
]
models.forEach(model => {
    createUnit({
        model,
    })
})
