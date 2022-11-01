local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 6,["13"] = 6,["15"] = 9,["16"] = 6,["18"] = 6,["20"] = 12,["23"] = 8,["28"] = 33,["37"] = 37,["39"] = 40,["40"] = 41,["50"] = 113,["52"] = 108,["53"] = 109,["58"] = 16,["59"] = 17,["60"] = 16,["61"] = 20,["62"] = 21,["63"] = 20,["64"] = 24,["65"] = 25,["66"] = 24,["67"] = 28,["68"] = 28,["69"] = 28,["71"] = 29,["72"] = 28,["73"] = 44,["74"] = 45,["75"] = 44,["76"] = 48,["77"] = 49,["78"] = 48,["79"] = 52,["80"] = 53,["81"] = 52,["82"] = 56,["83"] = 57,["84"] = 56,["85"] = 60,["86"] = 61,["87"] = 60,["88"] = 64,["89"] = 65,["90"] = 65,["91"] = 65,["92"] = 65,["93"] = 65,["94"] = 65,["95"] = 65,["96"] = 65,["97"] = 64,["98"] = 68,["99"] = 68,["100"] = 68,["102"] = 68,["103"] = 68,["105"] = 68,["106"] = 68,["108"] = 69,["109"] = 69,["110"] = 69,["111"] = 69,["112"] = 69,["113"] = 69,["114"] = 69,["115"] = 68,["116"] = 72,["117"] = 73,["118"] = 72,["119"] = 76,["120"] = 77,["121"] = 77,["122"] = 77,["123"] = 77,["124"] = 77,["125"] = 77,["126"] = 77,["127"] = 77,["128"] = 76,["129"] = 80,["130"] = 81,["131"] = 81,["132"] = 81,["133"] = 81,["134"] = 81,["135"] = 81,["136"] = 81,["137"] = 80,["138"] = 84,["139"] = 85,["140"] = 84,["141"] = 88,["142"] = 88,["143"] = 88,["145"] = 88,["146"] = 88,["148"] = 88,["149"] = 88,["151"] = 88,["152"] = 88,["154"] = 89,["155"] = 89,["156"] = 89,["157"] = 89,["158"] = 89,["159"] = 89,["160"] = 89,["161"] = 88,["162"] = 92,["163"] = 93,["164"] = 93,["165"] = 93,["166"] = 93,["167"] = 93,["168"] = 93,["169"] = 93,["170"] = 92,["171"] = 96,["172"] = 96,["173"] = 96,["175"] = 97,["176"] = 96,["177"] = 100,["178"] = 100,["179"] = 100,["181"] = 101,["182"] = 100,["183"] = 104,["184"] = 104,["185"] = 104,["187"] = 105,["188"] = 104,["189"] = 116,["190"] = 117,["191"] = 116,["192"] = 120,["193"] = 121,["194"] = 120});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Leaderboard = __TS__Class()
local Leaderboard = ____exports.Leaderboard
Leaderboard.name = "Leaderboard"
__TS__ClassExtends(Leaderboard, Handle)
function Leaderboard.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateLeaderboard()
        )
    end
end
__TS__SetDescriptor(
    Leaderboard.prototype,
    "displayed",
    {get = function(self)
        return IsLeaderboardDisplayed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Leaderboard.prototype,
    "itemCount",
    {
        get = function(self)
            return LeaderboardGetItemCount(self.handle)
        end,
        set = function(self, count)
            LeaderboardSetSizeByItemCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Leaderboard.prototype,
    "label",
    {
        get = function(self)
            return LeaderboardGetLabelText(self.handle)
        end,
        set = function(self, value)
            LeaderboardSetLabel(self.handle, value)
        end
    },
    true
)
function Leaderboard.prototype.addItem(self, label, value, p)
    LeaderboardAddItem(self.handle, label, value, p.handle)
end
function Leaderboard.prototype.clear(self)
    LeaderboardClear(self.handle)
end
function Leaderboard.prototype.destroy(self)
    DestroyLeaderboard(self.handle)
end
function Leaderboard.prototype.display(self, flag)
    if flag == nil then
        flag = true
    end
    LeaderboardDisplay(self.handle, flag)
end
function Leaderboard.prototype.getPlayerIndex(self, p)
    return LeaderboardGetPlayerIndex(self.handle, p.handle)
end
function Leaderboard.prototype.hasPlayerItem(self, p)
    LeaderboardHasPlayerItem(self.handle, p.handle)
end
function Leaderboard.prototype.removeItem(self, index)
    LeaderboardRemoveItem(self.handle, index)
end
function Leaderboard.prototype.removePlayerItem(self, p)
    LeaderboardRemovePlayerItem(self.handle, p.handle)
end
function Leaderboard.prototype.setItemLabel(self, item, label)
    LeaderboardSetItemLabel(self.handle, item, label)
end
function Leaderboard.prototype.setItemLabelColor(self, item, red, green, blue, alpha)
    LeaderboardSetItemLabelColor(
        self.handle,
        item,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setItemStyle(self, item, showLabel, showValues, showIcons)
    if showLabel == nil then
        showLabel = true
    end
    if showValues == nil then
        showValues = true
    end
    if showIcons == nil then
        showIcons = true
    end
    LeaderboardSetItemStyle(
        self.handle,
        item,
        showLabel,
        showValues,
        showIcons
    )
end
function Leaderboard.prototype.setItemValue(self, item, value)
    LeaderboardSetItemValue(self.handle, item, value)
end
function Leaderboard.prototype.setItemValueColor(self, item, red, green, blue, alpha)
    LeaderboardSetItemValueColor(
        self.handle,
        item,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setLabelColor(self, red, green, blue, alpha)
    LeaderboardSetLabelColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setPlayerBoard(self, p)
    PlayerSetLeaderboard(p.handle, self.handle)
end
function Leaderboard.prototype.setStyle(self, showLabel, showNames, showValues, showIcons)
    if showLabel == nil then
        showLabel = true
    end
    if showNames == nil then
        showNames = true
    end
    if showValues == nil then
        showValues = true
    end
    if showIcons == nil then
        showIcons = true
    end
    LeaderboardSetStyle(
        self.handle,
        showLabel,
        showNames,
        showValues,
        showIcons
    )
end
function Leaderboard.prototype.setValueColor(self, red, green, blue, alpha)
    LeaderboardSetValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.sortByLabel(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByLabel(self.handle, asc)
end
function Leaderboard.prototype.sortByPlayer(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByPlayer(self.handle, asc)
end
function Leaderboard.prototype.sortByValue(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByValue(self.handle, asc)
end
function Leaderboard.fromHandle(self, handle)
    return self:getObject(handle)
end
function Leaderboard.fromPlayer(self, p)
    return self:fromHandle(PlayerGetLeaderboard(p.handle))
end
return ____exports
