/** @noSelfInFile **/

import {Handle} from "./handle";
import {Widget} from "./widget";

export class Effect extends Handle<effect> {

    /**特效对象 */
    private _data: any

    get data(): any {
        if (!this._data) {
            this._data = {}
        }
        return this._data;
    }

    set data(value: any) {
        this._data = value;
    }

    constructor(modelName: string, x: number, y: number);
    constructor(modelName: string, targetWidget: Widget, attachPointName: string);
    constructor(modelName: string, a: number | Widget, b: number | string) {
        if (Handle.initFromHandle()) {
            super();
        } else if (typeof a === "number" && typeof b === "number") {
            super(AddSpecialEffect(modelName, a, b));
        } else if (typeof a !== "number" && typeof b === "string") {
            super(AddSpecialEffectTarget(modelName, a.handle, b));
        }
    }

    // public get scale() {
    //   return BlzGetSpecialEffectScale(this.handle);
    // }
    //
    // public set scale(scale: number) {
    //   BlzSetSpecialEffectScale(this.handle, scale);
    // }

    /**
     * Warning: asynchronous
     */
    // public get x() {
    //   return BlzGetLocalSpecialEffectX(this.handle);
    // }
    //
    // public set x(x: number) {
    //   BlzSetSpecialEffectX(this.handle, x);
    // }

    /**
     * Warning: asynchronous
     */
    // public get y() {
    //   return BlzGetLocalSpecialEffectY(this.handle);
    // }
    //
    // public set y(y: number) {
    //   BlzSetSpecialEffectY(this.handle, y);
    // }
    //
    // /**
    //  * Warning: asynchronous
    //  */
    // public get z() {
    //   return BlzGetLocalSpecialEffectZ(this.handle);
    // }
    //
    // public set z(z: number) {
    //   BlzSetSpecialEffectZ(this.handle, z);
    // }
    //
    // public addSubAnimation(subAnim: subanimtype) {
    //   BlzSpecialEffectAddSubAnimation(this.handle, subAnim);
    // }
    //
    // public clearSubAnimations() {
    //   BlzSpecialEffectClearSubAnimations(this.handle);
    // }

    // public playAnimation(animType: animtype) {
    //   BlzPlaySpecialEffect(this.handle, animType);
    // }
    //
    // public playWithTimeScale(animType: animtype, timeScale: number) {
    //   BlzPlaySpecialEffectWithTimeScale(this.handle, animType, timeScale);
    // }
    //
    // public removeSubAnimation(subAnim: subanimtype) {
    //   BlzSpecialEffectRemoveSubAnimation(this.handle, subAnim);
    // }
    //
    // public resetScaleMatrix() {
    //   BlzResetSpecialEffectMatrix(this.handle);
    // }
    //
    // public setAlpha(alpha: number) {
    //   BlzSetSpecialEffectAlpha(this.handle, alpha);
    // }
    //
    // public setColor(red: number, green: number, blue: number) {
    //   BlzSetSpecialEffectColor(this.handle, red, green, blue);
    // }
    //
    // public setColorByPlayer(whichPlayer: MapPlayer) {
    //   BlzSetSpecialEffectColorByPlayer(this.handle, whichPlayer.handle);
    // }
    //
    // public setHeight(height: number) {
    //   BlzSetSpecialEffectHeight(this.handle, height);
    // }
    //
    // public setOrientation(yaw: number, pitch: number, roll: number) {
    //   BlzSetSpecialEffectOrientation(this.handle, yaw, pitch, roll);
    // }

    // public setPitch(pitch: number) {
    //   BlzSetSpecialEffectPitch(this.handle, pitch);
    // }
    //
    // public setPoint(p: Point) {
    //   BlzSetSpecialEffectPositionLoc(this.handle, p.handle);
    // }
    //
    // public setPosition(x: number, y: number, z: number) {
    //   BlzSetSpecialEffectPosition(this.handle, x, y, z);
    // }
    //
    // public setRoll(roll: number) {
    //   BlzSetSpecialEffectRoll(this.handle, roll);
    // }
    //
    // public setScaleMatrix(x: number, y: number, z: number) {
    //   BlzSetSpecialEffectMatrixScale(this.handle, x, y, z);
    // }
    //
    // public setTime(value: number) {
    //   BlzSetSpecialEffectTime(this.handle, value);
    // }
    //
    // public setTimeScale(timeScale: number) {
    //   BlzSetSpecialEffectTimeScale(this.handle, timeScale);
    // }

    // public setYaw(y: number) {
    //   BlzSetSpecialEffectYaw(this.handle, y);
    // }

    /**
     * 新建特效(创建到坐标)
     */
    public static createEffect(modelName: string, x: number, y: number) {
        return new Effect(modelName, x, y);
    }

