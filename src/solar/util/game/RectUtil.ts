import {Rectangle} from "solar/w3ts/handles/rect";

/** @noSelf **/
export default class RectUtil {


    /**
     * 用完记得rect.destroy() 排泄
     * @param centerX
     * @param centerY
     * @param radius
     * @constructor
     */
    static GetRectFromCircle(centerX: number, centerY: number, radius: number): Rectangle {
        return new Rectangle(centerX - radius, centerY - radius, centerX + radius, centerY + radius)
    }

}
