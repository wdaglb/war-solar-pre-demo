/** @noSelfInFile **/
import DataBase from "../../common/DataBase";
import BaseUtil from "../../util/BaseUtil";


/**
 BACKDROP, TEXT, GLUETEXTBUTTON, BUTTON, TEXTBUTTON, TEXTAREA,
 FRAME, CHECKBOX, EDITBOX, GLUEBUTTON, SCROLLBAR, SLIDER,
 POPUPMENU, CONTROL, DIALOG, HIGHLIGHT, LISTBOX, MENU,
 CHATDISPLAY, GLUECHECKBOX, SIMPLEFRAME, SIMPLEBUTTON;
 */
export class Frame {


    current: number = 0
    type: string = ""
    //缓存数据 要保证这里的数据是真实的Frame的数据 即所有修改frame的值都通过此类修改。否则访问这里的值可能不准确
    private propsTemp: FrameProps = null;


    constructor(frameOrFrameType?: string | number, name?: string, parent?: number, template?: string, id?: number) {
        if (!frameOrFrameType) {//创建一个空的Frame 然后自行设置current的 值
            return;
        }
        const type = typeof frameOrFrameType;
        if (type == "number") {//如果名字不存在 说明是包装一个已有的frame
            this.current = frameOrFrameType as number;
            return;
        }
        if (!name) {
            name = "Solar:Frame:" + BaseUtil.getUUID();
        }
        if (!parent) {
            parent = DzGetGameUI();
        }
        if (!template) {
            template = "";
        }
        if (!id) {
            id = 0;
        }
        this.type = frameOrFrameType as string;
        this.current = DzCreateFrameByTagName(
            frameOrFrameType as string,
            name,
            parent,
            template,
            id,
        );
    }


    public get props(): FrameProps {
        if (!this.propsTemp) {//初始化一个空的props
            if (this.current == 0) {
                this.propsTemp = {size: {}, position: {relative: 0, x: 0, y: 0}, visible: true, scale: 1}
            } else {
                this.propsTemp = {
                    size: {
                        width: 0,
                        height: DzFrameGetHeight(this.current)
                    },
                    position: {
                        relative: DzFrameGetParent(this.current),
                        x: 0,
                        y: 0
                    },
                    visible: true,
                    scale: 1
                }
            }
        }
        return this.propsTemp;
    }

    public set props(obj: FrameProps) {
        this.propsTemp = obj;
    }

    public get solarData(): AppData {
        return DataBase.getDataByTypeId("_SL_Frame", tostring(this.current))
    }

    public set solarData(obj: { [key: string]: any }) {
        DataBase.setDataByTypeId("_SL_Frame", tostring(this.current), obj)
    }


    public set alpha(alpha: number) {
        DzFrameSetAlpha(this.current, alpha);

    }

    public get alpha() {
        return DzFrameGetAlpha(this.current);
    }

    // public get children() {
    //     const count = this.childrenCount;
    //     const output: Frame[] = [];
    //     for (let i = 0; i < count; i++) {
    //         output.push(this.getChild(i));
    //     }
    //     return output;
    // }
    //
    // public get childrenCount() {
    //     return DzFrameGetChildrenCount(this.current);
    // }

    public set enabled(flag: boolean) {
        DzFrameSetEnable(this.current, flag);
    }

    public get enabled() {
        return DzFrameGetEnable(this.current);
    }

    public set height(height: number) {
        this.props.size.height = height;
        if (this.current != 0) {
            DzFrameSetSize(this.current, this.width, height);
        }
    }

    public get height() {
        if (this.current == 0) {
            return this.props.size.height;
        }
        return DzFrameGetHeight(this.current);
    }

    public set parent(parent: number) {
        DzFrameSetParent(this.current, parent);
    }

    public get parent() {
        return DzFrameGetParent(this.current);
    }

    public set text(text: string) {
        DzFrameSetText(this.current, text);
    }

    public get text() {
        return DzFrameGetText(this.current);
    }

    public set textSizeLimit(size: number) {
        DzFrameSetTextSizeLimit(this.current, size);
    }

    public get textSizeLimit() {
        return DzFrameGetTextSizeLimit(this.current);
    }

    public set value(value: number) {
        DzFrameSetValue(this.current, value);
    }

    public get value() {
        return DzFrameGetValue(this.current);
    }


    public set visible(flag: boolean) {
        this.props.visible = flag;
        DzFrameShow(this.current, flag);
    }

    public get visible() {
        return this.props.visible;
    }

    public set width(width: number) {
        this.props.size.width = width;
        DzFrameSetSize(this.current, width, this.height);
    }

    public get width() {
        return this.props.size.width;
    }

