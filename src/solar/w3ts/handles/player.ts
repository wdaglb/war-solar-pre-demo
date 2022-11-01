/** @noSelfInFile **/

import {Force} from "./force";
import {Handle} from "./handle";
import {Point} from "./point";
import DataBase from "../../common/DataBase";

const cache: { [phid: number]: MapPlayer } = {}

export class MapPlayer extends Handle<player> {

    //GetUserId 对战平台的账号id
    userId?: number;

    private constructor(index: number) {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(Player(index));
        }
    }

    public get solarData(): AppPlayerData {
        return DataBase.getPlayerSolarData(this.handle)
    }

    public set solarData(obj: { [key: string]: any }) {
        DataBase.setDataByHandle("+ply", this.handle, obj)
    }

    public isLocalPlayer() {
        if (GetLocalPlayer() == this.handle) {
            return true
        }
        return false;
    }

    public getAllUnits(): group {
        let g = CreateGroup()
        GroupEnumUnitsOfPlayer(g, this.handle, null)
        return g;
    }

    /**
     * addons
     */
    public displayText(text: string, duration: number = 5) {
        DisplayTimedTextToPlayer(this.handle, 0, 0, duration, text);
    }

    /**
     * 同步获取当前玩家选择的第一个单位
     */
    public getSelectedUnit(): unit {
        SyncSelections()
        GroupClear(tempGroup)
        GroupEnumUnitsSelected(tempGroup, this.handle, null)
        let unitHandle = FirstOfGroup(tempGroup)
        return unitHandle;
    }

    /**
     * base
     */
    public set color(color: playercolor) {
        SetPlayerColor(this.handle, color);
    }

    public get color() {
        return GetPlayerColor(this.handle);
    }

    public get controller() {
        return GetPlayerController(this.handle);
    }

    public get handicap() {
        return GetPlayerHandicap(this.handle);
    }

    public set handicap(handicap: number) {
        SetPlayerHandicap(this.handle, handicap);
    }

    public get handicapXp() {
        return GetPlayerHandicapXP(this.handle);
    }

    public set handicapXp(handicap: number) {
        SetPlayerHandicapXP(this.handle, handicap);
    }

    public get id() {
        return GetPlayerId(this.handle);
    }

    public get name() {
        return GetPlayerName(this.handle);
    }

    public set name(value: string) {
        SetPlayerName(this.handle, value);
    }

    public get race() {
        return GetPlayerRace(this.handle);
    }

    public get slotState() {
        return GetPlayerSlotState(this.handle);
    }

    public get startLocation() {
        return GetPlayerStartLocation(this.handle);
    }

    public get startLocationX() {
        return GetStartLocationX(this.startLocation);
    }

    public get startLocationY() {
        return GetStartLocationY(this.startLocation);
    }

    public get startLocationPoint() {
        return GetStartLocationLoc(this.startLocation);
    }

    public get team() {
        return GetPlayerTeam(this.handle);
    }

    // public get townHallCount() {
    //   return BlzGetPlayerTownHallCount(this.handle);
    // }

    public addTechResearched(techId: number | string, levels: number) {
        AddPlayerTechResearched(this.handle, techId, levels);
    }

    // public decTechResearched(techId: number | string, levels: number) {
    //   BlzDecPlayerTechResearched(this.handle, techId, levels);
    // }

    // Used to store hero level data for the scorescreen
    // before units are moved to neutral passive in melee games
    public cacheHeroData() {
        CachePlayerHeroData(this.handle);
    }

    public compareAlliance(otherPlayer: MapPlayer, whichAllianceSetting: alliancetype) {
        return GetPlayerAlliance(this.handle, otherPlayer.handle, whichAllianceSetting);
    }

    public coordsFogged(x: number, y: number) {
        return IsFoggedToPlayer(x, y, this.handle);
    }

    public coordsMasked(x: number, y: number) {
        return IsMaskedToPlayer(x, y, this.handle);
    }

    public coordsVisible(x: number, y: number) {
        return IsVisibleToPlayer(x, y, this.handle);
    }

    public cripple(toWhichPlayers: Force, flag: boolean) {
        CripplePlayer(this.handle, toWhichPlayers.handle, flag);
    }

    public getScore(whichPlayerScore: playerscore) {
        return GetPlayerScore(this.handle, whichPlayerScore);
    }

    public getState(whichPlayerState: playerstate) {
        return GetPlayerState(this.handle, whichPlayerState);
    }

    public getStructureCount(includeIncomplete: boolean) {
        return GetPlayerStructureCount(this.handle, includeIncomplete);
    }

    public getTaxRate(otherPlayer: player, whichResource: playerstate) {
        return GetPlayerTaxRate(this.handle, otherPlayer, whichResource);
    }

    public getTechCount(techId: number | string, specificonly: boolean) {
        return GetPlayerTechCount(this.handle, techId, specificonly);
    }

    public getTechMaxAllowed(techId: number | string) {
        return GetPlayerTechMaxAllowed(this.handle, techId);
    }

    public getTechResearched(techId: number | string, specificonly: boolean) {
        return GetPlayerTechResearched(this.handle, techId, specificonly);
    }

    public getUnitCount(includeIncomplete: boolean) {
        return GetPlayerUnitCount(this.handle, includeIncomplete);
    }

    public getUnitCountByType(unitName: string, includeIncomplete: boolean, includeUpgrades: boolean) {
        return GetPlayerTypedUnitCount(this.handle, unitName, includeIncomplete, includeUpgrades);
    }

    public inForce(whichForce: Force) {
        return IsPlayerInForce(this.handle, whichForce.handle);
    }

    public isObserver() {
        return IsPlayerObserver(this.handle);
    }

    public isPlayerAlly(otherPlayer: MapPlayer) {
        return IsPlayerAlly(this.handle, otherPlayer.handle);
    }

    public isPlayerEnemy(otherPlayer: MapPlayer) {
        return IsPlayerEnemy(this.handle, otherPlayer.handle);
    }

    public isRacePrefSet(pref: racepreference) {
        return IsPlayerRacePrefSet(this.handle, pref);
    }

    public isSelectable() {
        return GetPlayerSelectable(this.handle);
    }

    public pointFogged(whichPoint: Point) {
        return IsLocationFoggedToPlayer(whichPoint.handle, this.handle);
    }

    public pointMasked(whichPoint: Point) {
        return IsLocationMaskedToPlayer(whichPoint.handle, this.handle);
    }

    public pointVisible(whichPoint: Point) {
        return IsLocationVisibleToPlayer(whichPoint.handle, this.handle);
    }

    public remove(gameResult: playergameresult) {
        RemovePlayer(this.handle, gameResult);
    }

    public removeAllGuardPositions() {
        RemoveAllGuardPositions(this.handle);
    }

    public setAbilityAvailable(abilId: number | string, avail: boolean) {
        SetPlayerAbilityAvailable(this.handle, abilId, avail);
    }

    public setAlliance(otherPlayer: MapPlayer, whichAllianceSetting: alliancetype, value: boolean) {
        SetPlayerAlliance(this.handle, otherPlayer.handle, whichAllianceSetting, value);
    }

    public setOnScoreScreen(flag: boolean) {
        SetPlayerOnScoreScreen(this.handle, flag);
    }

    public addGoldState(value: number) {
        this.addState(PLAYER_STATE_RESOURCE_GOLD, value)
    }

    public addLumberState(value: number) {
        this.addState(PLAYER_STATE_RESOURCE_LUMBER, value)
    }

    public hasGold(value: number): boolean {
        return this.getState(PLAYER_STATE_RESOURCE_GOLD) >= value
    }

    public hasLumber(value: number): boolean {
        return this.getState(PLAYER_STATE_RESOURCE_LUMBER) >= value
    }

    public getGold(): number {
        return this.getState(PLAYER_STATE_RESOURCE_GOLD)
    }

    public getLumber(): number {
        return this.getState(PLAYER_STATE_RESOURCE_LUMBER)
    }

    public addState(whichPlayerState: playerstate, value: number) {
        this.setState(whichPlayerState, this.getState(whichPlayerState) + value);
    }

    public setState(whichPlayerState: playerstate, value: number) {
        SetPlayerState(this.handle, whichPlayerState, value);
    }

    public setTaxRate(otherPlayer: MapPlayer, whichResource: playerstate, rate: number) {
        SetPlayerTaxRate(this.handle, otherPlayer.handle, whichResource, rate);
    }

    public setTechMaxAllowed(techId: number | string, maximum: number) {
        SetPlayerTechMaxAllowed(this.handle, techId, maximum);
    }

    public setTechResearched(techId: number | string, setToLevel: number) {
        SetPlayerTechResearched(this.handle, techId, setToLevel);
    }

    public setUnitsOwner(newOwner: number) {
        SetPlayerUnitsOwner(this.handle, newOwner);
    }

    public static fromEnum() {
        return MapPlayer.fromHandle(GetEnumPlayer());
    }

    public static fromEvent() {
        return MapPlayer.fromHandle(GetTriggerPlayer());
    }

    public static fromFilter() {
        return MapPlayer.fromHandle(GetFilterPlayer());
    }

    public static fromHandle(handle: player): MapPlayer {
        let obj: MapPlayer = cache[GetHandleId(handle)];
        if (!obj) {
            obj = this.getObject(handle);
            cache[GetHandleId(handle)] = obj;
        }
        return obj;
    }

    public static fromIndex(index: number) {
        return this.fromHandle(Player(index));
    }

    public static fromLocal() {
        return this.fromHandle(GetLocalPlayer());
    }

}
