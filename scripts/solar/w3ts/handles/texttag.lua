local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 6,["10"] = 6,["11"] = 6,["12"] = 6,["14"] = 9,["15"] = 6,["18"] = 13,["19"] = 14,["20"] = 6,["22"] = 8,["23"] = 20,["24"] = 21,["25"] = 20,["26"] = 24,["27"] = 25,["28"] = 24,["29"] = 28,["30"] = 29,["31"] = 29,["32"] = 29,["33"] = 29,["34"] = 29,["35"] = 29,["36"] = 29,["37"] = 28,["38"] = 32,["39"] = 33,["40"] = 32,["41"] = 36,["42"] = 37,["43"] = 36,["44"] = 40,["45"] = 41,["46"] = 40,["47"] = 44,["48"] = 45,["49"] = 44,["50"] = 48,["51"] = 49,["52"] = 48,["53"] = 52,["54"] = 53,["55"] = 52,["56"] = 56,["57"] = 56,["58"] = 56,["60"] = 57,["61"] = 58,["63"] = 60,["64"] = 56,["65"] = 63,["66"] = 64,["67"] = 63,["68"] = 67,["69"] = 68,["70"] = 69,["71"] = 69,["72"] = 69,["73"] = 69,["74"] = 67,["75"] = 72,["76"] = 73,["77"] = 72,["78"] = 76,["79"] = 77,["80"] = 76});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.TextTag = __TS__Class()
local TextTag = ____exports.TextTag
TextTag.name = "TextTag"
__TS__ClassExtends(TextTag, Handle)
function TextTag.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
        return
    end
    local textTagHandle = CreateTextTag()
    if textTagHandle then
        Handle.prototype.____constructor(self, textTagHandle)
    end
end
function TextTag.prototype.destroy(self)
    DestroyTextTag(self.handle)
end
function TextTag.prototype.setAge(self, age)
    SetTextTagAge(self.handle, age)
end
function TextTag.prototype.setColor(self, red, green, blue, alpha)
    SetTextTagColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function TextTag.prototype.setFadepoint(self, fadepoint)
    SetTextTagFadepoint(self.handle, fadepoint)
end
function TextTag.prototype.setLifespan(self, lifespan)
    SetTextTagLifespan(self.handle, lifespan)
end
function TextTag.prototype.setPermanent(self, flag)
    SetTextTagPermanent(self.handle, flag)
end
function TextTag.prototype.setPos(self, x, y, heightOffset)
    SetTextTagPos(self.handle, x, y, heightOffset)
end
function TextTag.prototype.setPosUnit(self, u, heightOffset)
    SetTextTagPosUnit(self.handle, u.handle, heightOffset)
end
function TextTag.prototype.setSuspended(self, flag)
    SetTextTagSuspended(self.handle, flag)
end
function TextTag.prototype.setText(self, s, height, adjustHeight)
    if adjustHeight == nil then
        adjustHeight = false
    end
    if adjustHeight then
        height = height * 0.0023
    end
    SetTextTagText(self.handle, s, height)
end
function TextTag.prototype.setVelocity(self, xvel, yvel)
    SetTextTagVelocity(self.handle, xvel, yvel)
end
function TextTag.prototype.setVelocityAngle(self, speed, angle)
    local vel = speed * 0.071 / 128
    self:setVelocity(
        vel * Cos(angle * 0.017),
        vel * Sin(angle * 0.017)
    )
end
function TextTag.prototype.setVisible(self, flag)
    SetTextTagVisibility(self.handle, flag)
end
function TextTag.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
