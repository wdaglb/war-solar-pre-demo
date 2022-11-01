local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstr = ____lualib.__TS__StringSubstr
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 1,["11"] = 9,["12"] = 23,["13"] = 25,["14"] = 27,["15"] = 28,["16"] = 23,["17"] = 34,["18"] = 36,["19"] = 38,["20"] = 39,["21"] = 34,["22"] = 58,["23"] = 58,["24"] = 58,["26"] = 59,["27"] = 60,["28"] = 62,["29"] = 63,["30"] = 64,["33"] = 67,["34"] = 67,["35"] = 68,["36"] = 67,["39"] = 71,["40"] = 72,["42"] = 75,["43"] = 77,["44"] = 58,["45"] = 83,["46"] = 84,["47"] = 83,["48"] = 4,["49"] = 7,["50"] = 15,["51"] = 16,["52"] = 17});
local ____exports = {}
____exports.File = __TS__Class()
local File = ____exports.File
File.name = "File"
function File.prototype.____constructor(self)
end
function File.escape(self, contents)
    contents = string.gsub(contents, ____exports.File.escapeCharacter, ____exports.File.escapedSelf)
    contents = string.gsub(contents, "\"", ____exports.File.escapedQuote)
    return contents
end
function File.unescape(self, contents)
    contents = string.gsub(contents, ____exports.File.escapedQuote, "\"")
    contents = string.gsub(contents, ____exports.File.escapedSelf, ____exports.File.escapeCharacter)
    return contents
end
function File.writeRaw(self, filename, contents, allowReading)
    if allowReading == nil then
        allowReading = false
    end
    PreloadGenClear()
    PreloadGenStart()
    if allowReading then
        Preload("\")\n//! beginusercode\nlocal o=''\nPreload=function(s)o=o..s end\nPreloadEnd=function()end\n//!endusercode\n//")
        contents = ____exports.File:escape(contents)
    end
    do
        local i = 0
        while i < #contents / ____exports.File.preloadLimit do
            Preload(__TS__StringSubstr(contents, i * ____exports.File.preloadLimit, ____exports.File.preloadLimit))
            i = i + 1
        end
    end
    if allowReading then
        Preload(("\")\n//! beginusercode\nBlzSetAbilityIcon(" .. tostring(self.dummyAbility)) .. ",o)\n//!endusercode\n//")
    end
    PreloadGenEnd(filename)
    return self
end
function File.write(self, filename, contents)
    return self:writeRaw(filename, contents, true)
end
File.dummyAbility = FourCC("Amls")
File.preloadLimit = 259
File.escapeCharacter = string.char(27)
File.escapedSelf = ____exports.File.escapeCharacter .. ____exports.File.escapeCharacter
File.escapedQuote = ____exports.File.escapeCharacter .. "q"
return ____exports
