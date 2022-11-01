local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 22,["10"] = 22,["11"] = 22,["13"] = 6,["14"] = 8,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 23,["22"] = 24,["23"] = 22,["24"] = 30,["25"] = 30,["26"] = 30,["28"] = 31,["30"] = 32,["31"] = 32,["32"] = 33,["35"] = 36,["36"] = 37,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 41,["42"] = 32,["45"] = 30,["46"] = 51,["48"] = 52,["49"] = 52,["50"] = 53,["51"] = 54,["52"] = 55,["53"] = 56,["54"] = 57,["55"] = 58,["56"] = 59,["57"] = 60,["58"] = 61,["60"] = 52,["63"] = 66,["64"] = 51,["65"] = 74,["66"] = 75,["67"] = 76,["68"] = 77,["69"] = 78,["70"] = 79,["74"] = 82,["75"] = 82,["76"] = 83,["77"] = 84,["78"] = 85,["80"] = 82,["83"] = 88,["84"] = 74,["85"] = 94,["86"] = 94,["87"] = 94,["89"] = 95,["90"] = 96,["91"] = 97,["93"] = 99,["96"] = 101,["97"] = 101,["98"] = 102,["99"] = 101,["102"] = 94,["103"] = 110,["105"] = 111,["106"] = 111,["107"] = 112,["108"] = 113,["109"] = 114,["111"] = 111,["114"] = 110,["115"] = 123,["117"] = 124,["118"] = 124,["119"] = 125,["120"] = 126,["121"] = 127,["122"] = 128,["125"] = 124,["128"] = 123,["129"] = 138,["131"] = 139,["132"] = 139,["133"] = 140,["134"] = 141,["135"] = 142,["136"] = 143,["139"] = 139,["142"] = 138,["143"] = 153,["144"] = 154,["145"] = 156,["146"] = 157,["149"] = 164,["150"] = 164,["151"] = 165,["152"] = 166,["153"] = 164,["156"] = 168,["157"] = 153,["158"] = 174,["159"] = 175,["161"] = 176,["162"] = 176,["163"] = 177,["164"] = 178,["166"] = 176,["169"] = 181,["170"] = 174,["171"] = 187,["172"] = 188,["174"] = 189,["175"] = 189,["176"] = 190,["177"] = 191,["179"] = 189,["182"] = 194,["183"] = 187,["184"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local ObjectPool = ____exports.default
ObjectPool.name = "ObjectPool"
function ObjectPool.prototype.____constructor(self, create, returnCallBack)
    if returnCallBack == nil then
        returnCallBack = nil
    end
    self.objects = {}
    self.objectIdleStatus = {}
    self._before_lastBorrowObjectIndex = -1
    self.lastBorrowObjectIndex = -1
    self.create = nil
    self.returnCallBack = nil
    self.maxTotal = 1000000
    self.minIdle = 1
    self.create = create
    self.returnCallBack = returnCallBack
end
function ObjectPool.prototype.preparePool(self, idleCount)
    if idleCount == nil then
        idleCount = self.minIdle
    end
    local tempIdleCount = 0
    do
        local i = 0
        while i < self.maxTotal do
            if tempIdleCount >= idleCount then
                return
            end
            if self.objectIdleStatus[i + 1] == true then
                tempIdleCount = tempIdleCount + 1
            elseif self.objects[i + 1] == nil then
                self.objects[i + 1] = self:create()
                self.objectIdleStatus[i + 1] = true
                tempIdleCount = tempIdleCount + 1
            end
            i = i + 1
        end
    end
end
function ObjectPool.prototype.borrowObject(self)
    do
        local i = 0
        while i < self.maxTotal do
            if self.objectIdleStatus[i + 1] == true then
                self.lastBorrowObjectIndex = i
                self.objectIdleStatus[i + 1] = false
                return self.objects[i + 1]
            elseif self.objects[i + 1] == nil then
                self.objects[i + 1] = self:create()
                self.lastBorrowObjectIndex = i
                self.objectIdleStatus[i + 1] = false
                return self.objects[i + 1]
            end
            i = i + 1
        end
    end
    return nil
end
function ObjectPool.prototype.returnObject(self, obj)
    local isIdle = true
    if self.returnCallBack then
        local flag = self:returnCallBack(obj)
        if flag ~= nil then
            isIdle = flag
        end
    end
    do
        local i = 0
        while i < self.maxTotal do
            if obj == self.objects[i + 1] then
                self.objectIdleStatus[i + 1] = isIdle
                return true
            end
            i = i + 1
        end
    end
    return false
end
function ObjectPool.prototype.setAllIdleStatus(self, isIdle)
    if isIdle == nil then
        isIdle = true
    end
    self._before_lastBorrowObjectIndex = self.lastBorrowObjectIndex
    if isIdle then
        self.lastBorrowObjectIndex = -1
    else
        self.lastBorrowObjectIndex = #self.objects - 1
    end
    do
        local i = 0
        while i < #self.objects do
            self.objectIdleStatus[i + 1] = isIdle
            i = i + 1
        end
    end
end
function ObjectPool.prototype.forObjects(self, callBack)
    do
        local i = 0
        while i < #self.objects do
            local isIdle = callBack(nil, self.objects[i + 1])
            if isIdle ~= nil then
                self.objectIdleStatus[i + 1] = isIdle
            end
            i = i + 1
        end
    end
end
function ObjectPool.prototype.forIdleObjects(self, callBack)
    do
        local i = 0
        while i < #self.objectIdleStatus do
            if self.objectIdleStatus[i + 1] == true then
                local isIdle = callBack(nil, self.objects[i + 1])
                if isIdle ~= nil then
                    self.objectIdleStatus[i + 1] = isIdle
                end
            end
            i = i + 1
        end
    end
end
function ObjectPool.prototype.forActiveObjects(self, callBack)
    do
        local i = 0
        while i < #self.objects do
            if self.objectIdleStatus[i + 1] == false then
                local isIdle = callBack(nil, self.objects[i + 1])
                if isIdle ~= nil then
                    self.objectIdleStatus[i + 1] = isIdle
                end
            end
            i = i + 1
        end
    end
end
function ObjectPool.prototype.forDirtyObjects(self, callBack)
    local clearNum = 0
    if self.lastBorrowObjectIndex >= self._before_lastBorrowObjectIndex then
        return clearNum
    end
    do
        local i = self.lastBorrowObjectIndex + 1
        while i <= self._before_lastBorrowObjectIndex do
            callBack(nil, self.objects[i + 1])
            clearNum = clearNum + 1
            i = i + 1
        end
    end
    return clearNum
end
function ObjectPool.prototype.getNumActive(self)
    local num = 0
    do
        local i = 0
        while i < #self.objectIdleStatus do
            if self.objectIdleStatus[i + 1] == false then
                num = num + 1
            end
            i = i + 1
        end
    end
    return num
end
function ObjectPool.prototype.getNumIdle(self)
    local num = 0
    do
        local i = 0
        while i < #self.objectIdleStatus do
            if self.objectIdleStatus[i + 1] == true then
                num = num + 1
            end
            i = i + 1
        end
    end
    return num
end
____exports.default = ObjectPool
return ____exports
