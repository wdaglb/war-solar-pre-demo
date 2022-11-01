export default class HeroUtil {

    /**
     * 是英雄
     */
    static isHero(handle: unit) {
        return IsHeroUnitId(GetUnitTypeId(handle));
    }


    /**
     * 获取英雄主属性
     */
    static getHeroPrimary(handle: unit): "STR" | "AGI" | "INT" {
        let objIdStr = id2string(GetUnitTypeId(handle));
        let obj = unit[objIdStr];
        return obj.Primary
    }

    /**
     * 获取英雄主属性的属性值
     * includeBonuses (默认 白字加绿字奖励)
     */
    static getHeroPrimaryValue(handle: unit, includeBonuses = true): number {
        let Primary = HeroUtil.getHeroPrimary(handle);
        if (Primary == "STR") {
            return GetHeroStr(handle, includeBonuses)
        } else if (Primary == "AGI") {
            return GetHeroAgi(handle, includeBonuses)
        } else if (Primary == "INT") {
            return GetHeroInt(handle, includeBonuses)
        }
        return 0;
    }

    /**
     * 获取英雄绿字主属性
     * @param handle
     */
    static getHeroPrimaryBonusValue(handle: unit): number {
        let Primary = HeroUtil.getHeroPrimary(handle);
        if (Primary == "STR") {
            return GetHeroStr(handle, true) - GetHeroStr(handle, false)
        } else if (Primary == "AGI") {
            return GetHeroAgi(handle, true) - GetHeroAgi(handle, false)
        } else if (Primary == "INT") {
            return GetHeroInt(handle, true) - GetHeroAgi(handle, false)
        }
        return 0;
    }


}