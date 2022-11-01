import TargetType, {OptionType} from "../../constant/TargetType";

/**
 * 设置技能
 */
export default class AbilityUtil {

    /**
     * 转换目标允许为数字
     */
    static targets2Num(str: string) {
        if (!str) {
            return
        }
        let result = 0;
        let data: string[] = str.split(",")
        for (let name of data) {
            let flag = TargetType[name]
            if (!flag) {
                print('错误的目标允许类型: ' + name);
            }
            result = result + flag;
        }
        return result;
    }

    /**
     * 转换图标选项为数字
     */
    static option2Num(str: string) {
        if (!str) {
            return
        }
        let result = 0;
        let data: string[] = str.split(",")
        for (let name of data) {
            let flag = OptionType[name]
            if (!flag) {
                print('错误的图标选项类型: ' + name);
            }
            result = result + flag;
        }
        return result;
    }

    /**
     * 设置单位技能名字
     * @param udw 修改技能单位
     * @param abilityId 修改的技能id
     * @param name 修改技能的名字
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityName(udw: unit, abilityId: number | string, name: string, isref: boolean = false) {
        if (!name) {
            print("不存在技能名字");
        }
        EXSetAbilityDataString(EXGetUnitAbility(udw, abilityId), 1, ABILITY_DATA_NAME, name)
        EXSetAbilityDataString(EXGetUnitAbility(udw, abilityId), 1, ABILITY_DATA_TIP, name)
        if (isref) {
            IncUnitAbilityLevel(udw, abilityId)
            DecUnitAbilityLevel(udw, abilityId)
        }
    }

    /**
     * 设置单位技能图标
     * @param udw 修改技能单位
     * @param abilityId 修改的技能id
     * @param art 修改技能的图标路径
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityArt(udw: unit, abilityId: number | string, art: string, isref: boolean = false) {
        if (!art) {
            print("不存在技能图标路径");
        }
        EXSetAbilityDataString(EXGetUnitAbility(udw, abilityId), 1, ABILITY_DATA_ART, art)
        if (isref) {
            IncUnitAbilityLevel(udw, abilityId)
            DecUnitAbilityLevel(udw, abilityId)
        }
    }

    /**
     * 设置单位技能提示拓展
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Ubertip 修改技能的提示拓展
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityUbertip(udw: unit, skid: number | string, Ubertip: string, isref: boolean = false) {
        if (!Ubertip) {
            print("不存在技能提示拓展");
        }
        EXSetAbilityDataString(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_UBERTIP, Ubertip)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置技能data A
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityDataA(udw: unit, skid: number | string, data: number, isref: boolean = false) {
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_DATA_A, data)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置通魔技能目标类型
     * @param udw 修改技能单位
     * @param skid 修改的技能id （以通魔为模板的技能id）
     * 无目标 TARGET_TYPE_NONE = 0;
     * 单位目标 TARGET_TYPE_UNIT = 1;
     * 点目标 TARGET_TYPE_POINT = 2;
     * 单位或点 TARGET_TYPE_UNIT_OR_POINT = 3;
     * @param target_type
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitANclAbilityTarget(udw: unit, skid: number | string, target_type: 0 | 1 | 2 | 3, isref: boolean = false) {
        AbilityUtil.setUnitAbilityDataB(udw, skid, target_type, isref)
    }

    /**
     * 设置技能data B
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityDataB(udw: unit, skid: number | string, DataB: number, isref: boolean = false) {
        if (!DataB) {
            print("不存在技能图标路径");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_DATA_B, DataB)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置通魔技能选项
     * ANcl = 通魔
     * @param udw 修改技能单位
     * @param skid 修改的技能id （以通魔为模板的技能id）
     * @param options
     * 图标可见    visible
     * 目标选取图像 targimage
     * 物理魔法    physical
     * 通用魔法    universal
     * 单独释放    unique
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitANclAbilityOption(udw: unit, skid: number | string, options: string, isref: boolean = false) {
        if (!options) {
            print("不存在技能选项");
        }
        let data = AbilityUtil.option2Num(options)
        AbilityUtil.setUnitAbilityDataC(udw, skid, data, isref)
    }

    /**
     * 设置技能data C
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityDataC(udw: unit, skid: number | string, data: number, isref: boolean = false) {
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_DATA_C, data)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置技能data D
     * @param udw
     * @param skid
     * @param data
     * @param isref
     */
    static setUnitAbilityDataD(udw: unit, skid: number | string, data: number, isref: boolean = false) {
        if (!data) {
            print("不存在技能选项");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_DATA_D, data)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置技能目标允许
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Targs 修改技能的目标允许
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityTargs(udw: unit, skid: number | string, Targs: string, isref: boolean = false) {
        if (!Targs) {
            print("不存在技能目标允许");
        }
        let data = AbilityUtil.targets2Num(Targs)
        EXSetAbilityDataInteger(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_TARGS, R2I(data))
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置技能释放间隔
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Cool 修改技能的释放间隔
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityCool(udw: unit, skid: number | string, Cool: number, isref: boolean = false) {
        if (typeof skid === 'string') {
            skid = FourCC(skid)
        }
        if (!Cool) {
            print("不存在技能释放间隔");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_COOL, Cool)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置技能魔法消耗
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Cost 修改技能的魔法消耗
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityCost(udw: unit, skid: number | string, Cost: number, isref: boolean = false) {
        if (!Cost) {
            print("不存在技能魔法消耗");
        }
        EXSetAbilityDataInteger(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_CAST, Cost)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置技能施法距离
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Rng 修改技能的施法距离
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityRng(udw: unit, skid: number | string, Rng: number, isref: boolean = false) {
        if (!Rng) {
            print("不存在技能施法距离");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_RNG, Rng)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 设置技能影响区域
     * @param udw 修改技能单位
     * @param skid 修改的技能id
     * @param Area 修改技能的影响区域
     * @param isref 是否刷新数据（提升技能等级）
     * @returns
     */
    static setUnitAbilityArea(udw: unit, skid: number | string, Area: number, isref: boolean = false) {
        if (!Area) {
            print("不存在技能影响区域");
        }
        EXSetAbilityDataReal(EXGetUnitAbility(udw, skid), 1, ABILITY_DATA_AREA, Area)
        if (isref) {
            IncUnitAbilityLevel(udw, skid)
            DecUnitAbilityLevel(udw, skid)
        }
    }

    /**
     * 获取施法位置xy
     * @param attype == 0 无目标
     * @param attype == 1 单位目标
     * @param attype == 2 点目标
     * @param attype == 3 单位或点目标
     * @param store
     */
    static getSpellXY(attype: number, store?: any): { x: number, y: number } {
        if (!store) {
            store = {};
        }
        //无目标
        if (attype == 0) {
            store.x = GetUnitX(GetTriggerUnit())
            store.y = GetUnitY(GetTriggerUnit())
        }
        //单位目标
        if (attype == 1) {
            store.x = GetUnitX(GetSpellTargetUnit())
            store.y = GetUnitY(GetSpellTargetUnit())
        }
        //点目标
        if (attype == 2) {
            store.x = GetSpellTargetX()
            store.y = GetSpellTargetY()
        }
        //单位或点目标
        if (attype == 2) {
            //是点
            if (GetSpellTargetX() != 0 && GetSpellTargetY() != 0) {
                store.x = GetSpellTargetX()
                store.y = GetSpellTargetY()
            }
            //是单位
            if (GetUnitX(GetSpellTargetUnit()) != 0 && GetUnitY(GetSpellTargetUnit()) != 0) {
                store.x = GetUnitX(GetSpellTargetUnit())
                store.y = GetUnitY(GetSpellTargetUnit())
            }
        }
        return store;
    }
}