import CameraUtil from "./CameraUtil";

const message: NoSelf = require('jass.message');
export default class GuiUtil {


    /**
     * 是否是在目标选择界面
     */
    static isInSelectUi() {
        let a1: number
        let a2: number
        let a3: number
        [a1, a2, a3] = message.button(3, 2)
        return a2 == 0xD000B
    }

    /**
     * 是否是在魔法书界面
     */
    static isInMagicBookUi() {
        let a1: number
        let a2: number
        let a3: number
        [a1, a2, a3] = message.button(3, 2)
        return a2 == 0xD0007
    }

    /**
     * 单位是否在屏幕内
     */
    static isUnitInScreen(udw: unit): boolean {
        let x = GetUnitX(udw)
        let y = GetUnitY(udw)
        let sjxy = CameraUtil.getScreenCoordinates(x, y, 0)
        if (sjxy.x > 0.8 || sjxy.x < 0) {
            return false
        }
        if (sjxy.y > 0.6 || sjxy.y < 0) {
            return false
        }
        return true
    }


}