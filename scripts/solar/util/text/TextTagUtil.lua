local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 4,["10"] = 4,["11"] = 4,["13"] = 4,["14"] = 10,["15"] = 10,["16"] = 10,["18"] = 10,["19"] = 10,["21"] = 10,["22"] = 10,["24"] = 11,["25"] = 12,["26"] = 13,["27"] = 14,["28"] = 15,["29"] = 16,["30"] = 17,["31"] = 18,["32"] = 10,["33"] = 31,["34"] = 31,["35"] = 31,["37"] = 31,["38"] = 31,["40"] = 31,["41"] = 31,["43"] = 31,["44"] = 31,["46"] = 31,["47"] = 31,["49"] = 32,["50"] = 33,["51"] = 33,["52"] = 33,["53"] = 33,["54"] = 33,["55"] = 33,["56"] = 33,["57"] = 34,["58"] = 35,["59"] = 36,["60"] = 37,["61"] = 38,["62"] = 39,["63"] = 40,["64"] = 41,["65"] = 42,["67"] = 44,["68"] = 31,["69"] = 51,["70"] = 52,["71"] = 52,["72"] = 52,["73"] = 52,["74"] = 52,["75"] = 51,["76"] = 4});
local ____exports = {}
local ____texttag = require("solar.w3ts.handles.texttag")
local TextTag = ____texttag.TextTag
____exports.default = __TS__Class()
local TextTagUtil = ____exports.default
TextTagUtil.name = "TextTagUtil"
function TextTagUtil.prototype.____constructor(self)
end
function TextTagUtil.textOnUnit(unit, text, red, green, blue)
    if red == nil then
        red = 255
    end
    if green == nil then
        green = 255
    end
    if blue == nil then
        blue = 255
    end
    local textTag = __TS__New(TextTag)
    textTag:setColor(red, green, blue, 255)
    textTag:setText(text, 15, true)
    SetTextTagPosUnit(textTag.handle, unit, 100)
    textTag:setVelocity(0, 0.04)
    textTag:setPermanent(false)
    textTag:setLifespan(#text)
    return textTag
end
function TextTagUtil.text(text, unit, fontSize, lifespan, red, green, blue)
    if fontSize == nil then
        fontSize = 15
    end
    if lifespan == nil then
        lifespan = 0
    end
    if red == nil then
        red = 255
    end
    if green == nil then
        green = 255
    end
    if blue == nil then
        blue = 255
    end
    local textTagHandle = CreateTextTag()
    SetTextTagColor(
        textTagHandle,
        red,
        green,
        blue,
        255
    )
    fontSize = fontSize * 0.0023
    SetTextTagText(textTagHandle, text, fontSize)
    SetTextTagPosUnit(textTagHandle, unit, 100)
    SetTextTagVelocity(textTagHandle, 0, 0.04)
    SetTextTagPermanent(textTagHandle, false)
    if lifespan == 0 then
        SetTextTagLifespan(textTagHandle, #text)
    elseif lifespan > 0 then
        SetTextTagLifespan(textTagHandle, lifespan)
    end
    return textTagHandle
end
function TextTagUtil.setRandomVelocity(texttag)
    SetTextTagVelocity(
        texttag,
        GetRandomReal(-0.1, 0.1),
        GetRandomReal(0.01, 0.1)
    )
end
____exports.default = TextTagUtil
return ____exports
