import {Trigger} from "./solar/w3ts/handles/trigger";
import {MapPlayer} from "./solar/w3ts/handles/player";
import {heroData} from "./data/units/hero";
import BaseUtil from "./solar/util/BaseUtil";
import {units} from "./data/units/unit";
import initItem from "./data/lib/item";
import {Dao} from "./data/config/items/Dao";

export default function StateInit() {
    CreateUnit(Player(0), 'H001', 0, 0, 270)
    CreateUnit(Player(0), 'H002', 0, 0, 270)
    CreateUnit(Player(0), 'H003', 0, 0, 270)

    CreateUnit(Player(0), 'hvlt', 300, 300, 270)

    initItem();

    // 单位被攻击
    let tri = new Trigger()
    tri.registerPlayerUnitEvent(MapPlayer.fromIndex(0), EVENT_PLAYER_UNIT_ATTACKED, null)
    tri.addAction(() => {
        let unit = GetTriggerUnit();
        let typeId = id2string(GetUnitTypeId(unit));
        let unitData = heroData.get(typeId)
        if (unitData != null) {
            print_r('暴击率：' + unitData.hit)
            print_r('最终伤害：' + unitData.damageAdd)
        }
    })

    // 怪物进攻
    let number = 1;
    BaseUtil.onTimer(5, () => {
        let unitData = units[number - 1];
        for (let i = 0; i < 3; i++) {
            CreateUnit(Player(14), unitData.id, 0, 0, 270)
        }
        number++
        return number <= units.length
    })

    new Dao();
    new Dao();
    new Dao();
}
