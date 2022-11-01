local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 8,["12"] = 8,["13"] = 11,["14"] = 11,["15"] = 11,["16"] = 11,["18"] = 14,["19"] = 11,["21"] = 11,["23"] = 17,["26"] = 13,["32"] = 33,["34"] = 21,["35"] = 22,["36"] = 23,["38"] = 25,["48"] = 37,["56"] = 41,["63"] = 45,["72"] = 53,["74"] = 48,["75"] = 49,["80"] = 59,["81"] = 60,["82"] = 59,["83"] = 86,["84"] = 87,["85"] = 86,["86"] = 93,["87"] = 94,["88"] = 93,["89"] = 100,["90"] = 101,["91"] = 100,["92"] = 107,["93"] = 108,["94"] = 107,["95"] = 114,["96"] = 115,["97"] = 114,["98"] = 121,["99"] = 122,["100"] = 121,["101"] = 129,["103"] = 131,["104"] = 131,["105"] = 132,["106"] = 132,["107"] = 132,["108"] = 132,["109"] = 132,["110"] = 132,["111"] = 131,["114"] = 129,["115"] = 143,["116"] = 144,["117"] = 143,["118"] = 150,["119"] = 151,["120"] = 150,["121"] = 157,["122"] = 158,["123"] = 157,["124"] = 164,["125"] = 165,["126"] = 166,["127"] = 167,["128"] = 164,["129"] = 173,["130"] = 174,["131"] = 175,["132"] = 176,["133"] = 173,["134"] = 182,["135"] = 183,["136"] = 182,["137"] = 190,["138"] = 191,["139"] = 190,["140"] = 197,["141"] = 198,["142"] = 197,["143"] = 204,["144"] = 205,["145"] = 204,["146"] = 211,["147"] = 212,["148"] = 211,["149"] = 218,["150"] = 219,["151"] = 218,["152"] = 225,["153"] = 226,["154"] = 225,["155"] = 232,["157"] = 233,["158"] = 233,["159"] = 234,["160"] = 234,["161"] = 234,["162"] = 234,["163"] = 234,["164"] = 234,["165"] = 233,["168"] = 232,["169"] = 241,["170"] = 242,["171"] = 241,["172"] = 248,["174"] = 249,["175"] = 249,["176"] = 250,["177"] = 250,["178"] = 250,["179"] = 250,["180"] = 250,["181"] = 249,["184"] = 248,["185"] = 265,["186"] = 266,["187"] = 266,["188"] = 266,["189"] = 266,["190"] = 266,["191"] = 266,["192"] = 266,["193"] = 265,["194"] = 276,["195"] = 277,["196"] = 276,["197"] = 285,["198"] = 286,["199"] = 285,["200"] = 294,["201"] = 295,["202"] = 294,["203"] = 301,["204"] = 302,["205"] = 301,["206"] = 308,["207"] = 309,["208"] = 308,["209"] = 315,["210"] = 316,["211"] = 315,["212"] = 322,["213"] = 323,["214"] = 322,["215"] = 329,["216"] = 330,["217"] = 330,["218"] = 330,["219"] = 330,["220"] = 330,["221"] = 330,["222"] = 330,["223"] = 329,["224"] = 340,["225"] = 341,["226"] = 340,["227"] = 347,["228"] = 348,["229"] = 347,["230"] = 354,["231"] = 355,["232"] = 354,["233"] = 361,["234"] = 362,["235"] = 361,["236"] = 368,["237"] = 369,["238"] = 368,["239"] = 375,["240"] = 376,["241"] = 375,["242"] = 386,["243"] = 387,["244"] = 386,["245"] = 393,["246"] = 394,["247"] = 393});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____TriggerUtil = require("solar.util.system.TriggerUtil")
local TriggerUtil = ____TriggerUtil.default
____exports.Trigger = __TS__Class()
local Trigger = ____exports.Trigger
Trigger.name = "Trigger"
__TS__ClassExtends(Trigger, Handle)
function Trigger.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateTrigger()
        )
    end
