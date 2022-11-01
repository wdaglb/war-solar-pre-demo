local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 6,["11"] = 6,["12"] = 8,["13"] = 10,["14"] = 10,["15"] = 10,["16"] = 10,["17"] = 15,["18"] = 16,["19"] = 10,["21"] = 10,["23"] = 19,["26"] = 15,["32"] = 24,["34"] = 27,["35"] = 28,["45"] = 70,["47"] = 65,["48"] = 66,["57"] = 74,["66"] = 78,["68"] = 81,["69"] = 82,["79"] = 86,["81"] = 89,["82"] = 90,["91"] = 94,["100"] = 98,["102"] = 101,["103"] = 102,["112"] = 106,["120"] = 110,["128"] = 114,["136"] = 118,["144"] = 122,["152"] = 126,["160"] = 130,["164"] = 31,["165"] = 32,["166"] = 33,["168"] = 35,["169"] = 31,["170"] = 38,["171"] = 39,["172"] = 40,["173"] = 41,["174"] = 38,["175"] = 47,["176"] = 47,["177"] = 47,["179"] = 48,["180"] = 48,["181"] = 48,["182"] = 48,["183"] = 48,["184"] = 48,["185"] = 48,["186"] = 47,["187"] = 54,["188"] = 55,["189"] = 56,["190"] = 57,["191"] = 58,["192"] = 59,["193"] = 54,["194"] = 137,["195"] = 138,["196"] = 137,["197"] = 147,["198"] = 148,["199"] = 147,["200"] = 151,["201"] = 152,["202"] = 151,["203"] = 155,["204"] = 156,["205"] = 155,["206"] = 159,["207"] = 160,["208"] = 159,["209"] = 163,["210"] = 164,["211"] = 163,["212"] = 167,["213"] = 168,["214"] = 167,["215"] = 171,["216"] = 172,["217"] = 171,["218"] = 175,["219"] = 176,["220"] = 175,["221"] = 179,["222"] = 180,["223"] = 179,["224"] = 183,["225"] = 184,["226"] = 183,["227"] = 187,["228"] = 188,["229"] = 187,["230"] = 191,["231"] = 192,["232"] = 191,["233"] = 195,["234"] = 196,["235"] = 195,["236"] = 199,["237"] = 200,["238"] = 199,["239"] = 203,["240"] = 204,["241"] = 203,["242"] = 207,["243"] = 208,["244"] = 207,["245"] = 211,["246"] = 212,["247"] = 211,["248"] = 215,["249"] = 216,["250"] = 215,["251"] = 219,["252"] = 220,["253"] = 219,["254"] = 223,["255"] = 224,["256"] = 223,["257"] = 227,["258"] = 228,["259"] = 227,["260"] = 231,["261"] = 232,["262"] = 231,["263"] = 235,["264"] = 236,["265"] = 235,["266"] = 239,["267"] = 240,["268"] = 239,["269"] = 243,["270"] = 244,["271"] = 243,["272"] = 247,["273"] = 248,["274"] = 247,["275"] = 251,["276"] = 252,["277"] = 251,["278"] = 255,["279"] = 256,["280"] = 255,["281"] = 259,["282"] = 260,["283"] = 259,["284"] = 263,["285"] = 264,["286"] = 263,["287"] = 267,["288"] = 268,["289"] = 267,["290"] = 271,["291"] = 272,["292"] = 271,["293"] = 275,["294"] = 276,["295"] = 275,["296"] = 279,["297"] = 280,["298"] = 279,["299"] = 283,["300"] = 284,["301"] = 283,["302"] = 287,["303"] = 288,["304"] = 288,["305"] = 288,["306"] = 288,["307"] = 287,["308"] = 291,["309"] = 292,["310"] = 291,["311"] = 295,["312"] = 296,["313"] = 295,["314"] = 299,["315"] = 300,["316"] = 299,["317"] = 303,["318"] = 304,["319"] = 303,["320"] = 307,["321"] = 308,["322"] = 307,["323"] = 311,["324"] = 312,["325"] = 311,["326"] = 315,["327"] = 316,["328"] = 315,["329"] = 319,["330"] = 320,["331"] = 319,["332"] = 323,["333"] = 324,["334"] = 325,["335"] = 326,["336"] = 327,["338"] = 329,["339"] = 323,["340"] = 332,["341"] = 333,["342"] = 332,["343"] = 336,["344"] = 337,["345"] = 336});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local cache = {}
____exports.MapPlayer = __TS__Class()
local MapPlayer = ____exports.MapPlayer
MapPlayer.name = "MapPlayer"
__TS__ClassExtends(MapPlayer, Handle)
function MapPlayer.prototype.____constructor(self, index)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            Player(index)
        )
    end
