/** @noSelf **/
export default class DzApiHelper {


    static DzAPI_Map_IsPlatformVIP(whichPlayer: player): boolean {


        return DzAPI_Map_GetPlatformVIP(whichPlayer) > 0;
    }

    static DzAPI_Map_Global_GetStoreString(key: string): string {


        return RequestExtraStringData(36, GetLocalPlayer(), key, null, false, 0, 0, 0);
    }

    static DzAPI_Map_Global_StoreString(key: string, value: string): void {


        RequestExtraStringData(37, GetLocalPlayer(), key, value, false, 0, 0, 0);
    }

    static DzAPI_Map_Global_ChangeMsg(trig: trigger): void {


        DzTriggerRegisterSyncData(trig, "DZGAU", true);
    }

    static DzAPI_Map_ServerArchive(whichPlayer: player, key: string): string {


        return RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0);
    }

    static DzAPI_Map_SaveServerArchive(whichPlayer: player, key: string, value: string): void {


        RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0);
    }

    static DzAPI_Map_IsRPGQuickMatch(): boolean {


        return RequestExtraBooleanData(40, null, null, null, false, 0, 0, 0);
    }

    static DzAPI_Map_GetMallItemCount(whichPlayer: player, key: string): number {


        return RequestExtraIntegerData(41, whichPlayer, key, null, false, 0, 0, 0);
    }

    static DzAPI_Map_ConsumeMallItem(whichPlayer: player, key: string, count: number): boolean {


        return RequestExtraBooleanData(42, whichPlayer, key, null, false, count, 0, 0);
    }

    static DzAPI_Map_EnablePlatformSettings(whichPlayer: player, option: number, enable: boolean): boolean {


        return RequestExtraBooleanData(43, whichPlayer, null, null, enable, option, 0, 0);
    }

    static DzAPI_Map_IsBuyReforged(whichPlayer: player): boolean {


        return RequestExtraBooleanData(44, whichPlayer, null, null, false, 0, 0, 0);
    }

    static GetPlayerServerValueSuccess(whichPlayer: player): boolean {


        if ((DzAPI_Map_GetServerValueErrorCode(whichPlayer) == 0))
            return true;
        else
            return false;
    }

    static DzAPI_Map_StoreIntegerEX(whichPlayer: player, key: string, value: number): void {


        key = "I" + key;
        RequestExtraBooleanData(39, whichPlayer, key, I2S(value), false, 0, 0, 0);
        key = null;
        whichPlayer = null;
    }

    static DzAPI_Map_GetStoredIntegerEX(whichPlayer: player, key: string): number {

        let value: number;

        key = "I" + key;
        value = S2I(RequestExtraStringData(38, whichPlayer, key, null, false, 0, 0, 0));
        key = null;
        whichPlayer = null;
        return value;
    }

    static DzAPI_Map_StoreInteger(whichPlayer: player, key: string, value: number): void {


        key = "I" + key;
        DzAPI_Map_SaveServerValue(whichPlayer, key, I2S(value));
        key = null;
        whichPlayer = null;
    }

    static DzAPI_Map_GetStoredInteger(whichPlayer: player, key: string): number {

        let value: number;

        key = "I" + key;
        value = S2I(DzAPI_Map_GetServerValue(whichPlayer, key));
        key = null;
        whichPlayer = null;
        return value;
    }

    static DzAPI_Map_CommentTotalCount1(whichPlayer: player, id: number): number {


        return RequestExtraIntegerData(52, whichPlayer, null, null, false, id, 0, 0);
    }

    static DzAPI_Map_StoreReal(whichPlayer: player, key: string, value: number): void {


        key = "R" + key;
        DzAPI_Map_SaveServerValue(whichPlayer, key, R2S(value));
        key = null;
        whichPlayer = null;
    }

    static DzAPI_Map_GetStoredReal(whichPlayer: player, key: string): number {

        let value: number;

        key = "R" + key;
        value = S2R(DzAPI_Map_GetServerValue(whichPlayer, key));
        key = null;
        whichPlayer = null;
        return value;
    }

    static DzAPI_Map_StoreBoolean(whichPlayer: player, key: string, value: boolean): void {


        key = "B" + key;
        if ((value))
            DzAPI_Map_SaveServerValue(whichPlayer, key, "1");
        else
            DzAPI_Map_SaveServerValue(whichPlayer, key, "0");
        key = null;
        whichPlayer = null;
    }

    static DzAPI_Map_GetStoredBoolean(whichPlayer: player, key: string): boolean {

        let value: boolean;

        key = "B" + key;
        key = DzAPI_Map_GetServerValue(whichPlayer, key);
        if ((key == "1"))
            value = true;
        else
            value = false;
        key = null;
        whichPlayer = null;
        return value;
    }

    static DzAPI_Map_StoreString(whichPlayer: player, key: string, value: string): void {


        key = "S" + key;
        DzAPI_Map_SaveServerValue(whichPlayer, key, value);
        key = null;
        whichPlayer = null;
    }

    static DzAPI_Map_GetStoredString(whichPlayer: player, key: string): string {


        return DzAPI_Map_GetServerValue(whichPlayer, "S" + key);
    }

    static DzAPI_Map_StoreStringEX(whichPlayer: player, key: string, value: string): void {


        key = "S" + key;
        RequestExtraBooleanData(39, whichPlayer, key, value, false, 0, 0, 0);
        key = null;
        whichPlayer = null;
    }

    static DzAPI_Map_GetStoredStringEX(whichPlayer: player, key: string): string {


        return RequestExtraStringData(38, whichPlayer, "S" + key, null, false, 0, 0, 0);
    }

    static DzAPI_Map_GetStoredUnitType(whichPlayer: player, key: string): number {

        let value: number;

        key = "I" + key;
        value = S2I(DzAPI_Map_GetServerValue(whichPlayer, key));
        key = null;
        whichPlayer = null;
        return value;
    }

    static DzAPI_Map_GetStoredAbilityId(whichPlayer: player, key: string): number {

        let value: number;

        key = "I" + key;
        value = S2I(DzAPI_Map_GetServerValue(whichPlayer, key));
        key = null;
        whichPlayer = null;
        return value;
    }

    static DzAPI_Map_FlushStoredMission(whichPlayer: player, key: string): void {


        DzAPI_Map_SaveServerValue(whichPlayer, key, null);
        key = null;
        whichPlayer = null;
    }

    static DzAPI_Map_Ladder_SubmitIntegerData(whichPlayer: player, key: string, value: number): void {


        DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value));
    }

    static DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer: player, key: string, value: number): void {


        if ((value == 0)) {
        }
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value));
    }

    // static DzAPI_Map_Stat_SubmitUnitData(whichPlayer: player, key: string, value: unit): void {
    //
    //
    //     DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer, key, GetUnitTypeId(value));
    // }

    static DzAPI_Map_Ladder_SubmitAblityIdData(whichPlayer: player, key: string, value: number): void {


        if ((value == 0)) {
        }
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,"0")
        else
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, I2S(value));
    }

    static DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer: player, key: string, value: number): void {

        let S: string;

        if ((value == 0))
            S = "0";
        else {
            S = I2S(value);
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, S);
        }
        //call DzAPI_Map_Ladder_SetStat(whichPlayer,key,S)
        S = null;
        whichPlayer = null;
    }

    // static DzAPI_Map_Ladder_SubmitItemData(whichPlayer: player, key: string, value: item): void {
    //
    //
    //     DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer, key, GetItemTypeId(value));
    // }

    static DzAPI_Map_Ladder_SubmitBooleanData(whichPlayer: player, key: string, value: boolean): void {


        if ((value))
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, "1");
        else
            DzAPI_Map_Ladder_SetStat(whichPlayer, key, "0");
    }

    static DzAPI_Map_Ladder_SubmitTitle(whichPlayer: player, value: string): void {


        DzAPI_Map_Ladder_SetStat(whichPlayer, value, "1");
    }

    static DzAPI_Map_Ladder_SubmitPlayerRank(whichPlayer: player, value: number): void {


        DzAPI_Map_Ladder_SetPlayerStat(whichPlayer, "RankIndex", I2S(value));
    }

    static DzAPI_Map_Ladder_SubmitPlayerExtraExp(whichPlayer: player, value: number): void {


        DzAPI_Map_Ladder_SetStat(whichPlayer, "ExtraExp", I2S(value));
    }

    static DzAPI_Map_PlayedGames(whichPlayer: player): number {


        return RequestExtraIntegerData(45, whichPlayer, null, null, false, 0, 0, 0);
    }

    static DzAPI_Map_CommentCount(whichPlayer: player): number {


        return RequestExtraIntegerData(46, whichPlayer, null, null, false, 0, 0, 0);
    }

    static DzAPI_Map_FriendCount(whichPlayer: player): number {


        return RequestExtraIntegerData(47, whichPlayer, null, null, false, 0, 0, 0);
    }

    static DzAPI_Map_IsConnoisseur(whichPlayer: player): boolean {


        return RequestExtraBooleanData(48, whichPlayer, null, null, false, 0, 0, 0);
    }

    static DzAPI_Map_IsBattleNetAccount(whichPlayer: player): boolean {


        return RequestExtraBooleanData(49, whichPlayer, null, null, false, 0, 0, 0);
    }

    static DzAPI_Map_IsAuthor(whichPlayer: player): boolean {


        return RequestExtraBooleanData(50, whichPlayer, null, null, false, 0, 0, 0);
    }

    static DzAPI_Map_CommentTotalCount(): number {


        return RequestExtraIntegerData(51, null, null, null, false, 0, 0, 0);
    }

    static DzAPI_Map_Statistics(whichPlayer: player, eventKey: string, eventType: string, value: number): void {


        RequestExtraBooleanData(34, whichPlayer, eventKey, "", false, value, 0, 0);
    }

    static DzAPI_Map_Returns(whichPlayer: player, label: number): boolean {


        return RequestExtraBooleanData(53, whichPlayer, null, null, false, label, 0, 0);
    }

    static DzAPI_Map_ContinuousCount(whichPlayer: player, id: number): number {


        return RequestExtraIntegerData(54, whichPlayer, null, null, false, id, 0, 0);
    }