    // public addText(text: string) {
    //     DzFrameAddText(this.current, text);
    //     return this;
    // }

    public cageMouse(enable: boolean) {
        DzFrameCageMouse(this.current, enable);
        return this;
    }

    public clearPoints() {
        DzFrameClearAllPoints(this.current);
        return this;
    }

    // public click() {
    //     DzFrameClick(this.current);
    //     return this;
    // }

    public destroy() {
        DzDestroyFrame(this.current)
        this.solarData = null;
        return this;
    }

    // public getChild(index: number) {
    //     return Frame.fromHandle(DzFrameGetChild(this.current, index));
    // }

    public setAbsPoint(point: number, x: number, y: number) {
        DzFrameSetAbsolutePoint(this.current, point, x, y);
        return this;
    }

    public setAllPoints(relative: number) {
        DzFrameSetAllPoints(this.current, relative);
        return this;
    }

    public setAlpha(alpha: number) {
        DzFrameSetAlpha(this.current, alpha);
        return this;
    }

    public setEnabled(flag: boolean) {
        DzFrameSetEnable(this.current, flag);
        return this;
    }

    public setFocus(flag: boolean) {
        DzFrameSetFocus(this.current, flag);
        return this;
    }

    /**
     * 原生字体 "Fonts\\dfst-m3u.ttf"
     * @param height 0.0001 - 0.026
     * @param filename
     * @param flags
     */
    public setFont(height: number, filename: string = "Fonts\\dfst-m3u.ttf", flags: number = 0) {
        DzFrameSetFont(this.current, filename, height, flags);
        return this;
    }

    public setHeight(height: number) {
        DzFrameSetSize(this.current, this.props.size.width, height);
        return this;
    }

    public SetSize(width: number, height: number) {
        this.props.size.width = width;
        this.props.size.height = height;
        DzFrameSetSize(this.current, width, height);
        return this;
    }

    // public setLevel(level: number) {
    //     DzFrameSetLevel(this.current, level);
    //     return this;
    // }

    public setMinMaxValue(minValue: number, maxValue: number) {
        DzFrameSetMinMaxValue(this.current, minValue, maxValue);
        return this;
    }

    /**
     * 设置模型（支持Sprite、Model、StatusBar）
     */
    public setModel(modelFile: string, modelType: number, flag: number = 0) {
        DzFrameSetModel(this.current, modelFile, modelType, flag);
        return this;
    }

    public setParent(parent: number) {
        DzFrameSetParent(this.current, parent);
        return this;
    }

    public setPoint(point: number, relative: number, relativePoint: number, x: number, y: number) {
        DzFrameSetPoint(this.current, point, relative, relativePoint, x, y);
        return this;
    }

    /**
     * 设置跟随到相对节点的大小 通常用于背景自适应文本的ui （自动根据文本长度变化大小）
     * @param relative
     * @param widthGap
     * @param heightGap
     */
    public setPoints(relative: number, widthGap: number, heightGap: number = widthGap) {
        DzFrameSetPoint(this.current, FRAMEPOINT_TOPLEFT, relative, FRAMEPOINT_TOPLEFT, -widthGap, heightGap);
        DzFrameSetPoint(this.current, FRAMEPOINT_BOTTOMRIGHT, relative, FRAMEPOINT_BOTTOMRIGHT, widthGap, -heightGap);
        return this;
    }

    public getScale(): number {
        return this.props.scale;
    }

    public setScale(scale: number) {
        this.props.scale = scale;
        DzFrameSetScale(this.current, scale);
        return this;
    }

    /**
     * Text UI设置为0 为自动适应大小
     * @param width
     * @param height
     */
    public setSize(width: number, height: number) {
        DzFrameSetSize(this.current, width, height);
        return this;
    }

    public setSpriteAnimate(animId: number, autocast: boolean) {
        DzFrameSetAnimate(this.current, animId, autocast);
        return this;
    }

    public setStepSize(stepSize: number) {
        DzFrameSetStepValue(this.current, stepSize);
        return this;
    }

    public setText(text: string) {
        DzFrameSetText(this.current, text);
        return this;
    }

    public setTextColor(color: number) {
        DzFrameSetTextColor(this.current, color);
        return this;
    }

    public setTextSizeLimit(size: number) {
        DzFrameSetTextSizeLimit(this.current, size);
        return this;
    }

    public setTexture(texFile: string, flag: number = 0) {
        DzFrameSetTexture(this.current, texFile, flag);
        return this;
    }

