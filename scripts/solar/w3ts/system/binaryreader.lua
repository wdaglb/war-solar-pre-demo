local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 6,["10"] = 4,["11"] = 7,["12"] = 6,["13"] = 10,["14"] = 12,["15"] = 13,["16"] = 14,["17"] = 15,["19"] = 17,["20"] = 10,["21"] = 20,["22"] = 21,["23"] = 20,["24"] = 24,["25"] = 25,["26"] = 24,["27"] = 28,["28"] = 29,["29"] = 28,["30"] = 32,["31"] = 33,["32"] = 32,["33"] = 36,["34"] = 37,["35"] = 36,["36"] = 40,["37"] = 41,["38"] = 42,["39"] = 43,["40"] = 40,["41"] = 46,["42"] = 47,["43"] = 46,["44"] = 50,["45"] = 51,["46"] = 50,["47"] = 54,["48"] = 55,["49"] = 54});
local ____exports = {}
____exports.BinaryReader = __TS__Class()
local BinaryReader = ____exports.BinaryReader
BinaryReader.name = "BinaryReader"
function BinaryReader.prototype.____constructor(self, binaryString)
    self.pos = 1
    self.data = binaryString
end
function BinaryReader.prototype.read(self, fmt, size)
    local unpacked = {string.unpack(fmt, self.data, self.pos)}
    self.pos = self.pos + size
    if #unpacked <= 0 then
        return 0
    end
    return unpacked[1]
end
function BinaryReader.prototype.readDouble(self)
    return self:read(">d", 4)
end
function BinaryReader.prototype.readFloat(self)
    return self:read(">f", 4)
end
function BinaryReader.prototype.readInt16(self)
    return self:read(">h", 2)
end
function BinaryReader.prototype.readInt32(self)
    return self:read(">i4", 4)
end
function BinaryReader.prototype.readInt8(self)
    return self:read(">b", 1)
end
function BinaryReader.prototype.readString(self)
    local value = self:read(">z", 0)
    self.pos = self.pos + (#value + 1)
    return value
end
function BinaryReader.prototype.readUInt16(self)
    return self:read(">H", 2)
end
function BinaryReader.prototype.readUInt32(self)
    return self:read(">I4", 4)
end
function BinaryReader.prototype.readUInt8(self)
    return self:read(">B", 1)
end
return ____exports
