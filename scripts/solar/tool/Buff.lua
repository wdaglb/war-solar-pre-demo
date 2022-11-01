local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["28"] = 21,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 59,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 28,["37"] = 29,["38"] = 30,["39"] = 37,["40"] = 40,["41"] = 44,["42"] = 49,["43"] = 50,["44"] = 60,["45"] = 61,["46"] = 62,["47"] = 63,["48"] = 64,["50"] = 66,["51"] = 67,["52"] = 68,["53"] = 70,["54"] = 71,["55"] = 72,["56"] = 72,["57"] = 72,["58"] = 73,["59"] = 72,["60"] = 72,["61"] = 72,["62"] = 75,["63"] = 76,["64"] = 77,["65"] = 77,["66"] = 77,["67"] = 78,["68"] = 77,["69"] = 77,["70"] = 77,["72"] = 83,["73"] = 84,["74"] = 85,["76"] = 87,["77"] = 89,["78"] = 91,["79"] = 92,["82"] = 95,["83"] = 95,["84"] = 95,["85"] = 95,["87"] = 97,["88"] = 98,["90"] = 59,["96"] = 103,["98"] = 106,["99"] = 107,["109"] = 111,["111"] = 114,["112"] = 115,["114"] = 117,["115"] = 117,["116"] = 117,["117"] = 117,["119"] = 119,["120"] = 120,["126"] = 127,["127"] = 128,["128"] = 127,["129"] = 132,["130"] = 133,["131"] = 132,["132"] = 136,["133"] = 137,["134"] = 136,["135"] = 141,["136"] = 142,["137"] = 141,["138"] = 145,["139"] = 146,["140"] = 145,["141"] = 152,["142"] = 153,["143"] = 152,["144"] = 159,["145"] = 160,["146"] = 159,["147"] = 166,["148"] = 167,["149"] = 166,["150"] = 170,["151"] = 171,["152"] = 170,["153"] = 174,["154"] = 175,["155"] = 174,["156"] = 179,["157"] = 181,["159"] = 182,["160"] = 182,["161"] = 182,["162"] = 182,["164"] = 184,["165"] = 185,["166"] = 186,["167"] = 187,["168"] = 188,["171"] = 192,["172"] = 193,["174"] = 195,["175"] = 179,["176"] = 198,["177"] = 198,["178"] = 198,["180"] = 199,["181"] = 200,["183"] = 202,["184"] = 198,["185"] = 208,["186"] = 210,["187"] = 211,["188"] = 212,["192"] = 217,["193"] = 218,["195"] = 220,["196"] = 221,["198"] = 224,["199"] = 225,["200"] = 225,["201"] = 225,["203"] = 225,["204"] = 226,["206"] = 228,["207"] = 228,["208"] = 228,["210"] = 229,["211"] = 208,["212"] = 236,["213"] = 237,["214"] = 238,["215"] = 22});
local ____exports = {}
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____STimer = require("solar.tool.STimer")
local STimer = ____STimer.STimer
--- 一个buff 有buff的BuffType的类型
-- 
-- buff会经过4个生命周期
--    onCreated 创建buff
--    onUpdate buff更新时 默认为每0.1秒调此方法
--    onInterval 间隔到期
--    onDestroy  buff结束销毁时
-- 
--    比如 一个 给敌人施加一个每秒造成10点伤害 持续3秒的buff
--    即 parent = 受到伤害的单位
--    caster = 发出这个buff的来源单位
-- 
--    每1秒会回调 onInterval 方法
local index = 0
____exports.default = __TS__Class()
local Buff = ____exports.default
Buff.name = "Buff"
function Buff.prototype.____constructor(self, buffType, parent, caster)
    local ____index_2 = index
    index = ____index_2 + 1
    self.uuid = "sb" .. tostring(____index_2)
    self.intervalMS = 0
    self.durMS = 0
    self.ability = nil
    self._stackCount = 1
    self.caster = nil
    self._SL_interval = 0
    self.sTimer = nil
    self.lastUpdateTime = time
    self.buffType = buffType
    self.parent = parent
    self.caster = caster
    if buffType.atrribute then
        self.atrribute = __TS__ObjectAssign({}, buffType.atrribute)
    end
    self.intervalMS = math.floor((buffType.interval or 0) * 1000)
    self.durMS = math.floor((buffType.dur or 0) * 1000)
    self.ubertip = buffType.ubertip
    if buffType.interval and buffType.interval > 0 then
        self.sTimer = __TS__New(STimer)
        self.sTimer:start(
            buffType.interval,
            function()
                self:update()
            end,
            true
        )
    elseif buffType.dur and buffType.dur > 0 then
        self.sTimer = __TS__New(STimer)
        self.sTimer:start(
            1,
            function()
                self:update()
            end,
            true
        )
    end
    local solarData = DataBase:getUnitSolarData(parent)
    if not solarData._SL_solarBuffSet then
        solarData._SL_solarBuffSet = {}
    end
    solarData._SL_solarBuffSet[buffType.id] = self
    self:refresh()
    if buffType.targetArt ~= nil and #buffType.targetArt > 1 then
        self._SL_targetattachEffect = AddSpecialEffectTarget(buffType.targetArt, parent, buffType.targetAttach)
    end
    local ____this_1
    ____this_1 = buffType
    local ____buffType_onCreated_result_0 = ____this_1.onCreated
    if ____buffType_onCreated_result_0 ~= nil then
        ____buffType_onCreated_result_0 = ____buffType_onCreated_result_0(____this_1, self)
    end
    for ____, anyBuffCreatedListener in ipairs(____exports.default._sl_anyBuffCreatedListeners) do
        anyBuffCreatedListener(nil, self)
    end
