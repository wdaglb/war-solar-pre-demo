local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 9,["25"] = 9,["26"] = 10,["27"] = 10,["28"] = 11,["29"] = 11,["30"] = 12,["31"] = 12,["32"] = 13,["33"] = 13,["34"] = 14,["35"] = 14,["36"] = 15,["37"] = 15,["38"] = 16,["39"] = 16,["40"] = 18,["41"] = 19,["42"] = 20,["43"] = 21,["44"] = 22,["45"] = 23,["46"] = 24,["47"] = 25,["48"] = 26,["49"] = 27,["50"] = 28,["51"] = 30,["52"] = 30,["53"] = 30,["55"] = 30,["56"] = 39,["57"] = 39,["58"] = 39,["60"] = 39,["61"] = 39,["63"] = 40,["66"] = 44,["67"] = 45,["68"] = 46,["69"] = 47,["70"] = 49,["71"] = 50,["73"] = 52,["76"] = 55,["78"] = 57,["79"] = 39,["80"] = 60,["81"] = 61,["82"] = 62,["83"] = 63,["84"] = 64,["86"] = 70,["88"] = 60,["89"] = 75,["90"] = 76,["91"] = 77,["93"] = 79,["96"] = 81,["99"] = 84,["100"] = 85,["101"] = 86,["103"] = 88,["104"] = 90,["105"] = 91,["106"] = 92,["107"] = 93,["108"] = 94,["109"] = 95,["110"] = 96,["111"] = 98,["112"] = 100,["115"] = 104,["116"] = 108,["117"] = 111,["118"] = 113,["119"] = 115,["120"] = 116,["121"] = 117,["122"] = 118,["123"] = 120,["124"] = 121,["125"] = 122,["126"] = 122,["127"] = 122,["129"] = 123,["130"] = 75,["131"] = 127,["132"] = 129,["133"] = 131,["135"] = 127,["136"] = 138,["137"] = 139,["138"] = 140,["139"] = 142,["140"] = 143,["141"] = 142,["142"] = 146,["143"] = 147,["144"] = 146,["145"] = 149,["146"] = 151,["147"] = 152,["148"] = 153,["150"] = 155,["152"] = 158,["153"] = 159,["155"] = 161,["157"] = 164,["158"] = 165,["159"] = 138,["160"] = 168,["161"] = 169,["162"] = 169,["163"] = 169,["164"] = 169,["165"] = 169,["166"] = 170,["167"] = 168,["168"] = 173,["169"] = 175,["170"] = 176,["171"] = 177,["172"] = 178,["173"] = 179,["174"] = 180,["175"] = 181,["176"] = 183,["177"] = 184,["178"] = 185,["179"] = 186,["180"] = 187,["181"] = 188,["182"] = 189,["183"] = 190,["184"] = 191,["185"] = 192,["186"] = 194,["187"] = 195,["188"] = 196,["189"] = 197,["191"] = 199,["192"] = 195,["193"] = 201,["194"] = 202,["198"] = 205,["199"] = 205,["200"] = 206,["201"] = 207,["205"] = 205,["208"] = 201,["209"] = 213,["210"] = 215,["211"] = 216,["212"] = 213,["213"] = 219,["214"] = 220,["215"] = 221,["217"] = 223,["218"] = 224,["219"] = 225,["221"] = 227,["222"] = 219,["223"] = 173,["224"] = 31,["225"] = 32,["226"] = 30});
local ____exports = {}
local ____FourCC = require("solar.common.FourCC")
local FourCC = ____FourCC.default
local ____SolveLuaAsyn = require("solar.common.SolveLuaAsyn")
local SolveLuaAsyn = ____SolveLuaAsyn.default
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____EmbedJapi = require("solar.common.EmbedJapi")
local EmbedJapi = ____EmbedJapi.default
local ____DzApiHelper = require("solar.common.DzApiHelper")
local DzApiHelper = ____DzApiHelper.default
local ____Constant = require("solar.constant.Constant")
local Constant = ____Constant.default
local ____Log = require("solar.common.Log")
local Log = ____Log.default
local ____Develop = require("solar.common.Develop")
local Develop = ____Develop.default
local ____SolarReload = require("solar.common.SolarReload")
local SolarReload = ____SolarReload.default
local ____Es = require("solar.common.Es")
local Es = ____Es.default
local ____ErrorMsgHelper = require("solar.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
local ____IDAdapter = require("solar.common.IDAdapter")
local IDAdapter = ____IDAdapter.default
local ____SolarEvent = require("solar.common.SolarEvent")
local SolarEvent = ____SolarEvent.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____YDWE = require("solar.common.YDWE")
local YDWE = ____YDWE.default
local ____SolarDataClearState = require("solar.atrribute.SolarDataClearState")
local SolarDataClearState = ____SolarDataClearState.default
local CJ = require("jass.common")
local globals = require("jass.globals")
local japi = require("jass.japi")
local ai = require("jass.ai")
local slk = require("jass.slk")
local runtime = require("jass.runtime")
local jConsole = require("jass.console")
local jDebug = require("jass.debug")
local jMessage = require("jass.message")
local storm = require("jass.storm")
log = __TS__New(Log)
____exports.default = __TS__Class()
local GlobalVars = ____exports.default
GlobalVars.name = "GlobalVars"
function GlobalVars.prototype.____constructor(self)
end
function GlobalVars.init(self, ____debug, egp_enable)
    if ____debug == nil then
        ____debug = isDebug
    end
    if egp_enable == nil then
        egp_enable = ____debug
    end
    if _G.GlobalVars_init then
        return
    end
    _G.isDebug = ____debug
    Develop._sl_egp_enable = egp_enable
    if isDebug then
        Develop:open()
        if DzTriggerRegisterSyncData then
            SolarReload:init()
        else
            log.debug("本地Dzapi环境不存在！未启动热加载模块！")
        end
    else
        Develop:close()
    end
    _G.GlobalVars_init = true
end
function GlobalVars.initOnMain(self)
    ____exports.default:set2G(globals)
    if isEmbedJapi then
        EmbedJapi:initInEnd()
        print("初始化内置Japi环境")
    else
        SolveLuaAsyn.init()
    end
end
function GlobalVars.init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    do
        pcall(function()
            require("env_vars")
        end)
    end
    isDebug = storm.load(local_map_dir_path .. "/src/App.ts") ~= nil and storm.load("war3mapunits.doo") ~= nil
    if isDebug then
        runtime.console = true
    end
    ____exports.default:initBaseLuaEnv()
    ____exports.default:set2G(jDebug)
    ____exports.default:set2G(CJ)
    ____exports.default:set2G(ai)
    ____exports.default:set2G(japi)
    ____exports.default:set2G(slk)
    ____exports.default:set2G(jMessage)
    for gk in pairs(DzApiHelper) do
        if __TS__StringStartsWith(gk, "DzAPI_") then
            _G[gk] = DzApiHelper[gk]
        end
    end
    ____exports.default:initBaseVars()
    require("blizzard")
    require("solar_addons")
    SolveLuaAsyn.SolveMathAsyn()
    BaseUtil.init()
    Constant:init()
    IDAdapter.init()
    YDWE:_sl_init()
    _G.se = __TS__New(SolarEvent)
    SolarDataClearState:_sl_hookClearHandle()
    local ____DzLoadToc_result_0 = DzLoadToc
    if ____DzLoadToc_result_0 ~= nil then
        ____DzLoadToc_result_0 = ____DzLoadToc_result_0("solar_asset\\ui\\base.toc")
    end
    return true
end
function GlobalVars.set2G(self, obj)
    for gk in pairs(obj) do
        _G[gk] = obj[gk]
    end
end
function GlobalVars.initBaseLuaEnv(self)
    Es:init()
    gameName = "太阳Demo地图"
    _G.print = function(...)
        jConsole.write(...)
    end
    runtime.error_handle = function(msg)
        ____exports.default.error_handle(msg)
    end
    runtime.handle_level = 0
    if japi.GetPluginVersion then
        isEmbedJapi = true
        EmbedJapi:init()
    else
        isEmbedJapi = false
    end
    if japi.InitHtml5Plugin then
        isEmbedBrowser = true
    else
        isEmbedBrowser = false
    end
    require("base")
    require("json")
end
function GlobalVars.error_handle(msg)
    local errorMsgHelper = __TS__New(
        ErrorMsgHelper,
        msg,
        debug.traceback()
    )
    ErrorMsgHelper.printErrorMsgHelper(errorMsgHelper)
end
function GlobalVars.initBaseVars(self)
    gameDifficulty = 1
    isBigAttributeMode = false
    StrHpBonus = S2R(misc.Misc.StrHitPointBonus)
    AgiDefenseBonus = S2R(misc.Misc.AgiDefenseBonus)
    IntManaBonus = S2R(misc.Misc.IntManaBonus)
    PrimaryAttackBonus = S2R(misc.Misc.StrAttackBonus)
    ArmorReducesDamageFactor = S2R(misc.Misc.DefenseArmor)
    isAsync = false
    settings = {}
    gv = {}
    db = DataBase
    sd = DataBase.sd
    _G.FourCC = FourCC.string2id
    _G.id2string = FourCC.id2string
    tempLocation = Location(0, 0)
    tempGroup = CreateGroup()
    _tempGroup = CreateGroup()
    _G.globals = globals
    _G.IsHandle = function(h)
        if h == nil or h == 0 then
            return false
        end
        return true
    end
    _G.handle_clearref = function(h)
        if not IsHandle(h) then
            return
        end
        do
            local i = 0
            while i < 10000 do
                if handledef(h).reference > 0 then
                    handle_unref(h)
                else
                    return
                end
                i = i + 1
            end
        end
    end
    _G.char2number = function(char)
        local t = string
        return t.byte(char, 1)
    end
    _G.HttpRequest = function(url, post, onResult)
        if post_message then
            return post_message(url, post, onResult)
        else
            local info = "此函数暂时未兼容你的脚本环境!"
            print(info)
            onResult(info)
        end
        return false
    end
end
GlobalVars.isInit = false
GlobalVars.justInvoke = ____exports.default:init0()
____exports.default = GlobalVars
return ____exports