    /**
     * 创建一个背景图 并返回这个背景Frame
     * @param texFile
     * @param flag
     */
    public addBackgroundImage(texFile: string, flag: number = 0): Frame {
        let backdropFrame = new Frame("BACKDROP", Frame.getRandomName(), this.current);
        backdropFrame.setTexture(texFile, flag);
        backdropFrame.setAllPoints(this.current)
        return backdropFrame;
    }

    public setTooltip(tooltip: number) {
        DzFrameSetTooltip(this.current, tooltip);
        return this;
    }

    public setValue(value: number) {
        DzFrameSetValue(this.current, value);
        return this;
    }

    public setVertexColor(color: number) {
        DzFrameSetVertexColor(this.current, color);
        return this;
    }

    public setVisible(flag: boolean) {
        this.props.visible = flag;
        DzFrameShow(this.current, flag);
        return this;
    }

    public setWidth(width: number) {
        DzFrameSetSize(this.current, width, this.height);
        return this;
    }

    // public static autoPosition(enable: boolean) {
    //     BlzEnableUIAutoPosition(enable);
    // }


    /**
     * 设置模型大小（内置缩放）
     * eJapi
     */
    public setModelSize(size: number) {
        FrameSetModelSize(this.current, size)
        this.props.modelSize = size
    }

    /**
     * 获取模型大小
     */
    public getModelSize(): number {
        return this.props.modelSize
    }

    /**
     * 设置模型粒子大小
     * eJapi
     */
    public set setModelPariticleSize(size: number) {
        FrameSetModelPariticle2Size(this.current, size)
        this.props.modelPariticleSize = size
    }

    /**
     * 设置模型粒子大小
     */
    public get getModelPariticleSize() {
        return this.props.modelPariticleSize;
    }

    /**
     * 设置模型动画播放速度
     */
    public setModelSpeed(Speed: number) {
        FrameSetModelSpeed(this.current, Speed)
        this.props.modelSpeed = Speed
    }

    /**
     * 获取模型动画播放速度
     */
    public getModelSpeed() {
        return this.props.modelSpeed
    }


    /**
     * 事件
     */
    /**
     * 设置回调：点击事件
     */
    public setOnClick(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_CONTROL_CLICK, callback, sync);
    }

    /**
     * 设置回调：双击事件
     */
    public setOnDoubleClick(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_DOUBLECLICK, callback, sync);
    }

    /**
     * 设置回调：鼠标进入
     */
    public setOnMouseEnter(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_ENTER, callback, sync);
    }

    /**
     * 设置回调：鼠标离开
     */
    public setOnMouseLeave(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_LEAVE, callback, sync);
    }

    /**
     * 设置回调：鼠标按下
     */
    public setOnMouseDown(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_DOWN, callback, sync);
    }

    /**
     * 设置回调：鼠标释放
     */
    public setOnMouseUp(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_UP, callback, sync);
    }

    /**
     * 设置回调：鼠标滚轮
     */
    public setOnMouseWheel(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_WHEEL, callback, sync);
    }

    public setEventCallback(event: number, callback: () => void, sync = false) {
        if (sync && isAsync) {
            log.errorWithTraceBack("无法在异步中注册同步方法！请在同步方法中执行！")
            return
        }
        DzFrameSetScriptByCode(this.current, event, callback, sync)
    }

    /**
     * fromEvent
     */
    public static fromEvent() {
        return this.fromHandle(DzGetTriggerUIEventFrame());
    }

    public static fromHandle(handle: number): Frame {
        return new Frame(handle);
    }

    public static fromName(name: string, createContext: number) {
        return this.fromHandle(DzFrameFindByName(name, createContext));
    }

    public static loadTOC(filename: string) {
        return DzLoadToc(filename);
    }


    /**
     * helper
     */

    public static getRandomName() {
        return "Solar:Frame:" + BaseUtil.getUUID();
        ;
    }

    /**
     * 创建一个背景
     */
    public static createBackDrop() {
        return new Frame("BACKDROP");
    }

    /**
     * 创建一个文本ui
     */
    public static createTEXT() {
        return new Frame("TEXT");
    }

    /**
     * 创建一个带声音的文字按钮
     */
    public static createGLUETEXTBUTTON() {
        return new Frame("GLUETEXTBUTTON");
    }

    /**
     * 创建一个按钮
     */
    public static createBUTTON() {
        return new Frame("BUTTON");
    }

    /**
     * 创建一个文字按钮
     */
    public static createTEXTBUTTON() {
        return new Frame("TEXTBUTTON");
    }

    /**
     * 创建一个文本域
     */
    public static createTEXTAREA() {
        return new Frame("TEXTAREA");
    }


    /**
     * 新建模型UI
     */
    public static createSPRITE(father: number = null) {
        return new Frame("SPRITE", null, father);
    }

}
