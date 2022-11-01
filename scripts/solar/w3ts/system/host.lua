local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 11,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 9,["23"] = 44,["24"] = 45,["25"] = 47,["26"] = 49,["28"] = 53,["29"] = 54,["30"] = 56,["31"] = 56,["32"] = 56,["33"] = 56,["34"] = 56,["37"] = 56,["38"] = 57,["39"] = 58,["40"] = 59,["41"] = 62,["42"] = 63,["43"] = 66,["44"] = 67,["46"] = 69,["47"] = 69,["49"] = 70,["50"] = 73,["51"] = 74,["53"] = 78,["56"] = 83,["57"] = 84,["58"] = 85,["62"] = 69,["65"] = 90,["66"] = 91,["67"] = 92,["68"] = 93,["70"] = 56,["71"] = 56,["72"] = 96,["73"] = 97,["74"] = 56,["76"] = 11,["77"] = 12,["78"] = 13,["79"] = 14,["80"] = 15,["81"] = 17,["82"] = 18,["83"] = 20,["84"] = 21,["85"] = 22,["86"] = 23,["87"] = 24,["90"] = 20,["91"] = 29,["92"] = 30,["93"] = 31,["95"] = 33,["97"] = 29,["98"] = 37,["99"] = 38,["100"] = 40,["102"] = 37,["103"] = 101,["104"] = 102,["105"] = 101,["106"] = 105,["107"] = 106});
local ____exports = {}
local findHost, lobbyTimes, checkTimer, hostCallbacks, localJoinTime, localStartTime, host, isChecking, bj_MAX_PLAYERS
local ____player = require("solar.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____timer = require("solar.w3ts.handles.timer")
local Timer = ____timer.Timer
local ____hooks = require("solar.w3ts.system.hooks")
local addScriptHook = ____hooks.addScriptHook
local W3TS_HOOK = ____hooks.W3TS_HOOK
local ____base64 = require("solar.w3ts.system.base64")
local base64Decode = ____base64.base64Decode
local base64Encode = ____base64.base64Encode
local ____binaryreader = require("solar.w3ts.system.binaryreader")
local BinaryReader = ____binaryreader.BinaryReader
local ____binarywriter = require("solar.w3ts.system.binarywriter")
local BinaryWriter = ____binarywriter.BinaryWriter
local ____sync = require("solar.w3ts.system.sync")
local SyncRequest = ____sync.SyncRequest
function findHost()
    isChecking = true
    if localStartTime == 0 then
        localStartTime = os.clock()
    end
    local writer = __TS__New(BinaryWriter)
    writer:writeFloat(localStartTime - localJoinTime)
    local ____self_0 = __TS__New(
        SyncRequest,
        MapPlayer:fromLocal(),
        base64Encode(tostring(writer))
    )
    ____self_0["then"](
        ____self_0,
        function(res, req)
            local data = base64Decode(res.data)
            local reader = __TS__New(BinaryReader, data)
            local syncedTime = reader:readFloat()
            local from = MapPlayer:fromEvent()
            lobbyTimes[from.id + 1] = syncedTime
            local hostTime = 0
            local hostId = 0
            do
                local i = 0
                while i < bj_MAX_PLAYERS do
                    do
                        local p = MapPlayer:fromIndex(i)
                        if p.slotState ~= PLAYER_SLOT_STATE_PLAYING or p.controller ~= MAP_CONTROL_USER then
                            goto __continue14
                        end
                        if not lobbyTimes[p.id + 1] then
                            return
                        end
                        if lobbyTimes[p.id + 1] > hostTime then
                            hostTime = lobbyTimes[p.id + 1]
                            hostId = p.id
                        end
                    end
                    ::__continue14::
                    i = i + 1
                end
            end
            host = MapPlayer:fromIndex(hostId)
            checkTimer:destroy()
            for ____, cb in ipairs(hostCallbacks) do
                cb()
            end
        end
    ):catch(function(res)
        print("findHost Error: " .. tostring(res.status))
        isChecking = false
    end)
end
lobbyTimes = {}
checkTimer = __TS__New(Timer)
hostCallbacks = {}
localJoinTime = 0
localStartTime = 0
isChecking = false
bj_MAX_PLAYERS = 12
function ____exports.getHost()
    if host then
        return host
    elseif not isChecking then
        checkTimer:start(0, false, findHost)
    end
    return
end
function ____exports.onHostDetect(callback)
    if host then
        callback()
    else
        hostCallbacks[#hostCallbacks + 1] = callback
    end
end
local function onConfig()
    if localJoinTime == 0 then
        localJoinTime = os.clock()
    end
end
local function onMain()
    checkTimer:start(0, false, findHost)
end
addScriptHook(W3TS_HOOK.MAIN_AFTER, onMain)
addScriptHook(W3TS_HOOK.CONFIG_BEFORE, onConfig)
return ____exports
