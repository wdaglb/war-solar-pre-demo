/** @noSelfInFile */

/**
 * 这里是内置Japi的方法定义
 * 需要有内置japi 才能拥有这些的方法
 * 没有的话可以注释掉此文件
 */


declare function GetPluginVersion(): any;

declare function post_message(url: string, post: string, onResult: (result: string) => void): any;

declare function SetOwner(owner: string): any;

declare function GetUserId(): number;

declare function GetUserIdEx(): string;

declare function GetUsedMemory(): number;

/**
 解锁帧数上限 突破60帧
 布尔值    is_unlock    填true解锁 填false恢复
 */
declare function UnlockFps(is_unlock: boolean): void;


/**
 * 获取是否窗口化模式
 */
declare function IsWindowMode(): boolean;

/**
 * 隐藏单位跟物品 鼠标指向时显示的UI 包括单位血条

 参数
 类型    名字        说明
 单位    handle    要修改的单位或物品
 字符串    is_show    是否显示 填false就是隐藏

 * @param Handle
 * @param is_show
 * @constructor
 */
declare function SetUnitPressUIVisible(Handle: handle, is_show: boolean): void;


declare function ShowFpsText(show: boolean): void;


declare function SetUnitProperName(handle: unit, name: string): void;

declare function SetUnitName(handle: unit, name: string): void;

declare function world_to_screen(x: number, y: number, z: number): LuaMultiReturn<[number, number, number]>;

/**
 * 屏幕坐标转世界坐标
 * 1    number    屏幕x轴 左到右 0 ~ 0.8
 * 2    number    屏幕y轴 上到下 0 ~ 0.6
 *
 * 返回值
 * 索引    类型    说明
 * 1    number    世界坐标x轴
 * 2    number    世界坐标y轴
 */
declare function screen_to_world(x: number, y: number): LuaMultiReturn<[number, number]>;

/**
 * 用来模拟血条 或者绑定UI到单位头顶时会用到
 * @param unit_handle
 */
declare function unit_overhead(unit_handle: unit): number;


// 获取 框选按钮 slot 从0 ~ 11
declare function FrameGetInfoSelectButton(slot: number): number;

// 获取 下方buff按钮 slot 从0 ~ 7
declare function FrameGetBuffButton(slot: number): number;

// 获取 农民按钮
declare function FrameGetUnitButton(): number;

// 获取 技能右下角数字文本控件 button = 技能按钮  返回值 = SimpleString 类型控件
declare function FrameGetButtonSimpleString(button: number): number;

// 获取 技能右下角控件  button = 技能按钮  返回值 = SimpleFrame 类型控件
declare function FrameGetButtonSimpleFrame(button: number): number;

// 判断控件是否显示
declare function FrameIsShow(frame: number): boolean;

declare function FrameGetOriginButtonTexture(button: number): string;

// 修改/获取 simple类型控件的 父控件
declare function FrameGetSimpleParent(SimpleFrame: number): number;

declare function FrameSetSimpleParent(SimpleFrame: number, parentSimple: number): number;

// 为Simple绑定 frame类型的子控件
// 可以将任意frame类型 绑定到 原生ui下面 返回值 可以解除绑定
// 返回的是一个 SetupFrame值
declare function FrameSimpleBindFrame(SimpleFrame: number, Frame: number): number;

// 解除绑定 解除后 frame跟simple 就不再关联
declare function FrameSimpleUnBindFrame(SetupFrame: number): void;


/**
 * addons
 */

/**
 * 获取玩家选择单位列表
 * 从ui上进行异或获取框选单位
 * 选择0个或1个 会返回0个
 * 只有选择2个或以上时 才能返回对应的单位数组
 */
declare function get_select_list(): unit[];

/**
 * 获取玩家选取的单位
 * 当前玩家大头像模型的单位 当框选一群单位时 切换选择也会改变返回值 一般用来做 UI 操作时需要用到的接口
 */
declare function GetRealSelectUnit(): unit;

/**
 * UI模型Z轴旋转
 */
declare function FrameSetModelRotateZ(ui: number, jd: number): void;

/**
 * 设置单位模型
 */
declare function SetUnitModel(dw: unit, model: string): void;

/**
 * 设置单位头像模型
 */
declare function SetUnitPortrait(dw: unit, model: string): void;

/**
 * 设置单位称谓
 */
declare function SetUnitProperName(handle: unit, name: string): void;

/**
 * 设置单位移动类型
 */
declare function EXSetUnitMoveType(handle: unit, ydlx: number): void;

/**
 * 获取英雄头像BTN
 */
declare function FrameGetHeroBarButton(id: number): number;

/**
 * 修改 原生按钮图片 button 可以是 技能按钮 物品按钮 英雄按钮 农民按钮 框选按钮 buff按钮
 */
declare function FrameSetOriginButtonTexture(ui: number, txt: string): void;

/**
 内置默认是 解锁frame控件的 屏幕限制的 就是可以随便移动到屏幕之外的位置，
 */
declare function SetFrameLimitScreen(is_limit: boolean): void;

/**
 可以用来 缩放 单位/特效的 粒子2 的模型缩放 相当于是绿苹果里中间那3个缩放至
 */
declare function SetPariticle2Size(Handle: handle, scale: number): void;

/**
 是用来缩放 ui模型上面的粒子2的
 */
declare function FrameSetModelPariticle2Size(frame: number, scale: number): void;


/**
 * 获取游戏用户界面
 * @deprecated see DzGetGameUI
 */
declare function GetGameUI(): number;

/**
 * 设置窗体绝对位置
 */
