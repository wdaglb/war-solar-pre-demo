/** @noSelfInFile */

/**
 * made by solar
 */

/**
 * ydwe constant
 */
declare var ABILITY_STATE_COOLDOWN

declare var ABILITY_DATA_TARGS: number // integer
declare var ABILITY_DATA_CAST: number // real
declare var ABILITY_DATA_DUR: number // real
declare var ABILITY_DATA_HERODUR: number // real
declare var ABILITY_DATA_COST: number // integer
declare var ABILITY_DATA_COOL: number // real
declare var ABILITY_DATA_AREA: number // real
declare var ABILITY_DATA_RNG: number // real
declare var ABILITY_DATA_DATA_A: number // real
declare var ABILITY_DATA_DATA_B: number // real
declare var ABILITY_DATA_DATA_C: number // real
declare var ABILITY_DATA_DATA_D: number // real
declare var ABILITY_DATA_DATA_E: number // real
declare var ABILITY_DATA_DATA_F: number // real
declare var ABILITY_DATA_DATA_G: number // real
declare var ABILITY_DATA_DATA_H: number // real
declare var ABILITY_DATA_DATA_I: number // real
declare var ABILITY_DATA_UNITID: number // integer

declare var ABILITY_DATA_HOTKET: number // integer
declare var ABILITY_DATA_UNHOTKET: number // integer
declare var ABILITY_DATA_RESEARCH_HOTKEY: number // integer
declare var ABILITY_DATA_NAME: number // string
declare var ABILITY_DATA_ART: number // string
declare var ABILITY_DATA_TARGET_ART: number // string
declare var ABILITY_DATA_CASTER_ART: number // string
declare var ABILITY_DATA_EFFECT_ART: number // string
declare var ABILITY_DATA_AREAEFFECT_ART: number // string
declare var ABILITY_DATA_MISSILE_ART: number // string
declare var ABILITY_DATA_SPECIAL_ART: number // string
declare var ABILITY_DATA_LIGHTNING_EFFECT: number // string
declare var ABILITY_DATA_BUFF_TIP: number // string
declare var ABILITY_DATA_BUFF_UBERTIP: number // string
declare var ABILITY_DATA_RESEARCH_TIP: number // string
declare var ABILITY_DATA_TIP: number // string
declare var ABILITY_DATA_UNTIP: number // string
declare var ABILITY_DATA_RESEARCH_UBERTIP: number // string
declare var ABILITY_DATA_UBERTIP: number // string
declare var ABILITY_DATA_UNUBERTIP: number // string
declare var ABILITY_DATA_UNART: number // string

//EVENT_DAMAGE_DATA
declare var EVENT_DAMAGE_DATA_VAILD: number
declare var EVENT_DAMAGE_DATA_IS_PHYSICAL: number
declare var EVENT_DAMAGE_DATA_IS_ATTACK: number
declare var EVENT_DAMAGE_DATA_IS_RANGED: number
declare var EVENT_DAMAGE_DATA_DAMAGE_TYPE: number
declare var EVENT_DAMAGE_DATA_WEAPON_TYPE: number
declare var EVENT_DAMAGE_DATA_ATTACK_TYPE: number

//
/**骰子数量*/
declare var UnitStateDamageDice: unitstate
/**骰子面数*/
declare var UnitStateDamageSide: unitstate
/**基础伤害 （白字攻击+英雄主属性奖励的绿字攻击值）*/
declare var UnitStateDamageBase: unitstate
/**附加伤害*/
declare var UnitStateDamageBonus: unitstate
/**攻击最小值*/
declare var UnitStateDamageMix: unitstate
/**攻击最大值*/
declare var UnitStateDamageMax: unitstate
/**攻击范围*/
declare var UnitStateDamageRange: unitstate
/**攻击间隔*/
declare var UnitStateDamageCool: unitstate
/**攻击速度*/
declare var UnitStateAttackSpeed: unitstate
/**护甲*/
declare var UnitStateArmor: unitstate

/**
 * 保存值
 */
declare function DzAPI_Map_SaveServerValue(whichPlayer: player, key: string, value: string): boolean;

/**
 * 获取值
 */
declare function DzAPI_Map_GetServerValue(whichPlayer: player, key: string): string;

declare function DzAPI_Map_Ladder_SetStat(whichPlayer: player, key: string, value: string): void;

/**
 * rpg阶梯
 */
declare function DzAPI_Map_IsRPGLadder(): boolean;

/**
 * 游戏开始时间
 */
declare function DzAPI_Map_GetGameStartTime(): number;

declare function DzAPI_Map_Stat_SetStat(whichPlayer: player, key: string, value: string): void;