end
__TS__SetDescriptor(
    MapPlayer.prototype,
    "solarData",
    {
        get = function(self)
            return DataBase:getPlayerSolarData(self.handle)
        end,
        set = function(self, obj)
            DataBase:setDataByHandle("+ply", self.handle, obj)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "color",
    {
        get = function(self)
            return GetPlayerColor(self.handle)
        end,
        set = function(self, color)
            SetPlayerColor(self.handle, color)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "controller",
    {get = function(self)
        return GetPlayerController(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "handicap",
    {
        get = function(self)
            return GetPlayerHandicap(self.handle)
        end,
        set = function(self, handicap)
            SetPlayerHandicap(self.handle, handicap)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "handicapXp",
    {
        get = function(self)
            return GetPlayerHandicapXP(self.handle)
        end,
        set = function(self, handicap)
            SetPlayerHandicapXP(self.handle, handicap)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "id",
    {get = function(self)
        return GetPlayerId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "name",
    {
        get = function(self)
            return GetPlayerName(self.handle)
        end,
        set = function(self, value)
            SetPlayerName(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "race",
    {get = function(self)
        return GetPlayerRace(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "slotState",
    {get = function(self)
        return GetPlayerSlotState(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocation",
    {get = function(self)
        return GetPlayerStartLocation(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationX",
    {get = function(self)
        return GetStartLocationX(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationY",
    {get = function(self)
        return GetStartLocationY(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationPoint",
    {get = function(self)
        return GetStartLocationLoc(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "team",
    {get = function(self)
        return GetPlayerTeam(self.handle)
    end},
    true
)
function MapPlayer.prototype.isLocalPlayer(self)
    if GetLocalPlayer() == self.handle then
        return true
    end
    return false
end
function MapPlayer.prototype.getAllUnits(self)
    local g = CreateGroup()
    GroupEnumUnitsOfPlayer(g, self.handle, nil)
    return g
end
function MapPlayer.prototype.displayText(self, text, duration)
    if duration == nil then
        duration = 5
    end
    DisplayTimedTextToPlayer(
        self.handle,
        0,
        0,
        duration,
        text
    )
end
function MapPlayer.prototype.getSelectedUnit(self)
    SyncSelections()
    GroupClear(tempGroup)
    GroupEnumUnitsSelected(tempGroup, self.handle, nil)
    local unitHandle = FirstOfGroup(tempGroup)
    return unitHandle
end
function MapPlayer.prototype.addTechResearched(self, techId, levels)
    AddPlayerTechResearched(self.handle, techId, levels)
end
function MapPlayer.prototype.cacheHeroData(self)
    CachePlayerHeroData(self.handle)
end
function MapPlayer.prototype.compareAlliance(self, otherPlayer, whichAllianceSetting)
    return GetPlayerAlliance(self.handle, otherPlayer.handle, whichAllianceSetting)
end
function MapPlayer.prototype.coordsFogged(self, x, y)
    return IsFoggedToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.coordsMasked(self, x, y)
    return IsMaskedToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.coordsVisible(self, x, y)
    return IsVisibleToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.cripple(self, toWhichPlayers, flag)
    CripplePlayer(self.handle, toWhichPlayers.handle, flag)
end
function MapPlayer.prototype.getScore(self, whichPlayerScore)
    return GetPlayerScore(self.handle, whichPlayerScore)
end
function MapPlayer.prototype.getState(self, whichPlayerState)
    return GetPlayerState(self.handle, whichPlayerState)
end
function MapPlayer.prototype.getStructureCount(self, includeIncomplete)
    return GetPlayerStructureCount(self.handle, includeIncomplete)
end
function MapPlayer.prototype.getTaxRate(self, otherPlayer, whichResource)
    return GetPlayerTaxRate(self.handle, otherPlayer, whichResource)
end
function MapPlayer.prototype.getTechCount(self, techId, specificonly)
    return GetPlayerTechCount(self.handle, techId, specificonly)
end
function MapPlayer.prototype.getTechMaxAllowed(self, techId)
    return GetPlayerTechMaxAllowed(self.handle, techId)
end
function MapPlayer.prototype.getTechResearched(self, techId, specificonly)
    return GetPlayerTechResearched(self.handle, techId, specificonly)
end
function MapPlayer.prototype.getUnitCount(self, includeIncomplete)
    return GetPlayerUnitCount(self.handle, includeIncomplete)
end
function MapPlayer.prototype.getUnitCountByType(self, unitName, includeIncomplete, includeUpgrades)
    return GetPlayerTypedUnitCount(self.handle, unitName, includeIncomplete, includeUpgrades)
end
function MapPlayer.prototype.inForce(self, whichForce)
    return IsPlayerInForce(self.handle, whichForce.handle)
end
function MapPlayer.prototype.isObserver(self)
    return IsPlayerObserver(self.handle)
end
function MapPlayer.prototype.isPlayerAlly(self, otherPlayer)
    return IsPlayerAlly(self.handle, otherPlayer.handle)
end
function MapPlayer.prototype.isPlayerEnemy(self, otherPlayer)
    return IsPlayerEnemy(self.handle, otherPlayer.handle)
end
function MapPlayer.prototype.isRacePrefSet(self, pref)
    return IsPlayerRacePrefSet(self.handle, pref)
end
function MapPlayer.prototype.isSelectable(self)
    return GetPlayerSelectable(self.handle)
end
function MapPlayer.prototype.pointFogged(self, whichPoint)
    return IsLocationFoggedToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.pointMasked(self, whichPoint)
    return IsLocationMaskedToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.pointVisible(self, whichPoint)
    return IsLocationVisibleToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.remove(self, gameResult)
    RemovePlayer(self.handle, gameResult)
end
function MapPlayer.prototype.removeAllGuardPositions(self)
    RemoveAllGuardPositions(self.handle)
end
function MapPlayer.prototype.setAbilityAvailable(self, abilId, avail)
    SetPlayerAbilityAvailable(self.handle, abilId, avail)
end
function MapPlayer.prototype.setAlliance(self, otherPlayer, whichAllianceSetting, value)
    SetPlayerAlliance(self.handle, otherPlayer.handle, whichAllianceSetting, value)
end
function MapPlayer.prototype.setOnScoreScreen(self, flag)
    SetPlayerOnScoreScreen(self.handle, flag)
end
function MapPlayer.prototype.addGoldState(self, value)
    self:addState(PLAYER_STATE_RESOURCE_GOLD, value)
end
function MapPlayer.prototype.addLumberState(self, value)
    self:addState(PLAYER_STATE_RESOURCE_LUMBER, value)
end
function MapPlayer.prototype.hasGold(self, value)
    return self:getState(PLAYER_STATE_RESOURCE_GOLD) >= value
end
function MapPlayer.prototype.hasLumber(self, value)
    return self:getState(PLAYER_STATE_RESOURCE_LUMBER) >= value
end
function MapPlayer.prototype.getGold(self)
    return self:getState(PLAYER_STATE_RESOURCE_GOLD)
end
function MapPlayer.prototype.getLumber(self)
    return self:getState(PLAYER_STATE_RESOURCE_LUMBER)
end
function MapPlayer.prototype.addState(self, whichPlayerState, value)
    self:setState(
        whichPlayerState,
        self:getState(whichPlayerState) + value
    )
end
function MapPlayer.prototype.setState(self, whichPlayerState, value)
    SetPlayerState(self.handle, whichPlayerState, value)
end
function MapPlayer.prototype.setTaxRate(self, otherPlayer, whichResource, rate)
    SetPlayerTaxRate(self.handle, otherPlayer.handle, whichResource, rate)
end
function MapPlayer.prototype.setTechMaxAllowed(self, techId, maximum)
    SetPlayerTechMaxAllowed(self.handle, techId, maximum)
end
function MapPlayer.prototype.setTechResearched(self, techId, setToLevel)
    SetPlayerTechResearched(self.handle, techId, setToLevel)
end
function MapPlayer.prototype.setUnitsOwner(self, newOwner)
    SetPlayerUnitsOwner(self.handle, newOwner)
end
function MapPlayer.fromEnum(self)
    return ____exports.MapPlayer:fromHandle(GetEnumPlayer())
end
function MapPlayer.fromEvent(self)
    return ____exports.MapPlayer:fromHandle(GetTriggerPlayer())
end
function MapPlayer.fromFilter(self)
    return ____exports.MapPlayer:fromHandle(GetFilterPlayer())
end
function MapPlayer.fromHandle(self, handle)
    local obj = cache[GetHandleId(handle)]
    if not obj then
        obj = self:getObject(handle)
        cache[GetHandleId(handle)] = obj
    end
    return obj
end
function MapPlayer.fromIndex(self, index)
    return self:fromHandle(Player(index))
end
function MapPlayer.fromLocal(self)
    return self:fromHandle(GetLocalPlayer())
end
return ____exports
