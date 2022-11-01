import FourCC from "./FourCC";
import SolveLuaAsyn from "./SolveLuaAsyn";
import BaseUtil from "solar/util/BaseUtil";
import EmbedJapi from "./EmbedJapi";
import DzApiHelper from "./DzApiHelper";
import Constant from "../constant/Constant";
import Log from "./Log";
import Develop from "./Develop";
import SolarReload from "./SolarReload";
import Es from "./Es";
import ErrorMsgHelper from "./ErrorMsgHelper";
import IDAdapter from "./IDAdapter";
import SolarEvent from "./SolarEvent";
import DataBase from "./DataBase";
import YDWE from "./YDWE";
import SolarDataClearState from "../atrribute/SolarDataClearState";

const CJ: NoSelf = require('jass.common')
const globals: NoSelf = require('jass.globals')
const japi: NoSelf = require('jass.japi')
const ai: NoSelf = require('jass.ai')
const slk: NoSelf = require('jass.slk')
const runtime: NoSelf | any = require('jass.runtime')
const jConsole: NoSelf = require('jass.console')
const jDebug: NoSelf = require('jass.debug')
const jMessage: NoSelf = require('jass.message')
const storm: NoSelf = require('jass.storm')
log = new Log();

export default class GlobalVars {
    static isInit: boolean = false;
    private static justInvoke: boolean = GlobalVars.init0();

    //要调一个函数 以免import GlobalVars 被编译器取消了
    /**
     * @param debug 是否调试模式
     * @param egp_enable 是否启用太阳编辑器游戏插件  (是否打开游戏左上角太阳Logo按钮) 平台测试异步时最好关闭此项 以免因版本不一致导致异步
     */
    static init(debug: boolean = isDebug, egp_enable = debug) {
        if (_G.GlobalVars_init) {
            return
        }
        // @ts-ignore
        _G.isDebug = debug;
        Develop._sl_egp_enable = egp_enable;
        if (isDebug) {
            Develop.open()
            //热加载lua
            if (DzTriggerRegisterSyncData) {
                SolarReload.init()
            } else {
                log.debug("本地Dzapi环境不存在！未启动热加载模块！")
            }
        } else {
            Develop.close()
        }
        _G.GlobalVars_init = true;
    }

    public static initOnMain(): void {
        GlobalVars.set2G(globals);
        if (isEmbedJapi) {
            EmbedJapi.initInEnd()
            print("初始化内置Japi环境")
        } else {
            /**
             * ydlua 解决异步相关
             * 如果使用其他lua不异步的环境可以注释掉此行 以提高性能
             */
            SolveLuaAsyn.init()
        }
    }


    private static init0(): boolean {
        if (GlobalVars.isInit) {
            return true;
        }
        GlobalVars.isInit = true;
        try {
            require('env_vars')
        } catch (e) {
        }
        isDebug = (storm.load(local_map_dir_path + "/src/App.ts") != null) && (storm.load("war3mapunits.doo") != null)
        if (isDebug) {
            runtime.console = true; //如果App start不执行 可以在此启用控制台 以debug 此类的代码是否正常执行
        }
        GlobalVars.initBaseLuaEnv();
        //初始化所有jass.xxx的值 到_G全局变量上
        GlobalVars.set2G(jDebug)
        GlobalVars.set2G(CJ)
        GlobalVars.set2G(ai)
        GlobalVars.set2G(japi)
        GlobalVars.set2G(slk);
        GlobalVars.set2G(jMessage);
        for (const gk in DzApiHelper) {
            // @ts-ignore
            if (gk.startsWith("DzAPI_")) {
                // @ts-ignore
                _G[gk] = DzApiHelper[gk];
            }
        }
        //初始化基础的方法与变量到_G全局变量上
        GlobalVars.initBaseVars();


        //实现bj 函数
        require('blizzard')
        //InitBlizzard() //lua初始化bj [see war3map.j]
        //实现大部分逆天 函数
        require('solar_addons')
        //解决lua 的数学库 异步问题
        SolveLuaAsyn.SolveMathAsyn();
        //业务上的初始化
        BaseUtil.init();
        Constant.init()
        IDAdapter.init()
        YDWE._sl_init()
        // @ts-ignore
        _G.se = new SolarEvent();
        SolarDataClearState._sl_hookClearHandle();
        DzLoadToc?.("solar_asset\\ui\\base.toc")
        return true;
    }


    private static set2G(obj: any): void {
        //init obj 2 _G
        for (const gk in obj) {
            // @ts-ignore
            _G[gk] = obj[gk];
        }
    }

    /**
     * 初始化Lua环境
     */
    private static initBaseLuaEnv(): void {
        Es.init()
        gameName = "太阳Demo地图";
        //重载print,自动转换编码
        _G.print = function (...args: any[]) {
            jConsole.write(...args)
        };
        //lua error_handle 异常打印
        runtime.error_handle = function (this: void, msg: any) {
            GlobalVars.error_handle(msg)
        }
        runtime.handle_level = 0;
        //判断lua环境是否为内置japi
        if (japi.GetPluginVersion) {
            isEmbedJapi = true;
            EmbedJapi.init()
        } else {
            isEmbedJapi = false;
        }
        //判断lua环境是否为内置浏览器
        if (japi.InitHtml5Plugin) {
            isEmbedBrowser = true;
        } else {
            isEmbedBrowser = false;
        }
        //实现 json
        require('base')
        require('json')
    }

    private static error_handle(this: void, msg: any): void {
        let errorMsgHelper = new ErrorMsgHelper(msg, debug.traceback());
        ErrorMsgHelper.printErrorMsgHelper(errorMsgHelper);
    }

    private static initBaseVars(): void {
        // @ts-ignore
        gameDifficulty = 1;
        isBigAttributeMode = false;
        StrHpBonus = S2R(misc["Misc"]["StrHitPointBonus"]);
        AgiDefenseBonus = S2R(misc["Misc"]["AgiDefenseBonus"]);
        IntManaBonus = S2R(misc["Misc"]["IntManaBonus"]);
        PrimaryAttackBonus = S2R(misc["Misc"]["StrAttackBonus"]);
        ArmorReducesDamageFactor = S2R(misc["Misc"]["DefenseArmor"]);
        // print("PrimaryAttackBonus=" + PrimaryAttackBonus + "    ArmorReducesDamageFactor=" + ArmorReducesDamageFactor)
        isAsync = false;
        settings = {};
        gv = {};
        db = DataBase;
        sd = DataBase.sd;
        _G.FourCC = FourCC.string2id
        _G.id2string = FourCC.id2string
        tempLocation = Location(0, 0);
        tempGroup = CreateGroup();
        _tempGroup = CreateGroup();
        // @ts-ignore
        _G.globals = globals
        _G.IsHandle = function (h: handle | number) {
            if (h == null || h == 0) {
                return false
            }
            return true;
        }
        _G.handle_clearref = function (h: handle) {
            if (!IsHandle(h)) {
                return
            }
            for (let i = 0; i < 10000; i++) {
                if (handledef(h).reference > 0) {
                    handle_unref(h)
                } else {
                    return;
                }
            }
        }
        _G.char2number = function (char: string): number {
            // @ts-ignore
            let t: NoSelf = string
            return t.byte(char, 1);
        }

        _G.HttpRequest = function (url: string, post: string, onResult: (this: void, result: string) => void): any {
            if (post_message) {
                return post_message(url, post, onResult)
            } else {
                let info = "此函数暂时未兼容你的脚本环境!";
                print(info)
                onResult(info);
            }
            return false;
        }
    }


}
