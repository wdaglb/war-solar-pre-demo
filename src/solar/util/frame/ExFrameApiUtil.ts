import BaseUtil from "../BaseUtil";
import DataBase from "../../common/DataBase";
import {STimer} from "../../tool/STimer";
import AsyncUtil from "../net/AsyncUtil";


export default class ExFrameApiUtil {


    /**
     * 设置小地图显示单位头像
     * (可以在物编里隐藏原生的英雄单位小地图显示)
     * @param unit 单位
     * @param head_pic_path 头像路径
     * @param picSize 头像大小
     */
    static setUnitMapHeadPortrait(unit: unit, head_pic_path: string, picSize = 0.01): STimer {
        const head_ui = DzCreateFrameByTagName("BACKDROP", 'ExFrameApiUtil_' + AsyncUtil.getUUIDAsync(), DzGetGameUI(), "template", 0)
        DzFrameSetSize(head_ui, picSize, picSize)
        DzFrameSetTexture(head_ui, head_pic_path, 0)
        const width = GetRectWidthBJ(GetPlayableMapRect())
        const height = GetRectHeightBJ(GetPlayableMapRect())
        // 世界地图与小地图的比例  原生的大小：0.1420116
        // let ratio = 0.1420116
        const w = 0.112 / width
        const h = 0.113 / height
        DataBase.getUnitSolarData(unit)._sl_head_ui = head_ui;
        return BaseUtil.onTimer(0.1, () => {
            if (DataBase.getUnitSolarData(unit, false)?._sl_head_ui == null) {
                DzDestroyFrame(head_ui)
                return false
            }
            const x = GetUnitX(unit) * w
            const y = GetUnitY(unit) * h
            DzFrameSetPoint(head_ui, 4, DzFrameGetMinimap(), 4, x, y)
            return true
        });
    }


    /**
     * 用于将自己的Frame 绑定到原生的SimpleFrame 中
     * parentSimpleFrame 父节点
     */
    static createBaseFrameInSimpleFrame(parentSimpleFrame: number): number {
        let uuid = AsyncUtil.getUUIDAsync();
        DzCreateSimpleFrame("_sl_simpleframe_and_frame", parentSimpleFrame, uuid)
        return DzFrameFindByName("_sl_simpleframe_and_frame_frame", uuid)
    };


}