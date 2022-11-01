/** @noSelf **/
import CodecUtil from "../math/CodecUtil";
import BaseUtil from "../BaseUtil";
import {MapPlayer} from "solar/w3ts/handles/player";

/**
 将存档key 与存档值 作为Json字符串 统一存储到平台服务器上
 因此请尽量减少key的长度 以多存内容

 修改玩家名之后将导致存档失效

 已被占用的key: _SL  _SH _SI//用作存储存档玩家的地图等级 玩家名字哈希 和玩家账号id 防止盒子佬一键复制别人的存档
 */
export default class ArchiveUtil {
    //加密 请在地图发布前就确定是否需要加密以及加密的方式。发布后不能更改此选项 否则会造成旧存档被清空
    static encrypt: boolean = true;
    static verifyPlayerName: boolean = !isDebug;
    static ArchiveKeyCountMax: number = 150;
    static salt: string = "s_z_b_s_q_j";
    static baseArchiveKeyPrefix: string = "Solar_Base_Archive_";
    //
    static playerDatas: { [playerIndex: string]: { [key: string]: any } } = {}


    /**
     * 获取玩家地图存档 没有则返回null
     * @param whichPlayer
     * @param key
     * @param mapLevelLimit 地图等级限制（当玩家地图等级小于此数字时返回null）
     */
    static get(whichPlayer: player, key: string, mapLevelLimit: number = 0) {
        ArchiveUtil._init0();
        if (mapLevelLimit > 0 && DzAPI_Map_GetMapLevel(whichPlayer) < mapLevelLimit) {
            return null;
        }
        let data = ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            return null;
        }
        return data[key];
    }

    /**
     * 保存玩家的一个存档
     * @param whichPlayer
     * @param key
     * @param value
     * @param isSaveAll 是否立即上传到服务器存档(批量设置值时可以先填false 最后再统一上传 节省一丝性能)
     */
    static set(whichPlayer: player, key: string, value: any, isSaveAll: boolean = true) {
        ArchiveUtil._init0();
        let data = ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            data = {}
            ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = data;
        }
        data[key] = value;
        if (isSaveAll) {
            ArchiveUtil.saveAll(whichPlayer)
        }
    }

    /**
     *获取所有存档
     */
    static getAllArchive(whichPlayer: player): any {
        ArchiveUtil._init0();
        return ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
    }

    /**
     * 打印某个玩家的所有存档 调试时用
     * @param whichPlayer
     */
    static printAllArchive(whichPlayer: player): void {
        ArchiveUtil._init0();
        let data = ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            return;
        }
        print("========打印玩家" + (GetPlayerId(whichPlayer) + 1) + "的存档 开始========")
        for (let dataKey in data) {
            print(dataKey + "=[" + data[dataKey] + "]")
        }
        print("========打印玩家" + (GetPlayerId(whichPlayer) + 1) + "的存档 结束========")
    }

    /**
     * 清空所有存档
     */
    static clearAllArchive(whichPlayer: player): void {
        for (let i = 0; i < ArchiveUtil.ArchiveKeyCountMax; i++) {
            let key: string = ArchiveUtil.baseArchiveKeyPrefix + i;
            DzAPI_Map_FlushStoredMission(whichPlayer, key);
        }
        print("已清理全部存档!")
    }

    /**
     * 保存玩家的所有存档数据
     */
    static saveAll(whichPlayer: player): void {
        let data = ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            data = {}
            ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = data;
        }
        //设置地图等级 以作存档验证  _SI
        data._SL = DzAPI_Map_GetMapLevel(whichPlayer);
        data._SH = StringHash(GetPlayerName(whichPlayer));
        data._SI = MapPlayer.fromHandle(whichPlayer).userId;

        let dataJsonStr: string = JSON.stringify(data);
        if (ArchiveUtil.encrypt) {
            dataJsonStr = CodecUtil.saesEncode(dataJsonStr, gameName + ArchiveUtil.salt)
        }
        let dataJsonStrLength = dataJsonStr.length;
        let keyLength = math.floor(dataJsonStrLength / 64) + 1;
        log.debug("玩家" + GetPlayerId(whichPlayer) + "的存档栏位大小为:" + keyLength)
        if (keyLength > ArchiveUtil.ArchiveKeyCountMax) {
            log.errorWithTraceBack("存档栏位大小超过" + ArchiveUtil.ArchiveKeyCountMax + "！" + keyLength)
            return;
        }
        for (let i = 0; i < keyLength; i++) {
            let endIndex = (i + 1) * 64;
            if (endIndex > dataJsonStrLength) {
                endIndex = dataJsonStrLength;
            }
            let oneData = dataJsonStr.substring(i * 64, endIndex)
            let key: string = ArchiveUtil.baseArchiveKeyPrefix + i;
            DzAPI_Map_SaveServerValue(whichPlayer, key, oneData);
        }
        //清空后一个存档栏位 以标记结束
        let key: string = ArchiveUtil.baseArchiveKeyPrefix + keyLength;
        DzAPI_Map_FlushStoredMission(whichPlayer, key);
    }


    /**
     * 初始化存档数据
     * @private
     */
    private static isInit = false;

    private static _init0(): boolean {
        if (ArchiveUtil.isInit) {
            return true;
        }
        ArchiveUtil.isInit = true;
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);

            if (GetPlayerController(tempPlayer) == MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                ArchiveUtil.playerDatas["P" + i] = ArchiveUtil._init0_onePlayer(tempPlayer);

            }
        }
        return true;
    }

    private static _init0_onePlayer(tempPlayer: player) {
        let data: any = {};
        let i = GetPlayerId(tempPlayer);
        let dataJsonStr: string = "";
        for (let i = 0; i < ArchiveUtil.ArchiveKeyCountMax; i++) {
            let key: string = ArchiveUtil.baseArchiveKeyPrefix + i;
            let serverValue: string = DzAPI_Map_GetServerValue(tempPlayer, key);
            if (serverValue && serverValue.length > 0) {
                dataJsonStr = dataJsonStr + serverValue;
            } else {
                break;
            }
        }
        //转json了
        if (dataJsonStr.length < 2) {
            return {};
        }
        try {
            if (ArchiveUtil.encrypt) {
                dataJsonStr = CodecUtil.saesDecode(dataJsonStr, gameName + ArchiveUtil.salt)
            }
            data = JSON.parse(dataJsonStr);
            log.debug("玩家" + (i + 1) + ":的存档数据为:" + dataJsonStr)
            //验证存档
            if (DzAPI_Map_GetMapLevel(tempPlayer) < data._SL) {
                print("存档验证失败!默认使用空存档!")
                data = {}
                BaseUtil.runLater(1, () => {
                    CustomDefeatBJ(tempPlayer, "警告:存档验证失败C1！");
                })
            }
            //验证玩家名哈希
            let shTemp = StringHash(GetPlayerName(tempPlayer));
            let userId = MapPlayer.fromHandle(tempPlayer).userId;
            if (userId == -1) {
                //userId 还在获取同步中...
                const info = "提示:请不要再地图初始时获取存档！应当延迟执行存档逻辑!";
                // DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, info);
                print(info)
                print("请等待内置userId(用户id)同步完成！(为了解决玩家名更改后靠userId判断是否是自己的存档)")
                log.errorWithTraceBack(info)
            }
            //校验存档
            if (ArchiveUtil.verifyPlayerName && data._SH && data._SH != shTemp) {//如果玩家名哈希不一样  则说明玩家改名或则复制了别人的存档
                if (data._SI && data._SI > 0 && data._SI == userId) {//说明存档就是本玩家的
                    print("检测到玩家改名了！自动修正存档!")
                } else {
                    //存档有问题的玩家 自己清空存档并退出游戏
                    data = {}
                    DisplayTimedTextToPlayer(tempPlayer, 0, 0, 60, '存档验证失败!自动退出游戏!');
                    BaseUtil.runLater(1, () => {
                        CustomDefeatBJ(tempPlayer, "警告:存档验证失败C2！");
                    })
                }
            }
            //设置
            return data;
        } catch (e) {
            log.errorWithTraceBack("存档Json格式解析出错!")
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, '存档格式解析出错！');
            print("需要解析的Json字符串为[" + dataJsonStr + "]")
        }
        return data;
    }
}