declare function FrameSetAbsolutePoint(frame: number, point: number, x: number, y: number): void;

/**
 * 设置父窗口 [NEW]
 */
declare function FrameSetParent(frame: number, parent: number): void;

/**
 * 销毁窗体
 */
declare function DestroyFrame(frame: number): void;

/**
 *修改UI图片（内置版）
 */
declare function FrameSetTexture(ui: number, str: string, pp: number): void;

/**
 *修改Frame Level
 */
declare function FrameSetLevel(ui: number, level: number): void;

/**
 * 显示/隐藏窗体
 */
declare function FrameShow(frame: number, enable: boolean): void;

/**
 * 设置透明度（0-255）
 */
declare function FrameSetAlpha(frame: number, alpha: number): void;

/**
 * 获取透明度（0-255）
 */
declare function FrameGetAlpha(frame: number): number;

/**
 * 设置窗体大小
 */
declare function FrameSetSize(frame: number, w: number, h: number): void;

/**
 *修改Frame宽度（内置版）
 */
declare function FrameSetWidth(ui: number, width: number): void;

/**
 *修改Frame高度（内置版）
 */
declare function FrameSetHeight(ui: number, height: number): void;

/**
 *修改Frame模型大小（内置版）
 */
declare function FrameSetModelSize(p1: number, p2: number): void;

/**
 *得到控制台1
 */
declare function FrameGetSimpleConsole(): number;

/**
 *框架显示界面
 */
declare function FrameShowInterface(): void;

/**
 *设置控件视口
 */
declare function FrameSetViewPort(p1: number, p2: boolean): void;

/**
 *获取子控件
 */
declare function FrameGetChilds(p1: number, p2: number): number;

/**
 *获取父控件
 */
declare function FrameGetParent(p1: number): number;

/**
 * 根据tag创建窗体
 */
declare function CreateFrameByTagName(frameType: string, name: string, parent: number, template: string, id: number): number;

/**
 *获取控件宽度
 */
declare function FrameGetWidth(p1: number): number;

/**
 *获取控件高度
 */
declare function FrameGetHeight(p1: number): number;

/**
 * 销毁框架
 */
declare function DestroySimpleFrame(p1: number): void;

/**
 * UI模型动作
 */
declare function FrameSetAnimationByIndex(p1: number, p2: number): void;

/**
 * UI设置模型颜色
 */
declare function FrameSetModelColor(p1: number, p2: number): void;

/**
 *模型动画播放速度
 */
declare function FrameSetModelSpeed(p1: number, p2: number): void;

/**
 *播放特效动画
 */
declare function EXSetEffectAnimation(p1: effect, p2: number): void;

/**
 *非动作性(暂停)用作技能制作
 */
declare function EXPauseUnit(p1: unit, p2: boolean): void;


/**
 * 玩家是否打开了聊天框
 */
declare function GetChatState(): boolean;

/**
 * 设置小地图贴图
 */
declare function SetWar3MapMap(p1: string): void;

/**
 * 设置单位技能隐藏
 */
declare function SetUnitAbilityButtonShow(p1: number, p2: number, p3: boolean): void;

/**
 * 解除特效绑定
 */
declare function UnBindEffect(p1: handle): void;

/**
 * 获取当前指向Handle(物品，单位)
 */
declare function GetTargetObject(): unit;

/**
 * 获取UI的宽度
 */
declare function FrameGetTextWidth(p1: number): number;

/**
 * 设置窗口大小
 */
declare function SetWindowSize(width: number, height: number): void;

/**
 * 按钮冷却模型大小
 */
declare function FrameSetButtonCooldownModelSize(p1: number, p2: number): void;

/**
 * 文本字体间距
 */
declare function FrameSetTextFontSpacing(p1: number, p2: number): void;

/**
 * 特效播放速度
 */
declare function EXSetEffectSpeed(p1: number, p2: number): void;

/**
 * 设置单位普攻弹道模型
 */
declare function SetUnitMissileModel(p1: handle, p2: String): void;

/**
 * 设置handle贴图
 */
declare function SetUnitTexture(p1: handle, p2: string, texId: number): void;

/**
 * 获取剪贴板内容
 */
declare function get_copy_str(): string;

/**
 * 设置剪贴板内容
 */
declare function set_copy_str(txt: string): void;

/**
 * 设置Frame文字颜色
 */
declare function FrameSetTextColor(pi: number, p2: number): void;

/**
 * 获取帧数
 */
declare function GetFps(): number;

/**
 * 获取字体高度
 */
declare function FrameGetTextHeight(p1: number): number;

/** 设置特效颜色*/
declare function EXSetEffectColor(handle: effect, color: number);

/** 设置特效是否显示*/
declare function EXSetEffectVisible(handle: effect, visible: boolean);

/**
 *播放特效动画(EXPlayEffectAnimation(eff, "attack", ""))
 */
declare function EXPlayEffectAnimation(handle: effect, animation_name: string, link_name: string): void;

/**
 * 获取物品技能
 */
declare function GetItemAbility(p1: item, p2: number): ability;

/**
 * 获取技能ID
 */
declare function EXGetAbilityId(p1: ability): number;

/**
 * 获取特效颜色
 */
declare function EXGetEffectColor(p1: effect): number;

/**
 * 设置特效迷雾可见
 */
declare function EXSetEffectFogVisible(p1: effect, p2: boolean): void;

/**
 * 单位，物品，特效绑定特效
 * @param unit
 * @param p2 绑定节点
 * @param p3 绑定handle
 */
declare function BindEffect(unit: handle, p2: string, p3: effect): void;