/**
 * 匹配类型
 */
declare function DzAPI_Map_GetMatchType(): number;

/**
 * 玩家状态
 */
declare function DzAPI_Map_Ladder_SetPlayerStat(whichPlayer: player, key: string, value: string): void;

declare function DzAPI_Map_GetServerValueErrorCode(whichPlayer: player): number;

/**
 * 得到阶梯水平
 */
declare function DzAPI_Map_GetLadderLevel(whichPlayer: player): number;

/**
 * 红名vip
 */
declare function DzAPI_Map_IsRedVIP(whichPlayer: player): boolean;

/**
 * 蓝名vip
 */
declare function DzAPI_Map_IsBlueVIP(whichPlayer: player): boolean;

/**
 * 得到梯阶
 */
declare function DzAPI_Map_GetLadderRank(whichPlayer: player): number;

/**
 * 地图排名
 */
declare function DzAPI_Map_GetMapLevelRank(whichPlayer: player): number;

/**
 * 工会名称
 */
declare function DzAPI_Map_GetGuildName(whichPlayer: player): string;

/**
 * 工会权限
 */
declare function DzAPI_Map_GetGuildRole(whichPlayer: player): number;

/**
 * rpg大厅
 */
declare function DzAPI_Map_IsRPGLobby(): boolean;

/**
 * 获取地图等级
 */
declare function DzAPI_Map_GetMapLevel(whichPlayer: player): number;

/**
 * 任务完成
 */
declare function DzAPI_Map_MissionComplete(whichPlayer: player, key: string, value: string): void;

/**
 * 活动数据
 */
declare function DzAPI_Map_GetActivityData(): string;

/**
 * 地图配置
 */
declare function DzAPI_Map_GetMapConfig(key: string): string;

/**
 * 是否有购物中心项目
 */
declare function DzAPI_Map_HasMallItem(whichPlayer: player, key: string): boolean;

declare function DzAPI_Map_SavePublicArchive(whichPlayer: player, key: string, value: string): boolean;

declare function DzAPI_Map_GetPublicArchive(whichPlayer: player, key: string): string;

declare function DzAPI_Map_UseConsumablesItem(whichPlayer: player, key: string): void;

/**
 * Orpg触发
 */
declare function DzAPI_Map_OrpgTrigger(whichPlayer: player, key: string): void;

/**
 * 获取服务器存档
 */
declare function DzAPI_Map_GetServerArchiveDrop(whichPlayer: player, key: string): string;

/**
 * 服务器存档设备
 */
declare function DzAPI_Map_GetServerArchiveEquip(whichPlayer: player, key: string): number;

/**
 * 获取鼠标在游戏内的坐标X
 */
declare function DzGetMouseTerrainX(): number;

/**
 * 获取鼠标在游戏内的坐标Y
 */
declare function DzGetMouseTerrainY(): number;

/**
 * 获取鼠标在游戏内的坐标Z
 */
declare function DzGetMouseTerrainZ(): number;

/**
 * 鼠标是否在游戏内
 */
declare function DzIsMouseOverUI(): boolean;

/**
 * 获取鼠标屏幕坐标X
 */
declare function DzGetMouseX(): number;

/**
 * 获取鼠标屏幕坐标Y
 */
declare function DzGetMouseY(): number;

/**
 * 获取鼠标游戏窗口坐标X
 */
declare function DzGetMouseXRelative(): number;

/**
 * 获取鼠标游戏窗口坐标Y
 */
declare function DzGetMouseYRelative(): number;

/**
 * 设置鼠标位置
 */
declare function DzSetMousePos(x: number, y: number): void;

/**
 * 注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）
 */
declare function DzTriggerRegisterMouseEvent(trig: trigger, btn: number, status: number, sync: boolean, func: string): void;

/**
 * 注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）
 */
declare function DzTriggerRegisterMouseEventByCode(trig: trigger, btn: number, status: number, sync: boolean, funcHandle: () => void): void;

/**
 * 注册键盘点击触发
 */
declare function DzTriggerRegisterKeyEvent(trig: trigger, key: number, status: number, sync: boolean, func: string): void;

/**
 * 注册键盘点击触发
 */
declare function DzTriggerRegisterKeyEventByCode(trig: trigger, key: number, status: number, sync: boolean, funcHandle: () => void): void;

/**
 * 注册鼠标滚轮触发
 */
declare function DzTriggerRegisterMouseWheelEvent(trig: trigger, sync: boolean, func: string): void;

/**
 * 注册鼠标滚轮触发
 */
declare function DzTriggerRegisterMouseWheelEventByCode(trig: trigger, sync: boolean, funcHandle: () => void): void;

