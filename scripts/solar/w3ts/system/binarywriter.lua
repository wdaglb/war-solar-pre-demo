local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 3,["11"] = 4,["12"] = 1,["13"] = 6,["14"] = 8,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 6,["19"] = 11,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 11,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 18,["28"] = 16,["29"] = 21,["30"] = 22,["31"] = 23,["32"] = 23,["33"] = 21,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 28,["38"] = 26,["39"] = 31,["40"] = 32,["41"] = 33,["42"] = 33,["43"] = 31,["44"] = 36,["45"] = 37,["46"] = 38,["47"] = 38,["48"] = 36,["49"] = 41,["50"] = 42,["51"] = 43,["52"] = 43,["53"] = 41,["54"] = 46,["55"] = 47,["56"] = 48,["57"] = 48,["58"] = 46,["59"] = 51,["60"] = 52,["61"] = 53,["62"] = 53,["63"] = 51});
local ____exports = {}
____exports.BinaryWriter = __TS__Class()
local BinaryWriter = ____exports.BinaryWriter
BinaryWriter.name = "BinaryWriter"
function BinaryWriter.prototype.____constructor(self)
    self.values = {}
    self.fmj = ">"
end
function BinaryWriter.prototype.__tostring(self)
    return string.pack(
        self.fmj,
        table.unpack(self.values)
    )
end
function BinaryWriter.prototype.writeDouble(self, value)
    self.fmj = self.fmj .. "d"
    local ____self_values_0 = self.values
    ____self_values_0[#____self_values_0 + 1] = value
end
function BinaryWriter.prototype.writeFloat(self, value)
    self.fmj = self.fmj .. "f"
    local ____self_values_1 = self.values
    ____self_values_1[#____self_values_1 + 1] = value
end
function BinaryWriter.prototype.writeInt16(self, value)
    self.fmj = self.fmj .. "h"
    local ____self_values_2 = self.values
    ____self_values_2[#____self_values_2 + 1] = value
end
function BinaryWriter.prototype.writeInt32(self, value)
    self.fmj = self.fmj .. "i4"
    local ____self_values_3 = self.values
    ____self_values_3[#____self_values_3 + 1] = value
end
function BinaryWriter.prototype.writeInt8(self, value)
    self.fmj = self.fmj .. "b"
    local ____self_values_4 = self.values
    ____self_values_4[#____self_values_4 + 1] = value
end
function BinaryWriter.prototype.writeString(self, value)
    self.fmj = self.fmj .. "z"
    local ____self_values_5 = self.values
    ____self_values_5[#____self_values_5 + 1] = value
end
function BinaryWriter.prototype.writeUInt16(self, value)
    self.fmj = self.fmj .. "H"
    local ____self_values_6 = self.values
    ____self_values_6[#____self_values_6 + 1] = value
end
function BinaryWriter.prototype.writeUInt32(self, value)
    self.fmj = self.fmj .. "I4"
    local ____self_values_7 = self.values
    ____self_values_7[#____self_values_7 + 1] = value
end
function BinaryWriter.prototype.writeUInt8(self, value)
    self.fmj = self.fmj .. "B"
    local ____self_values_8 = self.values
    ____self_values_8[#____self_values_8 + 1] = value
end
return ____exports
