local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 6,["17"] = 7,["18"] = 8,["19"] = 10,["20"] = 10,["21"] = 10,["23"] = 10,["24"] = 18,["25"] = 20,["26"] = 21,["27"] = 22,["28"] = 23,["29"] = 24,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 25,["40"] = 28,["41"] = 29,["42"] = 30,["45"] = 34,["46"] = 35,["48"] = 37,["49"] = 38,["50"] = 39,["51"] = 40,["52"] = 41,["53"] = 42,["54"] = 38,["56"] = 47,["59"] = 55,["62"] = 49,["63"] = 52,["64"] = 53,["71"] = 59,["72"] = 60,["73"] = 60,["74"] = 60,["75"] = 60,["76"] = 60,["77"] = 61,["78"] = 62,["79"] = 61,["80"] = 65,["81"] = 66,["82"] = 66,["83"] = 66,["84"] = 66,["85"] = 66,["86"] = 67,["87"] = 68,["88"] = 67,["89"] = 18,["90"] = 73,["91"] = 74,["92"] = 75,["93"] = 76,["94"] = 77,["95"] = 73,["96"] = 81,["97"] = 82,["98"] = 81,["99"] = 85,["100"] = 86,["101"] = 87,["102"] = 88,["103"] = 90,["104"] = 91,["105"] = 92,["106"] = 93,["107"] = 94,["109"] = 96,["110"] = 97,["111"] = 98,["112"] = 99,["113"] = 100,["114"] = 101,["115"] = 102,["116"] = 103,["117"] = 104,["118"] = 105,["119"] = 106,["121"] = 108,["122"] = 108,["123"] = 108,["124"] = 109,["125"] = 108,["126"] = 108,["127"] = 111,["128"] = 112,["130"] = 114,["131"] = 115,["132"] = 116,["133"] = 117,["134"] = 85,["135"] = 120,["136"] = 121,["137"] = 122,["139"] = 123,["140"] = 123,["142"] = 124,["143"] = 125,["144"] = 126,["146"] = 128,["147"] = 129,["148"] = 130,["149"] = 130,["150"] = 130,["151"] = 130,["152"] = 130,["154"] = 132,["155"] = 133,["156"] = 134,["158"] = 136,["161"] = 123,["164"] = 139,["165"] = 120,["166"] = 187,["167"] = 188,["168"] = 189,["169"] = 189,["170"] = 189,["172"] = 189,["174"] = 189,["175"] = 190,["176"] = 191,["178"] = 193,["179"] = 187,["180"] = 11,["181"] = 12,["182"] = 16,["183"] = 143,["184"] = 143,["185"] = 143,["186"] = 143,["187"] = 143,["188"] = 143,["189"] = 143,["190"] = 143,["191"] = 143,["192"] = 143,["193"] = 143,["194"] = 143,["195"] = 143,["196"] = 143,["197"] = 143,["198"] = 143,["199"] = 143,["200"] = 143,["201"] = 143,["202"] = 143,["203"] = 143,["204"] = 143,["205"] = 143,["206"] = 143,["207"] = 143,["208"] = 143,["209"] = 143,["210"] = 143,["211"] = 143,["212"] = 143,["213"] = 143,["214"] = 143,["215"] = 143,["216"] = 143,["217"] = 143,["218"] = 143,["219"] = 143,["220"] = 143,["221"] = 143,["222"] = 143,["223"] = 143,["224"] = 143,["225"] = 143,["226"] = 10});
local ____exports = {}
local ____Log = require("solar.common.Log")
local Log = ____Log.default
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____player = require("solar.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____GroupUtil = require("solar.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local runtime = require("jass.runtime")
local jDebug = require("jass.debug")
local jass = require("jass.common")
____exports.default = __TS__Class()
local Develop = ____exports.default
Develop.name = "Develop"
function Develop.prototype.____constructor(self)
end
function Develop.open(self)
    runtime.debugger = ____exports.default.debuggerPort
    runtime.console = true
    isDebug = true
    if not DzTriggerRegisterSyncData then
        print("本地开发环境DzApi不存在，如需使用DzApi请加入QQ群941442872 群文件下载DzApi相关编辑器插件安装后即可使用！")
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            5,
            "当前环境无完整Japi！"
        )
    end
    do
        pcall(function()
            require("_SLA_temp")
            local _SL_version_info = "编译版本号:" .. tostring(_G._SL_version_info)
            print(_SL_version_info)
        end)
    end
    if isEmbedJapi then
        print("内置Japi版本=" .. tostring(GetPluginVersion()))
    end
    if ____exports.default.isSocketDebug then
        pcall(function()
            local dbg = require("debugger")
            dbg:io("listen:127.0.0.1:" .. tostring(____exports.default.debuggerPort))
            dbg:start()
            print("启动Lua Socket调试 " .. tostring(____exports.default.debuggerPort))
        end)
    end
    if ____exports.default._sl_egp_enable then
        do
            local function ____catch(e)
                print("提示：更新此地图太阳TS框架可以启用编辑器调试工具插件!")
            end
            local ____try, ____hasReturned = pcall(function()
                PACKAGE.path = ((((local_map_dir_path .. "scripts\\?.lua;") .. local_map_dir_path) .. "\\?.lua;") .. tostring(PACKAGE.path)) .. ";_sre\\?.lua;"
                local _require = require
                _require("_sl_egp._sl_egp")
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    local trigger = __TS__New(Trigger)
    trigger:registerPlayerChatEvent(
        MapPlayer:fromIndex(0),
        "d",
        true
    )
    trigger:addAction(function()
        ____exports.default:showDebugInfo()
    end)
    local trigger2 = __TS__New(Trigger)
    trigger2:registerPlayerChatEvent(
        MapPlayer:fromIndex(0),
        "stop",
        true
    )
    trigger2:addAction(function()
        log.debug("暂停Lua垃圾回收:" .. tostring(collectgarbage("stop")))
    end)
end
function Develop.close(self)
    runtime.console = false
    isDebug = false
    Log.enable = false
    Log.enablePrint = false
end
function Develop.showDebugInfo(self)
    log.debug(____exports.default:getDebugInfo())
end
function Develop.getDebugInfo(self)
    local str = "========Develop.showJassDebugInfo():Start========\r\n"
    str = ((str .. "垃圾收集器在运行为：") .. tostring(collectgarbage("isrunning"))) .. "\r\n"
    local lua_memory = collectgarbage("count")
    local stringTs = string
    local lm = stringTs.format("%.3f", lua_memory / 1024)
    str = ((str .. "脚本引擎占用内存[") .. tostring(lm)) .. "m]"
    if GetUsedMemory then
        str = (((str .. "GetUsedMemory=[") .. tostring(GetUsedMemory())) .. "]") .. "\r\n"
    end
    collectgarbage("collect")
    str = ((str .. "handle最大值 =") .. tostring(jDebug.handlemax())) .. "\r\n"
    str = ((str .. "handle总数 =") .. tostring(jDebug.handlecount())) .. "\r\n"
    str = (str .. "========Handle信息:========") .. "\r\n"
    local handleInfoObj = ____exports.default:calculateHandleInfoObj()
    local handleInfoObjs = {}
    for handleInfoObjKey in pairs(handleInfoObj) do
        local obj = handleInfoObj[handleInfoObjKey]
        obj.type = handleInfoObjKey
        obj.typeName = ____exports.default:getTypeCnName(handleInfoObjKey)
        handleInfoObjs[#handleInfoObjs + 1] = obj
    end
    __TS__ArraySort(
        handleInfoObjs,
        function(self, a, b)
            return b.count - a.count
        end
    )
    for ____, obj in ipairs(handleInfoObjs) do
        str = (((((str .. ____exports.default:getTypeCnName(obj.type)) .. "    数量: ") .. tostring(obj.count)) .. "    引用计数: ") .. tostring(obj.reference)) .. "\r\n"
    end
    str = (str .. "========Develop.showJassDebugInfo():End========") .. "\r\n"
    str = ((str .. "GroupUtil.groupObjectPool.getNumActive()=") .. tostring(GroupUtil.groupObjectPool:getNumActive())) .. "\r\n"
    str = ((str .. "GroupUtil.groupObjectPool.getNumIdle()=") .. tostring(GroupUtil.groupObjectPool:getNumIdle())) .. "\r\n"
    return str
end
function Develop.calculateHandleInfoObj(self)
    local startIndex = 1048575
    local handleInfoObj = {}
    do
        local i = startIndex
        while i < startIndex + jDebug.handlemax() do
            do
                local handledefInfo = handledef(i2h(i))
                if not handledefInfo or not handledefInfo.type then
                    goto __continue24
                end
                local infoObj = handleInfoObj[handledefInfo.type]
                if not infoObj then
                    infoObj = {
                        count = 0,
                        reference = 0,
                        typeName = ____exports.default:getTypeCnName(handledefInfo.type)
                    }
                end
                infoObj.count = infoObj.count + 1
                if handledefInfo.reference then
                    infoObj.reference = infoObj.reference + handledefInfo.reference
                end
                handleInfoObj[handledefInfo.type] = infoObj
            end
            ::__continue24::
            i = i + 1
        end
    end
    return handleInfoObj
end
function Develop.getTypeCnName(self, ____type)
    local name = ____exports.default.typeName[____type]
    local ____name_0
    if name then
        ____name_0 = name
    else
        ____name_0 = ____type
    end
    name = ____name_0
    if "事件" == name then
        name = ((tostring(name) .. "(") .. ____type) .. ")"
    end
    return name
end
Develop.debuggerPort = 4279
Develop.isSocketDebug = false
Develop._sl_egp_enable = true
Develop.typeName = {
    ["+loc"] = "点",
    ["+EIP"] = "点特效",
    ["+EIm"] = "附着特效",
    ["+EIf"] = "特效III",
    ["+tmr"] = "计时器",
    item = "物品",
    ["+w3u"] = "单位",
    ["+grp"] = "单位组",
    ["+dlb"] = "按钮",
    ["+dlg"] = "对话框",
    ["+w3d"] = "可破坏物",
    ["+rev"] = "事件",
    alvt = "事件",
    bevt = "事件",
    devt = "事件",
    gevt = "事件",
    gfvt = "事件",
    pcvt = "玩家聊天事件",
    pevt = "玩家事件",
    psvt = "事件",
    tmet = "事件",
    tmvt = "事件",
    uevt = "单位事件",
    wdvt = "可破坏物事件",
    ["+flt"] = "过滤器",
    ["+fgm"] = "可见度修正器",
    ["+frc"] = "玩家组",
    ghth = "哈希表",
    ["+mdb"] = "多面板",
    ["+ply"] = "玩家",
    ["+rct"] = "矩形区域",
    ["+agr"] = "范围",
    ["+snd"] = "声音",
    ["+tid"] = "计时器窗口",
    ["+trg"] = "触发器",
    ["+tac"] = "触发器动作",
    tcnd = "触发器条件",
    ipol = "物品池",
    ["+mbi"] = "多面板项目",
    gcch = "缓存",
    ["+que"] = "任务"
}
____exports.default = Develop
return ____exports
