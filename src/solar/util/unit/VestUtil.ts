/**
 * 马甲工具
 */
import BaseUtil from "solar/util/BaseUtil";

/** @noSelf **/
export default class VestUtil {
    /***  u: 所属玩家单位
     **   x，y：马甲创建的坐标
     **   model：模型路径，默认为空
     **   moveType：默认为没有类型, 作为投射物时填1,为飞行类型
     **   timer: 马甲存活时间,默认为2秒.  填0,为自己排泄
     **   player: 默认不填，填就是为‘玩家所属’创建单位
     */
    static SunCreateVestByUnit(u: unit, x: number = GetUnitX(u), y: number = GetUnitY(u), model: string = "", moveType: number = 0, timer: number = 2, player?: player): unit {
        let mj: unit;
        if (player) {
            mj = CreateUnit(player, FourCC('hrdh'), x, y, 0)
        } else {
            mj = CreateUnit(GetOwningPlayer(u), FourCC('hrdh'), x, y, GetUnitFacing(u))
        }
        DzSetUnitModel(mj, model)
        if (moveType == 1) {
            // 飞行类型
            EXSetUnitMoveType(mj, 0x04)
        } else {
            // 没有类型
            EXSetUnitMoveType(mj, 0x00)
            ShowUnit(mj, false)
        }
        SetUnitPosition(mj, x, y)
        SetUnitMoveSpeed(mj, 0)
        SetUnitState(mj, UNIT_STATE_MAX_MANA, 99999)
        SetUnitState(mj, UNIT_STATE_MANA, 99999)
        UnitAddAbility(mj, FourCC('Aloc'))
        if (timer > 0) {
            BaseUtil.runLater(timer, () => {
                RemoveUnit(mj)
            })
        }
        return mj
    }
}