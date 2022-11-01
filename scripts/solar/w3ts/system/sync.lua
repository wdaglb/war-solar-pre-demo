local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstr = ____lualib.__TS__StringSubstr
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 7,["15"] = 7,["16"] = 8,["17"] = 8,["18"] = 11,["19"] = 12,["20"] = 13,["21"] = 14,["22"] = 35,["23"] = 35,["24"] = 41,["25"] = 42,["26"] = 43,["27"] = 44,["28"] = 45,["29"] = 46,["30"] = 47,["31"] = 48,["32"] = 49,["33"] = 41,["34"] = 53,["35"] = 53,["36"] = 59,["37"] = 59,["38"] = 59,["40"] = 59,["41"] = 59,["43"] = 60,["44"] = 61,["45"] = 62,["46"] = 63,["47"] = 59,["48"] = 66,["49"] = 67,["50"] = 68,["51"] = 69,["52"] = 70,["53"] = 71,["55"] = 73,["56"] = 66,["57"] = 76,["58"] = 77,["59"] = 78,["60"] = 79,["61"] = 80,["62"] = 76,["63"] = 84,["64"] = 84,["65"] = 84,["66"] = 112,["67"] = 89,["68"] = 90,["69"] = 91,["70"] = 92,["71"] = 95,["72"] = 114,["73"] = 115,["74"] = 116,["75"] = 118,["76"] = 119,["77"] = 112,["82"] = 128,["86"] = 135,["87"] = 136,["88"] = 137,["89"] = 135,["90"] = 143,["91"] = 144,["92"] = 145,["93"] = 146,["94"] = 143,["95"] = 187,["96"] = 188,["97"] = 189,["98"] = 187,["99"] = 195,["100"] = 196,["101"] = 197,["102"] = 198,["103"] = 199,["106"] = 201,["107"] = 202,["109"] = 195,["110"] = 221,["111"] = 222,["112"] = 221,["113"] = 96,["114"] = 97,["115"] = 98,["116"] = 99,["117"] = 100,["118"] = 101,["119"] = 102});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____base64 = require("solar.w3ts.system.base64")
local base64Decode = ____base64.base64Decode
local base64Encode = ____base64.base64Encode
local ____binaryreader = require("solar.w3ts.system.binaryreader")
local BinaryReader = ____binaryreader.BinaryReader
local ____binarywriter = require("solar.w3ts.system.binarywriter")
local BinaryWriter = ____binarywriter.BinaryWriter
local SYNC_PREFIX = "T"
local SYNC_PREFIX_CHUNK = "S"
local SYNC_MAX_CHUNK_SIZE = 244
local bj_MAX_PLAYER_SLOTS = 16
local SyncIncomingPacket = __TS__Class()
SyncIncomingPacket.name = "SyncIncomingPacket"
function SyncIncomingPacket.prototype.____constructor(self, prefix, data)
    local isChunk = prefix == SYNC_PREFIX_CHUNK
    local header = base64Decode(isChunk and __TS__StringSubstr(data, 0, 10) or __TS__StringSubstr(data, 0, 5))
    local reader = __TS__New(BinaryReader, header)
    local id = reader:readUInt16()
    self.req = ____exports.SyncRequest:fromIndex(id)
    self.chunks = isChunk and reader:readUInt16() or 0
    self.chunk = isChunk and reader:readUInt16() or 0
    self.data = isChunk and __TS__StringSubstr(data, 10) or __TS__StringSubstr(data, 5)
end
local SyncOutgoingPacket = __TS__Class()
SyncOutgoingPacket.name = "SyncOutgoingPacket"
function SyncOutgoingPacket.prototype.____constructor(self, req, data, chunk, totalChunks)
    if chunk == nil then
        chunk = -1
    end
    if totalChunks == nil then
        totalChunks = 0
    end
    self.req = req
    self.data = data
    self.chunk = chunk
    self.chunks = totalChunks
end
function SyncOutgoingPacket.prototype.getHeader(self)
    local writer = __TS__New(BinaryWriter)
    writer:writeUInt16(self.req.id)
    if self.chunk ~= -1 then
        writer:writeUInt16(self.chunks)
        writer:writeUInt16(self.chunk)
    end
    return base64Encode(tostring(writer))
end
function SyncOutgoingPacket.prototype.__tostring(self)
    local header = self:getHeader()
    local writer = __TS__New(BinaryWriter)
    writer:writeString(self.data)
    return header .. tostring(writer)
end
____exports.SyncRequest = __TS__Class()
local SyncRequest = ____exports.SyncRequest
SyncRequest.name = "SyncRequest"
function SyncRequest.prototype.____constructor(self, from, data, options)
    self._startTime = 0
    self.chunks = {}
    self.currentChunk = 0
    self.destroyed = false
    self.status = 0
    self.options = not options and ____exports.SyncRequest.defaultOptions or options
    self.from = from
    self.id = self:allocate()
    ____exports.SyncRequest.indicies[self.id + 1] = -1
    ____exports.SyncRequest.cache[self.id + 1] = self
end
__TS__SetDescriptor(
    SyncRequest.prototype,
    "startTime",
    {get = function(self)
        return self._startTime
    end},
    true
)
function SyncRequest.prototype.catch(self, callback)
    self.onError = callback
    return self
end
function SyncRequest.prototype.destroy(self)
    ____exports.SyncRequest.indicies[self.id + 1] = ____exports.SyncRequest.index
    ____exports.SyncRequest.index = self.id
    self.destroyed = true
end
SyncRequest.prototype["then"] = function(self, callback)
    self.onResponse = callback
    return self
end
function SyncRequest.prototype.allocate(self)
    if ____exports.SyncRequest.index ~= 0 then
        local id = ____exports.SyncRequest.index
        ____exports.SyncRequest.index = ____exports.SyncRequest.indicies[id + 1]
        return id
    else
        local ____exports_SyncRequest_0, ____counter_1 = ____exports.SyncRequest, "counter"
        ____exports_SyncRequest_0[____counter_1] = ____exports_SyncRequest_0[____counter_1] + 1
        return ____exports.SyncRequest.counter
    end
end
function SyncRequest.fromIndex(self, index)
    return self.cache[index + 1]
end
SyncRequest.cache = {}
SyncRequest.counter = 0
SyncRequest.defaultOptions = {timeout = 0}
SyncRequest.eventTrigger = __TS__New(Trigger)
SyncRequest.index = 0
SyncRequest.indicies = {}
SyncRequest.initialized = false
return ____exports