/**
 * 注册鼠标移动触发
 */
declare function DzTriggerRegisterMouseMoveEvent(trig: trigger, sync: boolean, func: string): void;

/**
 * 注册鼠标移动触发
 */
declare function DzTriggerRegisterMouseMoveEventByCode(trig: trigger, sync: boolean, funcHandle: () => void): void;

/**
 * 获取触发器的按键码
 */
declare function DzGetTriggerKey(): number;

/**
 * 获取滚轮delta
 */
declare function DzGetWheelDelta(): number;

/**
 * 判断按键是否按下
 */
declare function DzIsKeyDown(iKey: number): boolean;

/**
 * 获取触发key的玩家
 */
declare function DzGetTriggerKeyPlayer(): player;

/**
 * 获取war3窗口宽度
 */
declare function DzGetWindowWidth(): number;

/**
 * 获取war3窗口高度
 */
declare function DzGetWindowHeight(): number;

/**
 * 获取war3窗口X坐标
 */
declare function DzGetWindowX(): number;

/**
 * 获取war3窗口Y坐标
 */
declare function DzGetWindowY(): number;

/**
 * 注册war3窗口大小变化事件
 */
declare function DzTriggerRegisterWindowResizeEvent(trig: trigger, sync: boolean, func: string): void;

/**
 * 注册war3窗口大小变化事件
 */
declare function DzTriggerRegisterWindowResizeEventByCode(trig: trigger, sync: boolean, funcHandle: () => void): void;

/**
 * 判断窗口是否激活
 */
declare function DzIsWindowActive(): boolean;

/**
 * 设置可摧毁物位置
 */
declare function DzDestructablePosition(d: destructable, x: number, y: number): void;

/**
 * 设置单位位置-本地调用
 */
declare function DzSetUnitPosition(whichUnit: unit, x: number, y: number): void;

/**
 * 异步执行函数
 */
declare function DzExecuteFunc(funcName: string): void;

/**
 * 取鼠标指向的单位
 */
declare function DzGetUnitUnderMouse(): unit;

/**
 * 设置单位的贴图
 */
declare function DzSetUnitTexture(whichUnit: unit, path: string, texId: number): void;

/**
 * 设置内存数值
 */
declare function DzSetMemory(address: number, value: number): void;

/**
 * 替换单位类型 [BZAPI]
 */
declare function DzSetUnitID(whichUnit: unit, id: number): void;

/**
 * 替换单位模型 [BZAPI]
 */
declare function DzSetUnitModel(whichUnit: unit, path: string): void;

/**
 * 原生 - 设置小地图背景贴图
 */
declare function DzSetWar3MapMap(map: string): void;

/**
 * 注册数据同步触发器
 */
declare function DzTriggerRegisterSyncData(trig: trigger, prefix: string, server: boolean): void;

/**
 * 同步游戏数据
 */
declare function DzSyncData(prefix: string, data: string): void;

/**
 * 获取同步的数据
 */
declare function DzGetTriggerSyncData(): string;

/**
 * 获取同步数据的玩家
 */
declare function DzGetTriggerSyncPlayer(): player;

/**
 * 隐藏界面元素
 */
declare function DzFrameHideInterface(): void;

/**
 * 修改游戏世界窗口位置
 */
declare function DzFrameEditBlackBorders(upperHeight: number, bottomHeight: number): void;

/**
 * 头像
 */
declare function DzFrameGetPortrait(): number;

/**
 * 小地图
 */
declare function DzFrameGetMinimap(): number;

/**
 * 技能按钮
 */
declare function DzFrameGetCommandBarButton(row: number, column: number): number;

/**
 * 英雄按钮
 */
declare function DzFrameGetHeroBarButton(buttonId: number): number;

/**
 * 英雄血条
 */
declare function DzFrameGetHeroHPBar(buttonId: number): number;

/**
 * 英雄蓝条
 */
declare function DzFrameGetHeroManaBar(buttonId: number): number;

/**
 * 道具按钮
 */
declare function DzFrameGetItemBarButton(buttonId: number): number;

/**
 * 小地图按钮
 */
declare function DzFrameGetMinimapButton(buttonId: number): number;

/**
 * 左上菜单按钮
 */
declare function DzFrameGetUpperButtonBarButton(buttonId: number): number;

/**
 * 鼠标提示
 */
declare function DzFrameGetTooltip(): number;

/**
 * 聊天信息
 */
declare function DzFrameGetChatMessage(): number;

/**
 * 单位信息
 */
declare function DzFrameGetUnitMessage(): number;