    /**
     * 新建特效(创建到坐标)
     */
    public static createEffectTarget(modelName: string, a: Widget, b: string) {
        return new Effect(modelName, a, b);
    }

    /**
     * 设置特效大小
     */
    public set effectSize(size: number) {
        EXSetEffectSize(this.handle, size)
        SetPariticle2Size(this.handle, size)
        this._data.size = size
    }

    /**
     * 获取特效大小
     */
    public get effectSize() {
        let size = this._data.size
        if (!size) {
            size = EXGetEffectSize(this.handle)
        }
        return size
    }

    /**
     * 设置特效高度
     */
    public set effectZ(Z: number) {
        EXSetEffectZ(this.handle, Z)
        this._data.z = Z
    }

    /**
     * 获取特效高度
     */
    public get effectZ() {
        let z = this._data.z
        if (!z) {
            z = EXGetEffectZ(this.handle)
        }
        return z
    }

    /**
     * 设置特效播放速度
     */
    public set effectSpeed(Speed: number) {
        EXSetEffectSpeed(this.handle, Speed)
        this._data.Speed = Speed
    }

    /**
     * 获取特效播放速度
     */
    public get effectSpeed() {
        return this._data.Speed
    }

    /**
     * 设置特效颜色
     */
    public set effectColor(Color: number) {
        EXSetEffectColor(this.handle, Color)
        this._data.color = Color
    }

    /**
     * 获取特效颜色
     */
    public get effectColor() {
        let Color = this._data.color
        if (!Color) {
            Color = EXGetEffectColor(this.handle)
        }
        return Color
    }

    /**
     * 设置迷雾可见特效
     */
    public set effectFogVisible(fogvisible: boolean) {
        EXSetEffectFogVisible(this.handle, fogvisible)
        this._data.fogvisible = fogvisible
    }

    /**
     * 获取特效迷雾可见情况
     */
    public get effectFogVisible() {
        return this._data.fogvisible
    }

    /**
     * 设置特效可见
     */
    public set effectVisible(visible: boolean) {
        EXSetEffectVisible(this.handle, visible)
        this._data.visible = visible
    }

    /**
     * 设置特效可见
     */
    public get effectVisible() {
        return this._data.visible
    }

    /**
     * 设置特效Z轴旋转
     */
    public set effectRotateZ(z: number) {
        this.reset()
        EXEffectMatRotateZ(this.handle, z)
        this._data.rotateZ = z
    }

    /**
     * 获取特效Z轴旋转
     */
    public get effectRotateZ() {
        return this._data.rotateZ
    }

    /**
     * 设置特效X轴旋转
     */
    public set effectRotateX(x: number) {
        EXEffectMatRotateX(this.handle, x)
        this._data.rotateX = x
    }

    /**
     * 获取特效X轴旋转
     */
    public get effectRotateX() {
        return this._data.rotateX
    }

    /**
     * 设置特效Y轴旋转
     */
    public set effectRotateY(y: number) {
        EXEffectMatRotateY(this.handle, y)
        this._data.rotateY = y
    }

    /**
     * 获取特效Y轴旋转
     */
    public get effectRotateY() {
        return this._data.rotateY
    }

    /**
     * 移动特效到XY
     */
    public setEffectXY(x: number, y: number) {
        EXSetEffectXY(this.handle, x, y)
        this._data.x = x
        this._data.y = y
    }

    /**
     * 获取特效XY轴
     */
    public getEffectXY(): { x: number, y: number } {
        let xy = {x: this._data.x, y: this._data.y}
        if (!xy.x) {
            xy.x = EXGetEffectX(this.handle)
        }
        if (!xy.y) {
            xy.y = EXGetEffectY(this.handle)
        }
        return xy
    }

    /**
     * 设置特效绑定handle
     */
    public setBindEffect(han: handle, node: string) {
        BindEffect(han, node, this.handle)
        this._data.binding = han
    }

    /**
     * 获取特效绑定的handle
     */
    public getBindEffect() {
        return this._data.binding
    }

    /**
     * 解除特效绑定
     */
    public unBindEffect() {
        UnBindEffect(this.handle)
        this._data.binding = null
    }

    /**
     * 设置特效播放动画
     */
    public setEffectAnimation(aon: number) {
        EXSetEffectAnimation(this.handle, aon)
    }

    /**
     * 特效重置（清空特效旋转与缩放）
     */
    public reset() {
        EXEffectMatReset(this.handle)
        this._data.size = 1
        this._data.rotateX = 0
        this._data.rotateY = 0
        this._data.rotateZ = 0
    }

    /**
     * 摧毁特效
     */
    public destroy() {
        delete this._data
        DestroyEffect(this.handle);
    }

    public static fromHandle(handle: effect): Effect {
        return this.getObject(handle);
    }
}