// IsPlayer,                      //是否为玩家
    static DzAPI_Map_IsPlayer(whichPlayer: player): boolean {


        return RequestExtraBooleanData(55, whichPlayer, null, null, false, 0, 0, 0);
    }

// MapsTotalPlayed,               //所有地图的总游戏时长
    static DzAPI_Map_MapsTotalPlayed(whichPlayer: player): number {


        return RequestExtraIntegerData(56, whichPlayer, null, null, false, 0, 0, 0);
    }

// MapsLevel,                    //指定地图的地图等级
    static DzAPI_Map_MapsLevel(whichPlayer: player, mapId: number): number {


        return RequestExtraIntegerData(57, whichPlayer, null, null, false, mapId, 0, 0);
    }

// MapsConsumeGold,              //所有地图的金币消耗
    static DzAPI_Map_MapsConsumeGold(whichPlayer: player, mapId: number): number {


        return RequestExtraIntegerData(58, whichPlayer, null, null, false, mapId, 0, 0);
    }

// MapsConsumeLumber,            //所有地图的木材消耗
    static DzAPI_Map_MapsConsumeLumber(whichPlayer: player, mapId: number): number {


        return RequestExtraIntegerData(59, whichPlayer, null, null, false, mapId, 0, 0);
    }

// MapsConsumeLv1,               //消费 1-199
    static DzAPI_Map_MapsConsumeLv1(whichPlayer: player, mapId: number): boolean {


        return RequestExtraBooleanData(60, whichPlayer, null, null, false, mapId, 0, 0);
    }

