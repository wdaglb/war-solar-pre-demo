local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 11,["10"] = 11,["11"] = 11,["13"] = 11,["14"] = 25,["15"] = 26,["16"] = 27,["17"] = 25,["18"] = 30,["19"] = 31,["20"] = 32,["21"] = 33,["22"] = 30,["23"] = 39,["24"] = 40,["25"] = 41,["26"] = 39,["27"] = 48,["28"] = 49,["29"] = 50,["30"] = 51,["33"] = 54,["34"] = 55,["35"] = 56,["37"] = 58,["38"] = 48,["39"] = 65,["41"] = 66,["42"] = 66,["43"] = 67,["44"] = 68,["45"] = 66,["48"] = 70,["49"] = 65,["50"] = 76,["51"] = 77,["52"] = 78,["53"] = 79,["54"] = 80,["56"] = 82,["57"] = 83,["58"] = 84,["59"] = 85,["60"] = 86,["64"] = 89,["65"] = 89,["66"] = 90,["67"] = 91,["68"] = 92,["70"] = 94,["71"] = 95,["72"] = 96,["73"] = 89,["76"] = 99,["77"] = 100,["78"] = 101,["80"] = 76,["81"] = 113,["82"] = 114,["83"] = 115,["85"] = 117,["86"] = 118,["87"] = 119,["89"] = 120,["90"] = 120,["91"] = 121,["92"] = 122,["93"] = 123,["94"] = 124,["98"] = 120,["101"] = 130,["102"] = 131,["106"] = 143,["107"] = 144,["108"] = 144,["109"] = 144,["110"] = 144,["111"] = 144,["112"] = 144,["113"] = 144,["114"] = 145,["117"] = 134,["118"] = 135,["120"] = 137,["121"] = 138,["122"] = 140,["123"] = 141,["129"] = 133,["132"] = 147,["133"] = 113,["134"] = 13,["135"] = 14,["136"] = 15,["137"] = 16,["138"] = 18,["139"] = 111,["140"] = 11});
local ____exports = {}
local ____CodecUtil = require("solar.util.math.CodecUtil")
local CodecUtil = ____CodecUtil.default
____exports.default = __TS__Class()
local GlobalArchiveUtil = ____exports.default
GlobalArchiveUtil.name = "GlobalArchiveUtil"
function GlobalArchiveUtil.prototype.____constructor(self)
end
function GlobalArchiveUtil.get(self, key)
    ____exports.default:_init0()
    return ____exports.default.data[key]
end
function GlobalArchiveUtil.set(self, key, value)
    ____exports.default:_init0()
    ____exports.default.data[key] = value
    ____exports.default:save()
end
function GlobalArchiveUtil.getAllArchive(self)
    ____exports.default:_init0()
    return ____exports.default.data
end
function GlobalArchiveUtil.printAllArchive(self)
    ____exports.default:_init0()
    local data = ____exports.default.data
    if not data then
        return
    end
    print("========打印全局存档 开始========")
    for dataKey in pairs(data) do
        print(((dataKey .. "=[") .. tostring(data[dataKey])) .. "]")
    end
    print("========打印全局存档 结束========")
end
function GlobalArchiveUtil.clearAllArchive(self)
    do
        local i = 0
        while i < ____exports.default.ArchiveKeyCountMax do
            local key = ____exports.default.baseArchiveKeyPrefix .. tostring(i)
            DzAPI_Map_Global_StoreString(key, "")
            i = i + 1
        end
    end
    print("已清理全部全局存档!")
end
function GlobalArchiveUtil.save(self)
    local data = ____exports.default.data
    local dataJsonStr = JSON:stringify(data)
    if ____exports.default.encrypt then
        dataJsonStr = CodecUtil:saesEncode(dataJsonStr, gameName .. ____exports.default.salt)
    end
    local dataJsonStrLength = #dataJsonStr
    local keyLength = math.floor(dataJsonStrLength / 64) + 1
    log.debug("全局存档栏位大小为:" .. tostring(keyLength))
    if keyLength > ____exports.default.ArchiveKeyCountMax then
        log.errorWithTraceBack((("全局栏位大小超过" .. tostring(____exports.default.ArchiveKeyCountMax)) .. "！") .. tostring(keyLength))
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
            DzAPI_Map_Global_StoreString(key, oneData)
            i = i + 1
        end
    end
    local key = ____exports.default.baseArchiveKeyPrefix .. tostring(keyLength)
    if keyLength < ____exports.default.ArchiveKeyCountMax then
        DzAPI_Map_Global_StoreString(key, "")
    end
end
function GlobalArchiveUtil._init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    local data = {}
    local dataJsonStr = ""
    do
        local i = 0
        while i < ____exports.default.ArchiveKeyCountMax do
            local key = ____exports.default.baseArchiveKeyPrefix .. tostring(i)
            local serverValue = DzAPI_Map_Global_GetStoreString(key)
            if serverValue and #serverValue > 0 then
                dataJsonStr = dataJsonStr .. serverValue
            else
                break
            end
            i = i + 1
        end
    end
    if #dataJsonStr < 2 then
        return true
    end
    do
        local function ____catch(e)
            log.errorWithTraceBack("全局存档Json解析出错!")
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                "全局存档Json解析出错！"
            )
            print(("需要解析的Json字符串为[" .. dataJsonStr) .. "]")
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            if ____exports.default.encrypt then
                dataJsonStr = CodecUtil:saesDecode(dataJsonStr, gameName .. ____exports.default.salt)
            end
            data = JSON:parse(dataJsonStr)
            log.debug("全局存档数据为:" .. dataJsonStr)
            ____exports.default.data = data
            return true, true
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return true
end
GlobalArchiveUtil.encrypt = true
GlobalArchiveUtil.ArchiveKeyCountMax = 15
GlobalArchiveUtil.salt = "s_l_g_a_z_b_s_q_j"
GlobalArchiveUtil.baseArchiveKeyPrefix = "_SLGA_"
GlobalArchiveUtil.data = {}
GlobalArchiveUtil.isInit = false
____exports.default = GlobalArchiveUtil
return ____exports
