local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 6,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 11,["15"] = 11,["16"] = 11,["17"] = 12,["18"] = 13,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 18,["24"] = 19,["25"] = 20,["26"] = 21,["27"] = 23,["32"] = 31,["40"] = 38,["48"] = 76,["52"] = 41,["53"] = 42,["54"] = 41,["55"] = 46,["56"] = 47,["59"] = 50,["62"] = 53,["63"] = 55,["64"] = 56,["65"] = 58,["66"] = 59,["67"] = 60,["68"] = 61,["69"] = 62,["71"] = 65,["73"] = 67,["75"] = 69,["76"] = 46,["77"] = 79,["78"] = 80,["79"] = 81,["80"] = 79,["81"] = 87,["82"] = 88,["83"] = 89,["84"] = 87,["85"] = 95,["86"] = 96,["87"] = 97,["88"] = 95,["89"] = 106,["90"] = 107,["91"] = 108,["92"] = 109,["94"] = 111,["95"] = 112,["96"] = 113,["98"] = 116,["99"] = 118,["100"] = 120,["101"] = 106,["102"] = 130,["103"] = 131,["104"] = 132,["105"] = 133,["106"] = 134,["107"] = 135,["110"] = 138,["111"] = 130,["112"] = 141,["113"] = 142,["114"] = 143,["115"] = 144,["116"] = 145,["117"] = 146,["119"] = 148,["120"] = 141,["121"] = 151,["122"] = 152,["123"] = 153,["124"] = 154,["125"] = 155,["127"] = 158,["129"] = 151,["130"] = 128});
local ____exports = {}
---
-- @noSelf *
local index = 0
____exports.STimer = __TS__Class()
local STimer = ____exports.STimer
STimer.name = "STimer"
function STimer.prototype.____constructor(self)
    local ____index_0 = index
    index = ____index_0 + 1
    self.uuid = ____index_0
    self._elapsed = 0
    self.interval = 0
    self._callCount = 0
    self.loopCount = 1
    self.isPause = false
    self._timeout = 0
    self._isDestroy = false
    self.periodic = false
    self.lastUpdateTime = 0
    self.handlerFunc = nil
end
__TS__SetDescriptor(
    STimer.prototype,
    "elapsed",
    {get = function(self)
        return self._elapsed
    end},
    true
)
__TS__SetDescriptor(
    STimer.prototype,
    "remaining",
    {get = function(self)
        return self._timeout - self._elapsed
    end},
    true
)
__TS__SetDescriptor(
    STimer.prototype,
    "timeout",
    {get = function(self)
        return self._timeout
    end},
    true
)
function STimer.prototype.setLoopCount(self, loopCount)
    self.loopCount = loopCount
end
function STimer.prototype.update(self)
    if self._isDestroy then
        return
    end
    if self.isPause then
        return
    end
    local tpf = time - self.lastUpdateTime
    self._elapsed = self._elapsed + tpf
    self.interval = self.interval + tpf
    if self.interval >= self._timeout then
        self._callCount = self._callCount + 1
        self.interval = 0
        if not self.periodic and self._callCount >= self.loopCount then
            self:destroy()
        else
            ____exports.STimer:_sl_addSTimer2TimeCallBack(self._timeout, self)
        end
        self.handlerFunc(self)
    end
    self.lastUpdateTime = time
end
function STimer.prototype.destroy(self)
    self._isDestroy = true
    return self
end
function STimer.prototype.pause(self)
    self.isPause = true
    return self
end
function STimer.prototype.resume(self)
    self.isPause = false
    return self
end
function STimer.prototype.start(self, timeoutS, handlerFunc, periodic)
    self.handlerFunc = handlerFunc
    if periodic ~= nil then
        self.periodic = periodic
    end
    if timeoutS == 0 then
        handlerFunc(self)
        return self
    end
    self._timeout = math.floor(timeoutS * 100 + 0.5) * 10
    ____exports.STimer:_sl_addSTimer2TimeCallBack(self._timeout, self)
    return self
end
function STimer._sl_getSTimerCount(self)
    local count = 0
    for timeCallBackKey in pairs(____exports.STimer.timeCallBack) do
        local callBackArray = ____exports.STimer.timeCallBack[timeCallBackKey]
        if callBackArray then
            count = count + #callBackArray
        end
    end
    return count
end
function STimer._sl_addSTimer2TimeCallBack(self, timeout, sTimer)
    local callBackTime = time + timeout
    local callBackArray = ____exports.STimer.timeCallBack[callBackTime]
    if callBackArray == nil then
        callBackArray = {}
        ____exports.STimer.timeCallBack[callBackTime] = callBackArray
    end
    callBackArray[#callBackArray + 1] = sTimer
end
function STimer._sl_OnTime()
    local callBackArray = ____exports.STimer.timeCallBack[time]
    if callBackArray then
        for ____, callBackArrayElement in ipairs(callBackArray) do
            callBackArrayElement:update()
        end
        ____exports.STimer.timeCallBack[time] = nil
    end
end
STimer.timeCallBack = {}
return ____exports