/**
 * 获取最上的信息
 */
declare function DzFrameGetTopMessage(): number;

/**
 * 取rgba色值
 */
declare function DzGetColor(r: number, g: number, b: number, a: number): number;

/**
 * 设置界面更新回调（非同步）
 */
declare function DzFrameSetUpdateCallback(func: string): void;

/**
 * 界面更新回调
 */
declare function DzFrameSetUpdateCallbackByCode(funcHandle: () => void): void;

/**
 * 显示/隐藏窗体
 */
declare function DzFrameShow(frame: number, enable: boolean): void;

/**
 * 创建窗体
 */
declare function DzCreateFrame(frame: string, parent: number, id: number): number;

/**
 * 创建简单的窗体
 */
declare function DzCreateSimpleFrame(frame: string, parent: number, id: number): number;

/**
 * 销毁窗体
 */
declare function DzDestroyFrame(frame: number): void;

/**
 * 加载内容目录 (Toc table of contents)
 */
declare function DzLoadToc(fileName: string): void;

/**
 * 设置窗体相对位置 [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
 */
declare function DzFrameSetPoint(frame: number, point: number, relativeFrame: number, relativePoint: number, x: number, y: number): void;

/**
 * 设置窗体绝对位置
 */
declare function DzFrameSetAbsolutePoint(frame: number, point: number, x: number, y: number): void;

/**
 * 清空窗体锚点
 */
declare function DzFrameClearAllPoints(frame: number): void;

/**
 * 设置窗体禁用/启用
 */
declare function DzFrameSetEnable(name: number, enable: boolean): void;

/**
 * 注册用户界面事件回调
 */
declare function DzFrameSetScript(frame: number, eventId: number, func: string, sync: boolean): void;

/**
 * 注册UI事件回调(func handle)
 * 如果要在同步事件里获取触发玩家 可使用DzGetTriggerUIEventPlayer 获得触发UI事件的玩家
 */
declare function DzFrameSetScriptByCode(frame: number, eventId: number, funcHandle: () => void, sync: boolean): void;

/**
 * 获取触发用户界面事件的玩家
 */
declare function DzGetTriggerUIEventPlayer(): player;

/**
 * 获取触发用户界面事件的窗体
 */
declare function DzGetTriggerUIEventFrame(): number;

/**
 * 通过名称查找窗体
 */
declare function DzFrameFindByName(name: string, id: number): number;

/**
 * 通过名称查找普通窗体
 */
declare function DzSimpleFrameFindByName(name: string, id: number): number;

/**
 * 查找字符串
 */
declare function DzSimpleFontStringFindByName(name: string, id: number): number;

/**
 * 查找BACKDROP frame
 */
declare function DzSimpleTextureFindByName(name: string, id: number): number;

/**
 * 获取游戏用户界面
 */
declare function DzGetGameUI(): number;

/**
 * 点击窗体
 */
declare function DzClickFrame(frame: number): void;

/**
 * 自定义屏幕比例
 */
declare function DzSetCustomFovFix(value: number): void;

/**
 * 使用宽屏模式
 */
declare function DzEnableWideScreen(enable: boolean): void;

/**
 * 设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）
 */
declare function DzFrameSetText(frame: number, text: string): void;

/**
 * 获取文字（支持EditBox, TextFrame, TextArea, SimpleFontString）
 */
declare function DzFrameGetText(frame: number): string;

/**
 * 设置字数限制（支持EditBox）
 */
declare function DzFrameSetTextSizeLimit(frame: number, size: number): void;

/**
 * 获取字数限制（支持EditBox）
 */
declare function DzFrameGetTextSizeLimit(frame: number): number;

/**
 * 设置文字颜色（支持TextFrame, EditBox）
 */
declare function DzFrameSetTextColor(frame: number, color: number): void;

/**
 * 获取鼠标所在位置的用户界面控件指针
 */
declare function DzGetMouseFocus(): number;

/**
 * 设置所有锚点到目标窗体上
 */
declare function DzFrameSetAllPoints(frame: number, relativeFrame: number): boolean;

/**
 * 设置焦点
 */
declare function DzFrameSetFocus(frame: number, enable: boolean): boolean;

/**
 * 设置模型（支持Sprite、Model、StatusBar）
 */
declare function DzFrameSetModel(frame: number, modelFile: string, modelType: number, flag: number): void;

/**
 * 获取控件是否启用
 */
declare function DzFrameGetEnable(frame: number): boolean;

/**
 * 设置透明度（0-255）
 */
declare function DzFrameSetAlpha(frame: number, alpha: number): void;

/**
 * 获取透明度（0-255）
 */
