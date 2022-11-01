local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 14,["14"] = 14,["15"] = 14,["17"] = 14,["18"] = 31,["19"] = 31,["20"] = 31,["22"] = 32,["23"] = 33,["24"] = 34,["26"] = 36,["27"] = 37,["28"] = 38,["30"] = 40,["31"] = 31,["32"] = 50,["33"] = 50,["34"] = 50,["36"] = 51,["37"] = 52,["38"] = 53,["39"] = 54,["40"] = 55,["42"] = 57,["43"] = 58,["44"] = 59,["46"] = 50,["47"] = 66,["48"] = 67,["49"] = 68,["50"] = 66,["51"] = 75,["52"] = 76,["53"] = 77,["54"] = 78,["57"] = 81,["58"] = 82,["59"] = 83,["61"] = 85,["62"] = 75,["63"] = 91,["65"] = 92,["66"] = 92,["67"] = 93,["68"] = 94,["69"] = 92,["72"] = 96,["73"] = 91,["74"] = 102,["75"] = 103,["76"] = 104,["77"] = 105,["78"] = 106,["80"] = 109,["81"] = 110,["82"] = 111,["83"] = 113,["84"] = 114,["85"] = 115,["87"] = 117,["88"] = 118,["89"] = 119,["90"] = 120,["91"] = 121,["95"] = 124,["96"] = 124,["97"] = 125,["98"] = 126,["99"] = 127,["101"] = 129,["102"] = 130,["103"] = 131,["104"] = 124,["107"] = 134,["108"] = 135,["109"] = 102,["110"] = 145,["111"] = 146,["112"] = 147,["114"] = 149,["116"] = 150,["117"] = 150,["118"] = 151,["119"] = 153,["120"] = 154,["122"] = 150,["125"] = 158,["126"] = 145,["127"] = 161,["128"] = 162,["129"] = 163,["130"] = 164,["132"] = 165,["133"] = 165,["134"] = 166,["135"] = 167,["136"] = 168,["137"] = 169,["141"] = 165,["144"] = 175,["145"] = 176,["149"] = 219,["150"] = 220,["151"] = 220,["152"] = 220,["153"] = 220,["154"] = 220,["155"] = 220,["156"] = 220,["157"] = 221,["160"] = 179,["161"] = 180,["163"] = 182,["164"] = 183,["165"] = 185,["166"] = 186,["167"] = 187,["168"] = 188,["169"] = 188,["170"] = 188,["171"] = 189,["172"] = 188,["173"] = 188,["175"] = 193,["176"] = 194,["177"] = 195,["178"] = 197,["179"] = 199,["180"] = 200,["181"] = 201,["183"] = 204,["184"] = 205,["185"] = 206,["187"] = 209,["188"] = 210,["189"] = 210,["190"] = 210,["191"] = 210,["192"] = 210,["193"] = 210,["194"] = 210,["195"] = 211,["196"] = 211,["197"] = 211,["198"] = 212,["199"] = 211,["200"] = 211,["203"] = 217,["209"] = 178,["212"] = 223,["213"] = 161,["214"] = 16,["215"] = 17,["216"] = 18,["217"] = 19,["218"] = 20,["219"] = 22,["220"] = 143,["221"] = 14});
local ____exports = {}
local ____CodecUtil = require("solar.util.math.CodecUtil")
local CodecUtil = ____CodecUtil.default
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____player = require("solar.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
____exports.default = __TS__Class()
local ArchiveUtil = ____exports.default
ArchiveUtil.name = "ArchiveUtil"
function ArchiveUtil.prototype.____constructor(self)
end
function ArchiveUtil.get(self, whichPlayer, key, mapLevelLimit)
    if mapLevelLimit == nil then
        mapLevelLimit = 0
    end
    ____exports.default:_init0()
    if mapLevelLimit > 0 and DzAPI_Map_GetMapLevel(whichPlayer) < mapLevelLimit then
        return nil
    end
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        return nil
    end
    return data[key]
end
function ArchiveUtil.set(self, whichPlayer, key, value, isSaveAll)
    if isSaveAll == nil then
        isSaveAll = true
    end
    ____exports.default:_init0()
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        data = {}
        ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))] = data
    end
    data[key] = value
    if isSaveAll then
        ____exports.default:saveAll(whichPlayer)
    end
end
function ArchiveUtil.getAllArchive(self, whichPlayer)
    ____exports.default:_init0()
    return ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
end
function ArchiveUtil.printAllArchive(self, whichPlayer)
    ____exports.default:_init0()
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        return
    end
    print(("========打印玩家" .. tostring(GetPlayerId(whichPlayer) + 1)) .. "的存档 开始========")
    for dataKey in pairs(data) do
        print(((dataKey .. "=[") .. tostring(data[dataKey])) .. "]")
    end
    print(("========打印玩家" .. tostring(GetPlayerId(whichPlayer) + 1)) .. "的存档 结束========")
end
function ArchiveUtil.clearAllArchive(self, whichPlayer)
    do
        local i = 0
        while i < ____exports.default.ArchiveKeyCountMax do
            local key = ____exports.default.baseArchiveKeyPrefix .. tostring(i)
            DzAPI_Map_FlushStoredMission(whichPlayer, key)
            i = i + 1
        end
    end
    print("已清理全部存档!")