end
__TS__SetDescriptor(
    Buff.prototype,
    "solarData",
    {
        get = function(self)
            return DataBase:getSolarBuffSolarData(self.uuid)
        end,
        set = function(self, obj)
            DataBase:setSolarBuffSolarData(self.uuid, obj)
        end
    },
    true
)
__TS__SetDescriptor(
    Buff.prototype,
    "stackCount",
    {
        get = function(self)
            return self._stackCount
        end,
        set = function(self, value)
            self._stackCount = value
            local ____this_4
            ____this_4 = self.buffType
            local ____table_buffType_onStackCountChange_result_3 = ____this_4.onStackCountChange
            if ____table_buffType_onStackCountChange_result_3 ~= nil then
                ____table_buffType_onStackCountChange_result_3 = ____table_buffType_onStackCountChange_result_3(____this_4, self)
            end
            for ____, listener in ipairs(____exports.default._sl_anyBuffStackCountChangeListeners) do
                listener(nil, self)
            end
        end
    },
    true
)
function Buff.prototype.refresh(self)
    self.creationTime = time
end
function Buff.prototype.getCaster(self)
    return self.caster
end
function Buff.prototype.setCaster(self, value)
    self.caster = value
end
function Buff.prototype.getParent(self)
    return self.parent
end
function Buff.prototype.setParent(self, parent)
    self.parent = parent
end
function Buff.prototype.getCreationTime(self)
    return self.creationTime
end
function Buff.prototype.getDieTime(self)
    return self.creationTime + self.durMS
end
function Buff.prototype.getRemainingTime(self)
    return self.creationTime + self.durMS - BaseUtil.time
end
function Buff.prototype.getName(self)
    return self.buffType.name
end
function Buff.prototype.getUbertip(self)
    return self.ubertip
end
function Buff.prototype.update(self)
    local tpf = time - self.lastUpdateTime
    local ____this_6
    ____this_6 = self.buffType
    local ____table_buffType_onUpdate_result_5 = ____this_6.onUpdate
    if ____table_buffType_onUpdate_result_5 ~= nil then
        ____table_buffType_onUpdate_result_5 = ____table_buffType_onUpdate_result_5(____this_6, self, tpf)
    end
    self._SL_interval = self._SL_interval + tpf
    if self.intervalMS > 0 and self._SL_interval >= self.intervalMS then
        self._SL_interval = 0
        if self.buffType.onInterval then
            self.buffType:onInterval(self)
        end
    end
    if self.durMS > 0 and self:getRemainingTime() <= 0 then
        self:destroy()
    end
    self.lastUpdateTime = time
end
function Buff.prototype.getAttribute(self, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    if not self.atrribute and createDefault then
        self.atrribute = {}
    end
    return self.atrribute
end
function Buff.prototype.destroy(self)
    if self.buffType.onDestroy then
        local flag = self.buffType:onDestroy(self)
        if flag == false then
            return
        end
    end
    for ____, listener in ipairs(____exports.default._sl_anyBuffDestroyListeners) do
        listener(nil, self)
    end
    if self._SL_targetattachEffect then
        DestroyEffect(self._SL_targetattachEffect)
    end
    local solarData = DataBase:getUnitSolarData(self.parent, false)
    local ____solarData__SL_solarBuffSet_7 = solarData
    if ____solarData__SL_solarBuffSet_7 ~= nil then
        ____solarData__SL_solarBuffSet_7 = ____solarData__SL_solarBuffSet_7._SL_solarBuffSet
    end
    if ____solarData__SL_solarBuffSet_7 then
        solarData._SL_solarBuffSet[self.buffType.id] = nil
    end
    local ____table_sTimer_destroy_result_9 = self.sTimer
    if ____table_sTimer_destroy_result_9 ~= nil then
        ____table_sTimer_destroy_result_9 = ____table_sTimer_destroy_result_9:destroy()
    end
    self.solarData = nil
end
Buff._sl_anyBuffCreatedListeners = {}
Buff._sl_anyBuffStackCountChangeListeners = {}
Buff._sl_anyBuffDestroyListeners = {}
____exports.default = Buff
return ____exports