declare function DzFrameGetAlpha(frame: number): number;

/**
 * 设置动画
 */
declare function DzFrameSetAnimate(frame: number, animId: number, autocast: boolean): void;

/**
 * 设置动画进度（autocast为false是可用）
 */
declare function DzFrameSetAnimateOffset(frame: number, offset: number): void;

/**
 * 设置texture（支持Backdrop、SimpleStatusBar）
 */
declare function DzFrameSetTexture(frame: number, texture: string, flag: number): void;

/**
 * 设置缩放
 */
declare function DzFrameSetScale(frame: number, scale: number): void;

/**
 * 设置提示
 */
declare function DzFrameSetTooltip(frame: number, tooltip: number): void;

/**
 * 鼠标限制在用户界面内
 */
declare function DzFrameCageMouse(frame: number, enable: boolean): void;

/**
 * 获取当前值（支持Slider、SimpleStatusBar、StatusBar）
 */
declare function DzFrameGetValue(frame: number): number;

/**
 * 设置最大最小值（支持Slider、SimpleStatusBar、StatusBar）
 */
declare function DzFrameSetMinMaxValue(frame: number, minValue: number, maxValue: number): void;

/**
 * 设置Step值（支持Slider）
 */
declare function DzFrameSetStepValue(frame: number, step: number): void;

/**
 * 设置当前值（支持Slider、SimpleStatusBar、StatusBar）
 */
declare function DzFrameSetValue(frame: number, value: number): void;

/**
 * 设置窗体大小
 */
declare function DzFrameSetSize(frame: number, w: number, h: number): void;

/**
 * 根据tag创建窗体
 */
declare function DzCreateFrameByTagName(frameType: string, name: string, parent: number, template: string, id: number): number;

/**
 * 设置颜色（支持SimpleStatusBar）
 */
declare function DzFrameSetVertexColor(frame: number, color: number): void;

/**
 * 不明觉厉
 */
declare function DzOriginalUIAutoResetPoint(enable: boolean): void;

/**
 * 设置优先级 [NEW]
 */
declare function DzFrameSetPriority(frame: number, priority: number): void;

/**
 * 设置父窗口 [NEW]
 */
declare function DzFrameSetParent(frame: number, parent: number): void;

/**
 * 设置字体 [NEW]
 * 原生字体 "Fonts\\dfst-m3u.ttf"
 */
declare function DzFrameSetFont(frame: number, fileName: string, height: number, flag: number): void;

/**
 * 获取 Frame 的 高度 [NEW]
 */
declare function DzFrameGetHeight(frame: number): number;

/**
 * 设置对齐方式 [NEW]
 */
declare function DzFrameSetTextAlignment(frame: number, align: number): void;

/**
 * 获取 Frame 的 Parent [NEW]
 */
declare function DzFrameGetParent(frame: number): number;

/**
 * 设置内存大小（废物函数）
 */


/**
 * base from japi
 */

declare function DzEvent_Building_Finish(...args: any[]): any;


declare function EXEffectMatReset(...args: any[]): any;


declare function EXSetEffectSpeed(...args: any[]): any;

declare function EXGetUnitInteger(...args: any[]): any;


declare function EXEffectMatScale(...args: any[]): any;


declare function DzEvent_Unit_Hired(...args: any[]): any;

declare function DzEvent_Building_Dead(...args: any[]): any;


declare function DzAPI_Map_ChangeStoreItemCount(...args: any[]): any;


declare function DzEvent_Tech_Start(...args: any[]): any;

declare function DzAPI_Map_UpdatePlayerHero(...args: any[]): any;

declare function DzGetPlayerName(...args: any[]): any;


declare function DzDebugString(...args: any[]): any;


declare function DzEvent_Hero_Dead(...args: any[]): any;


declare function DzEvent_Item_Pickup(...args: any[]): any;


declare function DzUnitLearningSkill(...args: any[]): any;


declare function DzAPI_Map_ChangeStoreItemCoolDown(...args: any[]): any;

declare function DzAPI_Map_ToggleStore(...args: any[]): any;

declare function DzEvent_Unit_Start(...args: any[]): any;


declare function DzAPI_Map_GetUserID(...args: any[]): any;

declare function DzAPI_Map_GetPlatformVIP(...args: any[]): any;


declare function DzSetParams(...args: any[]): any;

declare function DzEvent_Building_Cancel(...args: any[]): any;

declare function DzDotaInfo_Item_HE(...args: any[]): any;

declare function EXSetAbilityAEmeDataA(...args: any[]): any;

declare function DzGetPlayerSelectedHero(...args: any[]): any;