end
function ArchiveUtil.saveAll(self, whichPlayer)
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        data = {}
        ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))] = data
    end
    data._SL = DzAPI_Map_GetMapLevel(whichPlayer)
    data._SH = StringHash(GetPlayerName(whichPlayer))
    data._SI = MapPlayer:fromHandle(whichPlayer).userId
    local dataJsonStr = JSON:stringify(data)
    if ____exports.default.encrypt then
        dataJsonStr = CodecUtil:saesEncode(dataJsonStr, gameName .. ____exports.default.salt)
    end
    local dataJsonStrLength = #dataJsonStr
    local keyLength = math.floor(dataJsonStrLength / 64) + 1
    log.debug((("玩家" .. tostring(GetPlayerId(whichPlayer))) .. "的存档栏位大小为:") .. tostring(keyLength))
    if keyLength > ____exports.default.ArchiveKeyCountMax then
        log.errorWithTraceBack((("存档栏位大小超过" .. tostring(____exports.default.ArchiveKeyCountMax)) .. "！") .. tostring(keyLength))
        return
    end
    do
        local i = 0
        while i < keyLength do
            local endIndex = (i + 1) * 64
            if endIndex > dataJsonStrLength then
                endIndex = dataJsonStrLength
            end
            local oneData = __TS__StringSubstring(dataJsonStr, i * 64, endIndex)
            local key = ____exports.default.baseArchiveKeyPrefix .. tostring(i)
            DzAPI_Map_SaveServerValue(whichPlayer, key, oneData)
            i = i + 1
        end
    end
    local key = ____exports.default.baseArchiveKeyPrefix .. tostring(keyLength)
    DzAPI_Map_FlushStoredMission(whichPlayer, key)
end
function ArchiveUtil._init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                ____exports.default.playerDatas["P" .. tostring(i)] = ____exports.default:_init0_onePlayer(tempPlayer)
            end
            i = i + 1
        end
    end
    return true
end
function ArchiveUtil._init0_onePlayer(self, tempPlayer)
    local data = {}
    local i = GetPlayerId(tempPlayer)
    local dataJsonStr = ""
    do
        local i = 0
        while i < ____exports.default.ArchiveKeyCountMax do
            local key = ____exports.default.baseArchiveKeyPrefix .. tostring(i)
            local serverValue = DzAPI_Map_GetServerValue(tempPlayer, key)
            if serverValue and #serverValue > 0 then
                dataJsonStr = dataJsonStr .. serverValue
            else
                break
            end
            i = i + 1
        end
    end
    if #dataJsonStr < 2 then
        return {}
    end
    do
        local function ____catch(e)
            log.errorWithTraceBack("存档Json格式解析出错!")
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                "存档格式解析出错！"
            )
            print(("需要解析的Json字符串为[" .. dataJsonStr) .. "]")
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            if ____exports.default.encrypt then
                dataJsonStr = CodecUtil:saesDecode(dataJsonStr, gameName .. ____exports.default.salt)
            end
            data = JSON:parse(dataJsonStr)
            log.debug((("玩家" .. tostring(i + 1)) .. ":的存档数据为:") .. dataJsonStr)
            if DzAPI_Map_GetMapLevel(tempPlayer) < data._SL then
                print("存档验证失败!默认使用空存档!")
                data = {}
                BaseUtil.runLater(
                    1,
                    function()
                        CustomDefeatBJ(tempPlayer, "警告:存档验证失败C1！")
                    end
                )
            end
            local shTemp = StringHash(GetPlayerName(tempPlayer))
            local userId = MapPlayer:fromHandle(tempPlayer).userId
            if userId == -1 then
                local info = "提示:请不要再地图初始时获取存档！应当延迟执行存档逻辑!"
                print(info)
                print("请等待内置userId(用户id)同步完成！(为了解决玩家名更改后靠userId判断是否是自己的存档)")
                log.errorWithTraceBack(info)
            end
            if ____exports.default.verifyPlayerName and data._SH and data._SH ~= shTemp then
                if data._SI and data._SI > 0 and data._SI == userId then
                    print("检测到玩家改名了！自动修正存档!")
                else
                    data = {}
                    DisplayTimedTextToPlayer(
                        tempPlayer,
                        0,
                        0,
                        60,
                        "存档验证失败!自动退出游戏!"
                    )
                    BaseUtil.runLater(
                        1,
                        function()
                            CustomDefeatBJ(tempPlayer, "警告:存档验证失败C2！")
                        end
                    )
                end
            end
            return true, data
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return data
end
ArchiveUtil.encrypt = true
ArchiveUtil.verifyPlayerName = not isDebug
ArchiveUtil.ArchiveKeyCountMax = 150
ArchiveUtil.salt = "s_z_b_s_q_j"
ArchiveUtil.baseArchiveKeyPrefix = "Solar_Base_Archive_"
ArchiveUtil.playerDatas = {}
ArchiveUtil.isInit = false
____exports.default = ArchiveUtil
return ____exports
