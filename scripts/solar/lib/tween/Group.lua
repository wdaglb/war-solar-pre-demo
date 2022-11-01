local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 10,["12"] = 10,["13"] = 10,["15"] = 11,["16"] = 15,["17"] = 10,["18"] = 19,["19"] = 20,["20"] = 20,["21"] = 20,["22"] = 21,["23"] = 20,["24"] = 20,["25"] = 19,["26"] = 25,["27"] = 26,["28"] = 25,["29"] = 29,["30"] = 30,["31"] = 31,["32"] = 29,["33"] = 34,["34"] = 35,["35"] = 35,["36"] = 35,["37"] = 35,["38"] = 36,["39"] = 36,["40"] = 36,["41"] = 36,["42"] = 34,["43"] = 39,["44"] = 39,["45"] = 39,["47"] = 39,["48"] = 39,["50"] = 40,["51"] = 42,["52"] = 43,["54"] = 51,["55"] = 52,["57"] = 54,["58"] = 54,["59"] = 55,["60"] = 56,["61"] = 58,["62"] = 59,["64"] = 54,["67"] = 63,["69"] = 66,["70"] = 39,["71"] = 10});
local ____exports = {}
local ____Now = require("solar.lib.tween.Now")
local now = ____Now.default
____exports.default = __TS__Class()
local Group = ____exports.default
Group.name = "Group"
function Group.prototype.____constructor(self)
    self._tweens = {}
    self._tweensAddedDuringUpdate = {}
end
function Group.prototype.getAll(self)
    return __TS__ArrayMap(
        __TS__ObjectKeys(self._tweens),
        function(____, tweenId)
            return self._tweens[tweenId]
        end
    )
end
function Group.prototype.removeAll(self)
    self._tweens = {}
end
function Group.prototype.add(self, tween)
    self._tweens[tween:getId()] = tween
    self._tweensAddedDuringUpdate[tween:getId()] = tween
end
function Group.prototype.remove(self, tween)
    __TS__Delete(
        self._tweens,
        tween:getId()
    )
    __TS__Delete(
        self._tweensAddedDuringUpdate,
        tween:getId()
    )
end
function Group.prototype.update(self, time, preserve)
    if time == nil then
        time = now(nil)
    end
    if preserve == nil then
        preserve = false
    end
    local tweenIds = __TS__ObjectKeys(self._tweens)
    if #tweenIds == 0 then
        return false
    end
    while #tweenIds > 0 do
        self._tweensAddedDuringUpdate = {}
        do
            local i = 0
            while i < #tweenIds do
                local tween = self._tweens[tweenIds[i + 1]]
                local autoStart = not preserve
                if tween and tween:update(time, autoStart) == false and not preserve then
                    __TS__Delete(self._tweens, tweenIds[i + 1])
                end
                i = i + 1
            end
        end
        tweenIds = __TS__ObjectKeys(self._tweensAddedDuringUpdate)
    end
    return true
end
____exports.default = Group
return ____exports