end
__TS__SetDescriptor(
    Trigger.prototype,
    "enabled",
    {
        get = function(self)
            return IsTriggerEnabled(self.handle)
        end,
        set = function(self, flag)
            if flag then
                EnableTrigger(self.handle)
            else
                DisableTrigger(self.handle)
            end
        end
    },
    true
)
__TS__SetDescriptor(
    Trigger.prototype,
    "evalCount",
    {get = function(self)
        return GetTriggerEvalCount(self.handle)
    end},
    true
)
__TS__ObjectDefineProperty(
    Trigger,
    "eventId",
    {get = function(self)
        return GetTriggerEventId()
    end}
)
__TS__SetDescriptor(
    Trigger.prototype,
    "execCount",
    {get = function(self)
        return GetTriggerExecCount(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Trigger.prototype,
    "waitOnSleeps",
    {
        get = function(self)
            return IsTriggerWaitOnSleeps(self.handle)
        end,
        set = function(self, flag)
            TriggerWaitOnSleeps(self.handle, flag)
        end
    },
    true
)
function Trigger.prototype.addAction(self, actionFunc)
    return TriggerAddAction(self.handle, actionFunc)
end
function Trigger.prototype.addCondition(self, condition)
    return TriggerAddCondition(self.handle, condition)
end
function Trigger.prototype.destroy(self)
    DestroyTrigger(self.handle)
end
function Trigger.prototype.eval(self)
    return TriggerEvaluate(self.handle)
end
function Trigger.prototype.exec(self)
    return TriggerExecute(self.handle)
end
function Trigger.prototype.registerAnyUnitDamagedEvent(self)
    TriggerUtil.SystemAnyUnitDamagedRegistTrigger(self.handle)
end
function Trigger.prototype.registerAnyUnitDeathEvent(self)
    self:registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH)
end
function Trigger.prototype.registerAnyUnitEvent(self, whichPlayerUnitEvent)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerUnitEvent(
                self.handle,
                Player(i),
                whichPlayerUnitEvent,
                nil
            )
            i = i + 1
        end
    end
end
function Trigger.prototype.registerDeathEvent(self, whichWidget)
    return TriggerRegisterDeathEvent(self.handle, whichWidget.handle)
end
function Trigger.prototype.registerDialogButtonEvent(self, whichButton)
    return TriggerRegisterDialogButtonEvent(self.handle, whichButton.handle)
end
function Trigger.prototype.registerDialogEvent(self, whichDialog)
    return TriggerRegisterDialogEvent(self.handle, whichDialog.handle)
end
function Trigger.prototype.registerEnterRect(self, whichRect)
    local rectRegion = CreateRegion()
    RegionAddRect(rectRegion, whichRect)
    return TriggerRegisterEnterRegion(self.handle, rectRegion, nil)
end
function Trigger.prototype.registerLeaveRect(self, whichRect)
    local rectRegion = CreateRegion()
    RegionAddRect(rectRegion, whichRect)
    return TriggerRegisterLeaveRegion(self.handle, rectRegion, nil)
end
function Trigger.prototype.registerEnterRegion(self, whichRegion, filter)
    return TriggerRegisterEnterRegion(self.handle, whichRegion, filter)
end
function Trigger.prototype.registerFilterUnitEvent(self, whichUnit, whichEvent, filter)
    return TriggerRegisterFilterUnitEvent(self.handle, whichUnit, whichEvent, filter)
end
function Trigger.prototype.registerGameEvent(self, whichGameEvent)
    return TriggerRegisterGameEvent(self.handle, whichGameEvent)
end
function Trigger.prototype.registerGameStateEvent(self, whichState, opcode, limitval)
    return TriggerRegisterGameStateEvent(self.handle, whichState, opcode, limitval)
end
function Trigger.prototype.registerLeaveRegion(self, whichRegion, filter)
    return TriggerRegisterLeaveRegion(self.handle, whichRegion, filter)
end
function Trigger.prototype.registerPlayerAllianceChange(self, whichPlayer, whichAlliance)
    return TriggerRegisterPlayerAllianceChange(self.handle, whichPlayer.handle, whichAlliance)
end
function Trigger.prototype.registerPlayerChatEvent(self, whichPlayer, chatMessageToDetect, exactMatchOnly)
    return TriggerRegisterPlayerChatEvent(self.handle, whichPlayer.handle, chatMessageToDetect, exactMatchOnly)
end
function Trigger.prototype.registerAnyPlayerChatEvent(self, chatMessageToDetect, exactMatchOnly)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerChatEvent(
                self.handle,
                Player(i),
                chatMessageToDetect,
                exactMatchOnly
            )
            i = i + 1
        end
    end
end
function Trigger.prototype.registerPlayerEvent(self, whichPlayer, whichPlayerEvent)
    return TriggerRegisterPlayerEvent(self.handle, whichPlayer.handle, whichPlayerEvent)
end
function Trigger.prototype.registerAnyPlayerEvent(self, whichPlayerEvent)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerEvent(
                self.handle,
                Player(i),
                whichPlayerEvent
            )
            i = i + 1
        end
    end
end
function Trigger.prototype.registerPlayerStateEvent(self, whichPlayer, whichState, opcode, limitval)
    return TriggerRegisterPlayerStateEvent(
        self.handle,
        whichPlayer.handle,
        whichState,
        opcode,
        limitval
    )
end
function Trigger.prototype.registerPlayerUnitEvent(self, whichPlayer, whichPlayerUnitEvent, filter)
    return TriggerRegisterPlayerUnitEvent(self.handle, whichPlayer.handle, whichPlayerUnitEvent, filter)
end
function Trigger.prototype.registerTimerEvent(self, timeout, periodic)
    return TriggerRegisterTimerEvent(self.handle, timeout, periodic)
end
function Trigger.prototype.registerTimerExpireEvent(self, t)
    return TriggerRegisterTimerExpireEvent(self.handle, t)
end
function Trigger.prototype.registerTrackableHitEvent(self, whichTrackable)
    return TriggerRegisterTrackableHitEvent(self.handle, whichTrackable)
end
function Trigger.prototype.registerTrackableTrackEvent(self, whichTrackable)
    return TriggerRegisterTrackableTrackEvent(self.handle, whichTrackable)
end
function Trigger.prototype.registerUnitEvent(self, whichUnit, whichEvent)
    return TriggerRegisterUnitEvent(self.handle, whichUnit.handle, whichEvent)
end
function Trigger.prototype.registerUnitInRage(self, whichUnit, range, filter)
    return TriggerRegisterUnitInRange(self.handle, whichUnit, range, filter)
end
function Trigger.prototype.registerUnitStateEvent(self, whichUnit, whichState, opcode, limitval)
    return TriggerRegisterUnitStateEvent(
        self.handle,
        whichUnit.handle,
        whichState,
        opcode,
        limitval
    )
end
function Trigger.prototype.registerVariableEvent(self, varName, opcode, limitval)
    return TriggerRegisterVariableEvent(self.handle, varName, opcode, limitval)
end
function Trigger.prototype.removeAction(self, whichAction)
    return TriggerRemoveAction(self.handle, whichAction)
end
function Trigger.prototype.removeActions(self)
    return TriggerClearActions(self.handle)
end
function Trigger.prototype.removeCondition(self, whichCondition)
    return TriggerRemoveCondition(self.handle, whichCondition)
end
function Trigger.prototype.removeConditions(self)
    return TriggerClearConditions(self.handle)
end
function Trigger.prototype.reset(self)
    ResetTrigger(self.handle)
end
function Trigger.fromEvent(self)
    return self:fromHandle(GetTriggeringTrigger())
end
function Trigger.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
