/** @noSelfInFile */
declare abstract class handle {
    __handle: never;
}

declare let gameName: string;

declare let isDebug: boolean;

declare let globals: any;

declare let isEmbedJapi: boolean

declare let isEmbedBrowser: boolean
/**
 * 当前游戏时间 （毫秒单位）
 */
declare let time: number;
/**
 * 是否异步
 */
declare let isAsync: boolean

//lua package
declare const PACKAGE: any & {
    path: string,
    loaded: any
};
/**
 * env_vars
 * 环境变量
 */
/**
 * 本地开发的地图dir格式路径
 */
declare let local_map_dir_path: string
/**
 * 临时点
 */
declare let tempLocation: location
/**
 * 临时单位组
 * tip:不要在遍历临时单位组的回调中 再使用临时单位组
 */
declare let tempGroup: group
declare let _tempGroup: group
/**
 * 临时变量
 */
declare let tempBoolean: boolean
declare let tempNumber: number
declare let tempString: string


declare type Vector = {
    x: number,
    y: number,
    z?: number,
}

/**
 * addons
 */
declare function print_r(val: any): any;

// @ts-ignore
declare function require(name: string): any;

/**
 * FourCC
 * FourCC全称Four-Character Codes，代表四字符代码 (four character code), 它是一个32位的标示符
 * 此方法可将4字符的字符串转换为整数
 * (可通过id2string将整数转换为4个字符的字符串)
 */
declare function FourCC(str: string): number;

/**
 * 可将整数转换为4个字符的字符串
 * @param id
 */
declare function id2string(id: number): string;

/**
 * 判断handle 不为空 并且是一个有效的handle
 */
declare function IsHandle(handle: handle): boolean;


/** @noSelf **/
declare class NoSelf {
    [key: string]: (this: void, ...args: any[]) => any;
}

/**
 * ydlua
 */
declare type HandledefInfo = {
    reference: number
    type?: string //若handle被移除后 则没有类型信息
}

declare function functiondef(fun: any): any;

declare function globaldef(val: any): any;

declare function handledef(h: handle): HandledefInfo;

declare function handlemax(): number;

declare function handlecount(): number;

declare function h2i(h: handle): number;

declare function i2h(ih: number): handle;

/**
 * 给handle 增加一个引用计数
 * @param h
 */
declare function handle_ref(h: handle): any;

/**
 * 给handle 减少一个引用计数
 * @param h
 */
declare function handle_unref(h: handle): any;

/**
 * 将handle 引用计数设置到0 以便重用handle
 * @param h
 */
declare function handle_clearref(h: handle): void;

declare function gchash(val: any, hash: number): any;