declare function GetEventDamage(...args: any[]): any;

declare function EXGetBuffDataString(...args: any[]): any;

declare function DzGetPlayerInitGold(...args: any[]): any;

declare function DzGetGameMode(...args: any[]): any;


declare function DzDotaInfo_IsPlayerRandom(...args: any[]): any;

declare function DzDotaInfo_IsRepicked(...args: any[]): any;

declare function DzDotaInfo_Item_TM(...args: any[]): any;


declare function DzDotaInfo_Item(...args: any[]): any;

declare function DzEvent_Building_Start(...args: any[]): any;


declare function DzEvent_Unit_Dead(...args: any[]): any;

declare function DzEvent_Unit_Cancel(...args: any[]): any;

declare function DzEvent_Unit_Finish(...args: any[]): any;

declare function DzGetClientHeight(...args: any[]): any;

declare function DzEvent_Tech_Cancel(...args: any[]): any;

declare function EXGetAbilityDataInteger(...args: any[]): any;

declare function DzEvent_Tech_Finish(...args: any[]): any;


declare function DzEvent_Hero_Level(...args: any[]): any;


declare function DzEvent_Unit_ChangeOwner(...args: any[]): any;

declare function DzEvent_Item_Drop(...args: any[]): any;

declare function DzEvent_Item_Use(...args: any[]): any;

declare function DzEvent_Item_Sell(...args: any[]): any;


declare function DzPlatform_HasGameOver(...args: any[]): any;

declare function DzPlatform_HasGameOver_Player(...args: any[]): any;

declare function DzPlatform_GameStart(...args: any[]): any;

/**
 * 实时购买商城的KEY
 */
declare function DzGetTriggerMallItem(): string;

/**
 * 实时购买商城的玩家
 */
declare function DzGetTriggerMallItemPlayer(): player;

declare function RequestExtraIntegerData(dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): number;

declare function RequestExtraBooleanData(dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): boolean;

declare function RequestExtraStringData(dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): string;

declare function RequestExtraRealData(dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): number;

/**
 * declare function GetUnitState(whichUnit: unit, whichUnitState: unitstate): number;
 */


declare function EXGetUnitString(...args: any[]): any;

declare function EXSetUnitString(...args: any[]): any;

declare function EXGetUnitReal(...args: any[]): any;

////设置frame相对位置
/**
 * native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
 */

declare function EXSetUnitReal(...args: any[]): any;

declare function EXSetUnitInteger(...args: any[]): any;


declare function EXGetUnitArrayString(...args: any[]): any;

declare function EXSetUnitArrayString(...args: any[]): any;

declare function EXPauseUnit(p1: unit, flag: boolean): void;

declare function EXSetUnitCollisionType(...args: any[]): any;

declare function EXSetUnitMoveType(...args: any[]): any;

declare function EXSetUnitFacing(...args: any[]): any;


declare function EXExecuteScript(...args: any[]): any;

//native EXGetUnitAbility        takes unit u, integer abilcode returns ability
declare function EXGetUnitAbility(u: unit, abilcode: number | string): ability;

declare function EXGetUnitAbilityByIndex(...args: any[]): any;

declare function EXGetAbilityId(...args: any[]): any;

declare function EXGetAbilityState(...args: any[]): any;

declare function EXSetAbilityState(...args: any[]): any;

declare function EXGetAbilityDataReal(...args: any[]): any;

//108 = dataa,   109 = datab
declare function EXSetAbilityDataReal(abil: ability, level: number, data_type: number, value: number): any;


//native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
declare function EXSetAbilityDataInteger(abil: ability, level: number, data_type: number, value: number): any;

declare function EXGetAbilityDataString(...args: any[]): any;

declare function EXSetAbilityDataString(...args: any[]): any;

declare function EXSetBuffDataString(...args: any[]): any;

declare function EXGetAbilityString(...args: any[]): any;

declare function EXSetAbilityString(abilcode: number | string, level: number, data_type: number, value: string): boolean;

declare function EXGetItemDataString(itemcode: number | string, data_type: number): string;

//4 = 提示,   3 = 提示（扩展）
/**
 * YDWESetItemDataString takes integer itemcode, integer data_type, string value returns boolean
 */
declare function EXSetItemDataString(itemcode: number | string, data_type: number, value: string): boolean;