// MapsConsumeLv2,               //消费 200-499
    static DzAPI_Map_MapsConsumeLv2(whichPlayer: player, mapId: number): boolean {


        return RequestExtraBooleanData(61, whichPlayer, null, null, false, mapId, 0, 0);
    }

// MapsConsumeLv3,               //消费 500~999
    static DzAPI_Map_MapsConsumeLv3(whichPlayer: player, mapId: number): boolean {


        return RequestExtraBooleanData(62, whichPlayer, null, null, false, mapId, 0, 0);
    }

// MapsConsumeLv4,               //消费 1000+
    static DzAPI_Map_MapsConsumeLv4(whichPlayer: player, mapId: number): boolean {


        return RequestExtraBooleanData(63, whichPlayer, null, null, false, mapId, 0, 0);
    }

//获取论坛数据（0=累计获得赞数，1=精华帖数量，2=发表回复次数，3=收到的欢乐数，4=是否发过贴子，5=是否版主，6=主题数量）
    static DzAPI_Map_GetForumData(whichPlayer: player, whichData: number): number {


        return RequestExtraIntegerData(65, whichPlayer, null, null, false, whichData, 0, 0);
    }

    static DzAPI_Map_OpenMall(whichPlayer: player, whichkey: string): boolean {


        return RequestExtraBooleanData(66, whichPlayer, whichkey, null, false, 0, 0, 0);
    }

    static DzAPI_Map_GameResult_CommitData(whichPlayer: player, key: string, value: string): void {


        RequestExtraIntegerData(69, whichPlayer, key, value, false, 0, 0, 0);
    }


    static DzTriggerRegisterMallItemSyncData(trig: trigger): void {
        DzTriggerRegisterSyncData(trig, "DZMIA", true);
    }

    static DzGetTriggerMallItemPlayer(): player {
        return DzGetTriggerSyncPlayer();
    }

    static DzGetTriggerMallItem(): string {
        return DzGetTriggerSyncData();
    }


// //游戏结算
//     static DzAPI_Map_GameResult_CommitTitle(whichPlayer: player, value: string): void {
//
//
//         DzAPI_Map_GameResult_CommitData(whichPlayer, value, "1");
//         whichPlayer = null;
//         value = null;
//     }
//
//     static DzAPI_Map_GameResult_CommitPlayerRank(whichPlayer: player, value: number): void {
//
//
//         DzAPI_Map_GameResult_CommitData(whichPlayer, "RankIndex", I2S(value));
//         whichPlayer = null;
//         value = 0;
//     }
//
//     static DzAPI_Map_GameResult_CommitGameMode(value: string): void {
//
//
//         DzAPI_Map_GameResult_CommitData(GetLocalPlayer(), "InnerGameMode", value);
//         value = null;
//     }
//
//     static DzAPI_Map_GameResult_CommitGameResult(whichPlayer: player, value: number): void {
//
//
//         DzAPI_Map_GameResult_CommitData(whichPlayer, "GameResult", I2S(value));
//         whichPlayer = null;
//     }

}