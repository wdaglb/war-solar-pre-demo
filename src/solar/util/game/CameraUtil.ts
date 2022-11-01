export default class CameraUtil {


    /*
配合单位血条高度 可以模拟血条
配合UI文本 可以实现自定义的字体的UI跳字
配合UI 可以实现在多个掉落物品上提示文本 传奇那种装备爆满地
配合UI 可以画英雄称号 商店标题 等等
     */
    /**
     * 根据世界坐标转屏幕坐标
     * @param x
     * @param y
     * @param z
     * 返回值
     * 屏幕x轴 左到右 0 ~ 0.8
     * 屏幕y轴 下到上 0 ~ 0.6
     */
    static getScreenCoordinates(x: number, y: number, z: number = 150): { x: number, y: number } {
        if (isEmbedJapi) {
            const [sx, sy, ss] = world_to_screen(x, y, z)
            return {x: sx, y: 0.6 - sy}
        }

        let y1 = GetCameraEyePositionY()
        let x1 = GetCameraEyePositionX()
        let z1 = GetCameraEyePositionZ()
        let w = (DzGetWindowWidth() - 20) / 2
        let h = (DzGetWindowHeight() - 20)
        let a = GetCameraField(ConvertCameraField(3)) * 180 / 3.14159265358979323846
        let b = 360 - GetCameraField(ConvertCameraField(2)) * 180 / 3.14159265358979323846

        y += z * (y - y1) / z1

        let sy = 0.3 * (y - y1 - (z1 / Math.tan(b + a / 2))) * Math.sin(b + a / 2) / (z1 * Math.sin(a / 2) * (Math.sin(b) + (Math.cos(b) * (y - y1) / z1)))
        sy = (sy - 0.3) * 1.66 + 0.3
        let sx = (0.4 * (x - x1) / w) / (1 + 1 / (((y - y1) * (z1 / (y - y1) * Math.tan(b) + 1) / (y - y1 - (z1 / Math.tan(b + a / 2)))) - 1))

        let c = 235
        let d = 56 * c - 10500
        let sx1 = 0.03 * (w + b * c - d) / h
        sx = (sx + sx1) * 0.4 / sx1
        return {x: sx, y: sy}
    }


    /*
            let a = 16.1//35*0.46
        let b = 56
        let y1 = GetCameraEyePositionY()
        let x1 = GetCameraEyePositionX()
        let z1 = GetCameraEyePositionZ()
        let w = (DzGetWindowWidth() - 20) / 2
        let h = (DzGetWindowHeight() - 20)

        let cy = y + (z * (y - y1) / (z1 - z))
        let cx = x + (z * (x - x1) / (z1 - z))

        let ty = cy - y1

        w = (w * z1) * 0.85 / h

        let sy = 540 * (ty - (z1 / Tan(b + a))) * Sin(b + a) / (z1 * Sin(a) * (Sin(b) + (Cos(b) * (ty) / z1)))
        let sx = (960 * (cx - x1) / w) / (1 + 1 / (((ty) * (z1 / (ty) * Tan(b) + 1) / (ty - (z1 / Tan(b + a)))) - 1)) + 960

        sy = sy * (790 / 1080) + 250

        return {x: sx, y: sy}
     */

    /**
     * 设置镜头高度
     */
    static setCameraHeight(height: number, whichPlayer?: player) {
        if (whichPlayer) {
            if (GetLocalPlayer() == whichPlayer) {
                SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, height, 0)
            }
        } else {
            SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, height, 0)
        }

    }

    /**
     * 平移镜头高度
     */
    static moveCamera2xy(x: number, y: number, whichPlayer?: player, duration = 0) {
        if (whichPlayer) {
            if (GetLocalPlayer() == whichPlayer) {
                PanCameraToTimed(x, y, duration)
            }
        } else {
            PanCameraToTimed(x, y, duration)
        }
    }

    /**
     * 移动今天到单位位置
     * @param unit
     * @param whichPlayer
     * @param duration
     */
    static moveCamera2unit(unit: unit, whichPlayer: player = GetOwningPlayer(unit), duration = 0) {
        if (GetLocalPlayer() == whichPlayer) {
            PanCameraToTimed(GetUnitX(unit), GetUnitY(unit), duration)
        }
    }
}


