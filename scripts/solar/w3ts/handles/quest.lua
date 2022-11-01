local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 5,["15"] = 7,["16"] = 8,["17"] = 5,["19"] = 5,["21"] = 11,["24"] = 7,["30"] = 20,["32"] = 23,["33"] = 24,["38"] = 15,["39"] = 16,["40"] = 15,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 28,["46"] = 31,["47"] = 31,["48"] = 31,["50"] = 31,["52"] = 28,["53"] = 30,["59"] = 35,["61"] = 38,["62"] = 39,["72"] = 43,["74"] = 46,["75"] = 47,["85"] = 51,["87"] = 54,["88"] = 55,["98"] = 59,["100"] = 62,["101"] = 63,["111"] = 67,["113"] = 70,["114"] = 71,["119"] = 74,["120"] = 75,["121"] = 77,["122"] = 79,["123"] = 74,["124"] = 82,["125"] = 83,["126"] = 82,["127"] = 86,["128"] = 87,["129"] = 86,["130"] = 90,["131"] = 91,["132"] = 90,["133"] = 94,["134"] = 95,["135"] = 94,["136"] = 98,["137"] = 99,["138"] = 98,["139"] = 102,["140"] = 103,["141"] = 102,["142"] = 106,["143"] = 107,["144"] = 106});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.QuestItem = __TS__Class()
local QuestItem = ____exports.QuestItem
QuestItem.name = "QuestItem"
__TS__ClassExtends(QuestItem, Handle)
function QuestItem.prototype.____constructor(self, whichQuest)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            QuestCreateItem(whichQuest.handle)
        )
    end
end
__TS__SetDescriptor(
    QuestItem.prototype,
    "completed",
    {
        get = function(self)
            return IsQuestItemCompleted(self.handle)
        end,
        set = function(self, completed)
            QuestItemSetCompleted(self.handle, completed)
        end
    },
    true
)
function QuestItem.prototype.setDescription(self, description)
    QuestItemSetDescription(self.handle, description)
end
____exports.Quest = __TS__Class()
local Quest = ____exports.Quest
Quest.name = "Quest"
__TS__ClassExtends(Quest, Handle)
function Quest.prototype.____constructor(self)
    local ____Handle_initFromHandle_result_0
    if Handle:initFromHandle() then
        ____Handle_initFromHandle_result_0 = nil
    else
        ____Handle_initFromHandle_result_0 = CreateQuest()
    end
    Handle.prototype.____constructor(self, ____Handle_initFromHandle_result_0)
end
__TS__SetDescriptor(
    Quest.prototype,
    "completed",
    {
        get = function(self)
            return IsQuestCompleted(self.handle)
        end,
        set = function(self, completed)
            QuestSetCompleted(self.handle, completed)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "discovered",
    {
        get = function(self)
            return IsQuestDiscovered(self.handle)
        end,
        set = function(self, discovered)
            QuestSetDiscovered(self.handle, discovered)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "enabled",
    {
        get = function(self)
            return IsQuestEnabled(self.handle)
        end,
        set = function(self, enabled)
            QuestSetEnabled(self.handle, enabled)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "failed",
    {
        get = function(self)
            return IsQuestFailed(self.handle)
        end,
        set = function(self, failed)
            QuestSetFailed(self.handle, failed)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "required",
    {
        get = function(self)
            return IsQuestRequired(self.handle)
        end,
        set = function(self, required)
            QuestSetRequired(self.handle, required)
        end
    },
    true
)
function Quest.prototype.addItem(self, description)
    local questItem = __TS__New(____exports.QuestItem, self)
    questItem:setDescription(description)
    return questItem
end
function Quest.prototype.destroy(self)
    DestroyQuest(self.handle)
end
function Quest.prototype.setDescription(self, description)
    QuestSetDescription(self.handle, description)
end
function Quest.prototype.setIcon(self, iconPath)
    QuestSetIconPath(self.handle, iconPath)
end
function Quest.prototype.setTitle(self, title)
    QuestSetTitle(self.handle, title)
end
function Quest.flashQuestDialogButton(self)
    FlashQuestDialogButton()
end
function Quest.forceQuestDialogUpdate(self)
    ForceQuestDialogUpdate()
end
function Quest.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
