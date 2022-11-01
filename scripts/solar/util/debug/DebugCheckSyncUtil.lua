local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 7,["15"] = 7,["16"] = 8,["17"] = 8,["18"] = 10,["19"] = 19,["20"] = 19,["21"] = 19,["22"] = 19,["23"] = 19,["24"] = 19,["25"] = 19,["26"] = 19,["27"] = 31,["28"] = 31,["29"] = 31,["31"] = 31,["32"] = 42,["33"] = 42,["34"] = 42,["36"] = 43,["37"] = 45,["38"] = 45,["39"] = 45,["40"] = 46,["41"] = 47,["42"] = 48,["43"] = 49,["45"] = 51,["46"] = 45,["47"] = 45,["48"] = 54,["49"] = 54,["50"] = 54,["51"] = 55,["52"] = 56,["53"] = 57,["55"] = 59,["56"] = 54,["57"] = 54,["58"] = 62,["59"] = 63,["61"] = 66,["62"] = 66,["63"] = 66,["64"] = 67,["65"] = 68,["67"] = 70,["68"] = 71,["69"] = 66,["70"] = 66,["71"] = 74,["72"] = 74,["73"] = 74,["74"] = 75,["75"] = 76,["76"] = 76,["77"] = 76,["78"] = 76,["79"] = 76,["80"] = 76,["81"] = 76,["83"] = 74,["84"] = 74,["85"] = 80,["86"] = 42,["87"] = 85,["88"] = 87,["89"] = 87,["90"] = 88,["93"] = 91,["94"] = 93,["96"] = 93,["97"] = 93,["98"] = 93,["100"] = 93,["102"] = 93,["103"] = 94,["104"] = 95,["107"] = 98,["108"] = 99,["109"] = 100,["110"] = 101,["111"] = 102,["112"] = 104,["114"] = 87,["115"] = 87,["116"] = 87,["117"] = 85,["118"] = 110,["119"] = 111,["120"] = 112,["121"] = 113,["122"] = 114,["124"] = 116,["125"] = 117,["126"] = 118,["127"] = 119,["128"] = 120,["131"] = 110,["132"] = 126,["133"] = 127,["134"] = 128,["135"] = 129,["136"] = 130,["137"] = 131,["139"] = 133,["140"] = 134,["143"] = 137,["144"] = 139,["145"] = 140,["146"] = 141,["147"] = 142,["150"] = 146,["151"] = 147,["152"] = 148,["153"] = 149,["154"] = 149,["155"] = 149,["156"] = 149,["157"] = 149,["158"] = 149,["159"] = 149,["160"] = 150,["161"] = 151,["164"] = 155,["165"] = 155,["166"] = 155,["167"] = 156,["168"] = 157,["169"] = 155,["170"] = 155,["171"] = 126,["172"] = 165,["174"] = 166,["175"] = 167,["176"] = 168,["177"] = 169,["179"] = 171,["180"] = 171,["181"] = 171,["182"] = 171,["183"] = 171,["184"] = 171,["185"] = 171,["186"] = 178,["187"] = 165,["188"] = 181,["189"] = 183,["190"] = 184,["191"] = 185,["192"] = 186,["193"] = 181,["194"] = 32,["195"] = 33,["196"] = 34,["197"] = 35,["198"] = 36,["199"] = 31});
local ____exports = {}
local ____SyncUtil = require("solar.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ForceUtil = require("solar.util.game.ForceUtil")
local ForceUtil = ____ForceUtil.default
local ____DebugUtil = require("solar.util.debug.DebugUtil")
local DebugUtil = ____DebugUtil.default
local ____DebugVmUtil = require("solar.util.debug.DebugVmUtil")
local DebugVmUtil = ____DebugVmUtil.default
local CJ = require("jass.common")
local SyncFunNames = {
    CreateUnit = true,
    CreateTimer = true,
    CreateTrigger = true,
    CreateItem = true,
    CreateUnitAtLoc = true,
    GetRandomReal = true
}
____exports.default = __TS__Class()
local DebugCheckSyncUtil = ____exports.default
DebugCheckSyncUtil.name = "DebugCheckSyncUtil"
function DebugCheckSyncUtil.prototype.____constructor(self)
end
function DebugCheckSyncUtil.start(checkFuns)
    if checkFuns == nil then
        checkFuns = false
    end
    ____exports.default.checkFuns = checkFuns
    SyncUtil.onSyncObjData(
        "CheckSync",
        function(____, p, obj)
            local syncDatas = ____exports.default.checkSyncData[obj.index]
            if syncDatas == nil then
                syncDatas = {}
                ____exports.default.checkSyncData[obj.index] = syncDatas
            end
            syncDatas[#syncDatas + 1] = obj
        end
    )
    BaseUtil.onTimer(
        1,
        function(____, c)
            ____exports.default.syncCheckCode("定时检查")
            if ____exports.default.stop then
                return false
            end
            return true
        end
    )
    if checkFuns then
        ____exports.default.initCheckFuns()
    end
    BaseUtil.onTimer(
        1,
        function(____, c)
            if ____exports.default.stop then
                return false
            end
            ____exports.default.check()
            return true
        end
    )
    DebugUtil.onChat(
        "yb",
        function()
            if GetLocalPlayer() == GetTriggerPlayer() then
                CreateUnit(
                    GetLocalPlayer(),
                    "hpea",
                    0,
                    0,
                    0
                )
            end
        end
    )
    print("启动异步校验检测器！")
end
function DebugCheckSyncUtil.initCheckFuns()
    DebugVmUtil:sethook(
        function(event)
            if ____exports.default.stop then
                return
            end
            local information = debug.getinfo(2, "nS")
            local ____temp_2 = not ____exports.default._stopHook
            if ____temp_2 then
                local ____information_name_0 = information
                if ____information_name_0 ~= nil then
                    ____information_name_0 = ____information_name_0.name
                end
                ____temp_2 = ____information_name_0
            end
            if ____temp_2 and SyncFunNames[information.name] == true then
                if isAsync then
                    log.errorWithTraceBack("不能在同步中调用此方法:")
                    return
                end
                ____exports.default._stopHook = true
                local tsSrcNameLine = DebugVmUtil:getTsSrcLineName(information)
                local tsSrcNameLine3 = DebugVmUtil:getTsSrcLineName(debug.getinfo(3, "nS"))
                local tsSrcNameLine4 = DebugVmUtil:getTsSrcLineName(debug.getinfo(4, "nS"))
                ____exports.default.syncCheckCode((((((("方法校验:" .. tsSrcNameLine) .. "\r\n") .. tsSrcNameLine3) .. "\r\n") .. tostring(tsSrcNameLine4)) .. "\r\n--\r\n") .. debug.traceback())
                ____exports.default._stopHook = false
            end
        end,
        "r"
    )
end
function DebugCheckSyncUtil.check()
    local userCount = ForceUtil.getUserCount()
    local csdLen = #__TS__ObjectKeys(____exports.default.checkSyncData)
    if csdLen > 5 then
        print("CheckSync.checkSyncData.length=" .. tostring(csdLen))
    end
    for index in pairs(____exports.default.checkSyncData) do
        local syncDatas = ____exports.default.checkSyncData[index]
        if #syncDatas >= userCount then
            ____exports.default.checkSyncDatas(syncDatas)
            ____exports.default.checkSyncData[index] = nil
        end
    end
end
function DebugCheckSyncUtil.checkSyncDatas(syncDatas)
    local checkCodeCount = {}
    local rightCheckCode = 0
    local rightCheckCodeVote = 0
    for ____, syncData in ipairs(syncDatas) do
        checkCodeCount[tostring(syncData.checkCode)] = (checkCodeCount[tostring(syncData.checkCode)] or 0) + 1
    end
    local cccLen = #__TS__ObjectKeys(checkCodeCount)
    if cccLen <= 1 then
        return
    end
    print("checkCodeCount.length=" .. tostring(cccLen))
    for checkCode in pairs(checkCodeCount) do
        if checkCodeCount[checkCode] > rightCheckCodeVote then
            rightCheckCode = tonumber(checkCode)
            rightCheckCodeVote = checkCodeCount[checkCode]
        end
    end
    for ____, syncData in ipairs(syncDatas) do
        if syncData.checkCode ~= rightCheckCode then
            local info = ((("|cffff0000【异步校验】玩家" .. tostring(syncData.pid + 1)) .. ":") .. GetPlayerName(Player(syncData.pid))) .. ":进入了异次元！"
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                info
            )
            print(info)
            print_r(syncData)
        end
    end
    BaseUtil.runLater(
        3,
        function()
            print("已经出现异步状况！关闭异步检测系统!")
            ____exports.default.stop = true
        end
    )
end
function DebugCheckSyncUtil.syncCheckCode(info)
    local ____exports_default_3, ____index_4 = ____exports.default, "index"
    ____exports_default_3[____index_4] = ____exports_default_3[____index_4] + 1
    local checkCode = ____exports.default.countCheckCode()
    if info and #info > 500 then
        info = __TS__StringSubstring(info, 0, 500)
    end
    local syncData = {
        index = ____exports.default.index,
        gameTime = BaseUtil.time,
        pid = GetPlayerId(GetLocalPlayer()),
        info = info,
        checkCode = checkCode
    }
    SyncUtil.syncObjData("CheckSync", syncData)
end
function DebugCheckSyncUtil.countCheckCode()
    local checkCode = CJ.GetRandomInt(1, 999999)
    checkCode = checkCode + handlecount()
    checkCode = checkCode + handlemax()
    return checkCode
end
DebugCheckSyncUtil.index = 0
DebugCheckSyncUtil.checkSyncData = {}
DebugCheckSyncUtil.stop = false
DebugCheckSyncUtil.checkFuns = false
DebugCheckSyncUtil._stopHook = false
____exports.default = DebugCheckSyncUtil
return ____exports