/**
 edd_type :可选择：
 constant integer EVENT_DAMAGE_DATA_VAILD       = 0
 constant integer EVENT_DAMAGE_DATA_IS_PHYSICAL = 1//是否物理伤害
 constant integer EVENT_DAMAGE_DATA_IS_ATTACK   = 2//是否攻击伤害
 constant integer EVENT_DAMAGE_DATA_IS_RANGED   = 3//是否远程
 constant integer EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4 //伤害类型
 constant integer EVENT_DAMAGE_DATA_WEAPON_TYPE = 5//武器类型
 constant integer EVENT_DAMAGE_DATA_ATTACK_TYPE = 6//攻击类型
 * @param
 * @constructor
 */
declare function EXGetEventDamageData(edd_type: number): number;

//function YDWESetEventDamage takes real amount returns boolean
declare function EXSetEventDamage(amount: number): boolean;

declare function EXSetEffectSize(...args: any[]): any;

declare function EXDisplayChat(...args: any[]): any;

declare function EXDclareButtonIcon(...args: any[]): any;

declare function EXBlendButtonIcon(bgPath: string, iconPath: string, resultPath: string): any;

declare function EXSetEffectXY(args: effect, x: number, y: number): any;

declare function EXSetEffectZ(...args: any[]): any;

declare function EXGetEffectX(args: effect): number;

declare function EXGetEffectY(args: effect): number

declare function EXGetEffectZ(args: effect): number;

declare function EXGetEffectSize(...args: any[]): any;

declare function EXEffectMatRotateX(...args: any[]): any;

declare function EXEffectMatRotateY(...args: any[]): any;

declare function EXEffectMatRotateZ(...args: any[]): any;

declare function DzGetLocale(...args: any[]): any;

declare function DzGetClientWidth(...args: any[]): any;

declare function DzFrameGetName(...args: any[]): any;


declare const ability: { [id: string]: aobj }
declare const upgrade: { [id: string]: upobj }
declare const buff: { [id: string]: bobj }
declare const misc: { [id: string]: { [key: string]: string } }
declare const destructable: { [id: string]: deobj }
declare const doodad: { [id: string]: dobj }
declare const item: { [id: string]: iobj }
declare const unit: { [id: string]: uobj }

/**
 * addons
 */


declare function DzAPI_Map_IsPlatformVIP(whichPlayer: player): boolean;

declare function DzAPI_Map_Global_GetStoreString(key: string): string;

declare function DzAPI_Map_Global_StoreString(key: string, value: string): void;

declare function DzAPI_Map_Global_ChangeMsg(trig: trigger): void;

declare function DzAPI_Map_ServerArchive(whichPlayer: player, key: string): string;

declare function DzAPI_Map_SaveServerArchive(whichPlayer: player, key: string, value: string): void;

declare function DzAPI_Map_IsRPGQuickMatch(): boolean;

declare function DzAPI_Map_GetMallItemCount(whichPlayer: player, key: string): number;

declare function DzAPI_Map_ConsumeMallItem(whichPlayer: player, key: string, count: number): boolean;

declare function DzAPI_Map_EnablePlatformSettings(whichPlayer: player, option: number, enable: boolean): boolean;

declare function DzAPI_Map_IsBuyReforged(whichPlayer: player): boolean;

declare function GetPlayerServerValueSuccess(whichPlayer: player): boolean;

declare function DzAPI_Map_StoreIntegerEX(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_GetStoredIntegerEX(whichPlayer: player, key: string): number;

declare function DzAPI_Map_StoreInteger(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_GetStoredInteger(whichPlayer: player, key: string): number;

declare function DzAPI_Map_CommentTotalCount1(whichPlayer: player, id: number): number;

declare function DzAPI_Map_StoreReal(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_GetStoredReal(whichPlayer: player, key: string): number;

declare function DzAPI_Map_StoreBoolean(whichPlayer: player, key: string, value: boolean): void;

declare function DzAPI_Map_GetStoredBoolean(whichPlayer: player, key: string): boolean;

declare function DzAPI_Map_StoreString(whichPlayer: player, key: string, value: string): void;

declare function DzAPI_Map_GetStoredString(whichPlayer: player, key: string): string;

declare function DzAPI_Map_StoreStringEX(whichPlayer: player, key: string, value: string): void;

declare function DzAPI_Map_GetStoredStringEX(whichPlayer: player, key: string): string;

declare function DzAPI_Map_GetStoredUnitType(whichPlayer: player, key: string): number;

declare function DzAPI_Map_GetStoredAbilityId(whichPlayer: player, key: string): number;

declare function DzAPI_Map_FlushStoredMission(whichPlayer: player, key: string): void;

declare function DzAPI_Map_Ladder_SubmitIntegerData(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_Stat_SubmitUnitData(whichPlayer: player, key: string, value: unit): void;

declare function DzAPI_Map_Ladder_SubmitAblityIdData(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_Ladder_SubmitItemData(whichPlayer: player, key: string, value: item): void;

declare function DzAPI_Map_Ladder_SubmitBooleanData(whichPlayer: player, key: string, value: boolean): void;

declare function DzAPI_Map_Ladder_SubmitTitle(whichPlayer: player, value: string): void;

declare function DzAPI_Map_Ladder_SubmitPlayerRank(whichPlayer: player, value: number): void;

declare function DzAPI_Map_Ladder_SubmitPlayerExtraExp(whichPlayer: player, value: number): void;

declare function DzAPI_Map_PlayedGames(whichPlayer: player): number;

declare function DzAPI_Map_CommentCount(whichPlayer: player): number;

declare function DzAPI_Map_FriendCount(whichPlayer: player): number;

declare function DzAPI_Map_IsConnoisseur(whichPlayer: player): boolean;

declare function DzAPI_Map_IsBattleNetAccount(whichPlayer: player): boolean;

declare function DzAPI_Map_IsAuthor(whichPlayer: player): boolean;

declare function DzAPI_Map_CommentTotalCount(): number;

declare function DzAPI_Map_Statistics(whichPlayer: player, eventKey: string, eventType: string, value: number): void;

declare function DzAPI_Map_Returns(whichPlayer: player, label: number): boolean;

declare function DzAPI_Map_ContinuousCount(whichPlayer: player, id: number): number;

// IsPlayer,                      //是否为玩家
declare function DzAPI_Map_IsPlayer(whichPlayer: player): boolean;

// MapsTotalPlayed,               //所有地图的总游戏时长
declare function DzAPI_Map_MapsTotalPlayed(whichPlayer: player): number;

// MapsLevel,                    //指定地图的地图等级
declare function DzAPI_Map_MapsLevel(whichPlayer: player, mapId: number): number;

// MapsConsumeGold,              //所有地图的金币消耗
declare function DzAPI_Map_MapsConsumeGold(whichPlayer: player, mapId: number): number;

// MapsConsumeLumber,            //所有地图的木材消耗
declare function DzAPI_Map_MapsConsumeLumber(whichPlayer: player, mapId: number): number;

// MapsConsumeLv1,               //消费 1-199
declare function DzAPI_Map_MapsConsumeLv1(whichPlayer: player, mapId: number): boolean;

// MapsConsumeLv2,               //消费 200-499
declare function DzAPI_Map_MapsConsumeLv2(whichPlayer: player, mapId: number): boolean;

// MapsConsumeLv3,               //消费 500~999
declare function DzAPI_Map_MapsConsumeLv3(whichPlayer: player, mapId: number): boolean;

// MapsConsumeLv4,               //消费 1000+
declare function DzAPI_Map_MapsConsumeLv4(whichPlayer: player, mapId: number): boolean;

//获取论坛数据（0=累计获得赞数，1=精华帖数量，2=发表回复次数，3=收到的欢乐数，4=是否发过贴子，5=是否版主，6=主题数量）
declare function DzAPI_Map_GetForumData(whichPlayer: player, whichData: number): number;

declare function DzAPI_Map_OpenMall(whichPlayer: player, whichkey: string): boolean;

declare function DzAPI_Map_GameResult_CommitData(whichPlayer: player, key: string, value: string): void;

//游戏结算
declare function DzAPI_Map_GameResult_CommitTitle(whichPlayer: player, value: string): void;

declare function DzAPI_Map_GameResult_CommitPlayerRank(whichPlayer: player, value: number): void;

declare function DzAPI_Map_GameResult_CommitGameMode(value: string): void;

declare function DzAPI_Map_GameResult_CommitGameResult(whichPlayer: player, value: number): void;

//实时购买
/**
 * 注册实时购买商品事件
 */
declare function DzTriggerRegisterMallItemSyncData(trig: trigger): void;

/**
 * 获得实时购买商品的玩家
 */
declare function DzGetTriggerMallItemPlayer(): player;

/**
 * 获得实时购买的商品Key
 */
declare function DzGetTriggerMallItem(): string;


/**
 * 其他lua api
 */

/**
 * 本地玩家的鼠标坐标 (游戏坐标)
 * @param x
 * @param y
 */
declare function mouse(): LuaMultiReturn<[number, number]>;

/**
 * 本地玩家技能按钮的状态
 *  根据格子找到技能id，命令id，目标类型
 *  ability, order, target_type = message.button(x, y)
 * @param x
 * @param y
 */
declare function button(x: number, y: number): LuaMultiReturn<[number, number, number]>;

/**
 * 获得本地玩家当前选中单位
 * 多选时返回选择列表里的第一个单位
 */
declare function selection(): unit;
