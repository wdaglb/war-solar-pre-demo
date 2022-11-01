/**
 * 选择器 工具
 */

import GroupUtil from "./GroupUtil";
import Cache from "solar/tool/Cache";
import GameCenter from "solar/common/GameCenter";
import DataBase from "../../common/DataBase";

/** @noSelf **/
export default class SelectUtil {
    static cache: Cache = new Cache()


    /**
     * 获取玩家的英雄
     * 会自动选择第一个玩家拥有的英雄单位 或使用玩家SolarData的hero属性为玩家指定一个英雄单位
     * @param playerIndex
     * @param clearCache
     */
    static getAnHero(playerIndex: number, clearCache = false): unit {
        let hero = DataBase.getPlayerSolarData(Player(playerIndex), false)?.hero;
        if (hero) {
            return hero;
        }
        if (clearCache) {
            SelectUtil.cache.remove("PlayerHero:" + playerIndex);
        }
        let cacheUnitHandle = SelectUtil.cache.get("PlayerHero:" + playerIndex, () => {
            //获取玩家一个英雄
            let group = GroupUtil.groupObjectPool.borrowObject();
            GroupEnumUnitsOfPlayer(group, Player(playerIndex), null);
            for (let i = 0; i <= 1000000; i++) {
                let unitHandle = FirstOfGroup(group)
                if (!IsHandle(unitHandle)) {
                    break
                }
                if (IsUnitType(unitHandle, UNIT_TYPE_HERO)
                    && GetHeroStr(unitHandle, false) > 1
                    && !IsUnitType(unitHandle, UNIT_TYPE_PEON)
                    && !IsUnitType(unitHandle, UNIT_TYPE_SUMMONED)
                    && !IsUnitIllusion(unitHandle)
                    && !IsUnitHidden(unitHandle)) {
                    GroupUtil.groupObjectPool.returnObject(group);
                    return unitHandle;
                }
                GroupRemoveUnit(group, unitHandle)
            }
            GroupUtil.groupObjectPool.returnObject(group);
            return null;
        })
        //todo 如果删除单位后  此handle可能是另一个新单位
        if (IsHandle(cacheUnitHandle)) {
            return cacheUnitHandle;
        }

        return null;
    }

    /**
     * 获取敌人
     * @param playerIndex
     */
    static getAnEnemy(playerIndex: number = 0): unit {
        let enemyUnits = SelectUtil.getAllEnemys(playerIndex);
        return enemyUnits[GetRandomInt(0, enemyUnits.length - 1)];
    }

    /**
     * 获取指定玩家的所有敌人
     * @param playerIndex
     */
    static getAllEnemys(playerIndex: number = 0): unit[] {
        let enemyUnits = []
        let allUnits = GameCenter.getAllUnits();
        let player = Player(playerIndex)
        for (let unit of allUnits) {
            if (IsUnitEnemy(unit, player) && GetUnitState(unit, UNIT_STATE_LIFE) >= 1) {
                enemyUnits.push(unit);
            }
        }
        return enemyUnits;
    }

    /**
     * 获取指定玩家的所有敌人个数
     * @param playerIndex
     */
    static getAllEnemysLength(playerIndex: number = 0): number {
        let allUnits = GameCenter.getAllUnits();
        let player = Player(playerIndex)
        let count = 0;
        for (let unit of allUnits) {
            if (IsUnitEnemy(unit, player) && GetUnitState(unit, UNIT_STATE_LIFE) >= 1) {
                count++;
            }
        }
        return count;
    }

    /**
     * 异步获取本地玩家选择的单位 没有选择 或 超过1个时返回null
     * 主要给模拟当前本地玩家选择单位的UI使用
     */
    static getRealSelectUnit() {
        if (isEmbedJapi) {
            return GetRealSelectUnit();
        }
        //
        GroupEnumUnitsSelected(_tempGroup, GetLocalPlayer(), null)
        let unit = FirstOfGroup(_tempGroup);
        if (!IsHandle(unit)) {
            return null
        }
        GroupRemoveUnit(_tempGroup, unit);
        if (IsHandle(FirstOfGroup(_tempGroup))) {//说明选择了2个单位
            return null
        }
        return unit;
    }

    /**
     * 遍历 单位 (可手动指定范围中心点x,y)周围的敌方单位
     */
    static forEnemyUnitsInRange(center: unit, radius: number, callback: (unit: unit) => void,
                                x = GetUnitX(center), y = GetUnitY(center)): void {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsInRange(group, x, y, radius, null);
        let myPlayer = GetOwningPlayer(center)
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }
            if (IsUnitEnemy(unitHandle, myPlayer)) {
                callback(unitHandle)
            }
            GroupRemoveUnit(group, unitHandle)
        }
        GroupUtil.groupObjectPool.returnObject(group);
    }

    /**
     * 遍历中心点x,y周围的所有单位
     */
    static forUnitsInRange(x: number, y: number, radius: number, callback: (unit: unit) => void): void {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsInRange(group, x, y, radius, null);
        GroupUtil.for(group, callback)
        GroupUtil.groupObjectPool.returnObject(group);
    }

    /**
     * 高效率的遍历地图所有单位
     * @param callback
     * @param unitType
     */
    static forAllAliveUnits(callback: (unit: unit) => void): void {
        let allUnits = GameCenter.getAllUnits();
        for (let unitHandle of allUnits) {
            if (GetUnitState(unitHandle, UNIT_STATE_LIFE) >= 1) {
                callback(unitHandle)
            }
        }
    }

    /**
     * 如果需要遍历有自定义值得单位 可以使用DataBase.forUnitSolarDatas()
     * @param callback
     * @param unitType
     */
    static forAllUnits(callback: (unit: unit) => void, unitType?: string): void {
        let allUnits = GameCenter.getAllUnits();
        if (unitType) {//如果指定类型存在 则按指定类型遍历
            let unitTypeNum = FourCC(unitType)
            for (let unitHandle of allUnits) {
                if (unitTypeNum == GetUnitTypeId(unitHandle)) {
                    callback(unitHandle)
                }
            }
        } else {
            for (let unitHandle of allUnits) {
                callback(unitHandle)
            }
        }
    }

    /**
     * 获取玩家所有单位
     * @param playerIndex
     * @param unitType
     */
    static getPlayerUnits(playerIndex: number, unitType: string): unit[] {
        let resultUnits = []
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsOfPlayer(group, Player(playerIndex), null)
        let unitTypeNum = FourCC(unitType)
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }
            if (unitTypeNum == GetUnitTypeId(unitHandle)) {
                resultUnits.push(unitHandle)
            }
            GroupRemoveUnit(group, unitHandle)
        }
        GroupUtil.groupObjectPool.returnObject(group);
        return resultUnits;
    }

    /**
     * 遍历玩家所有单位
     * @param callback
     * @param playerIndex
     * @param unitType 遍历指定单位类型 不传值则为所有类型
     */
    static forPlayerUnits(callback: (unit: unit) => void, playerIndex: number, unitType?: string) {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsOfPlayer(group, Player(playerIndex), null)
        if (unitType) {//如果指定类型存在 则按指定类型遍历
            let unitTypeNum = FourCC(unitType)
            for (let i = 0; i <= 1000000; i++) {
                let unitHandle = FirstOfGroup(group)
                if (!IsHandle(unitHandle)) {
                    break
                }
                if (unitTypeNum == GetUnitTypeId(unitHandle)) {
                    callback(unitHandle)
                }
                GroupRemoveUnit(group, unitHandle)
            }
        } else {
            GroupUtil.for(group, callback)
        }
        GroupUtil.groupObjectPool.returnObject(group);
    }


    /**
     * 遍历所有敌人 Enemy
     * whoseEnemy 谁的敌人 （默认遍历玩家1的敌人）
     * @param callback
     */
    static forAllEnemyUnits(callback: (unit: unit) => void, whoseEnemy: player = Player(0)): void {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsInRect(group, bj_mapInitialPlayableArea, null);
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }
            if (IsUnitEnemy(unitHandle, whoseEnemy)) {
                callback(unitHandle)
            }
            GroupRemoveUnit(group, unitHandle)
        }
        GroupUtil.groupObjectPool.returnObject(group);
    }


    /**
     *
     * 遍历本地玩家的当前镜头可见的单位
     * （可以模拟血条类似情况下使用）
     */
    static forLocalCameraUnits(inCameraUnitsCallback: (unit: unit) => void, outCameraUnitsCallback: (unit: unit) => void = null, frustumTop = 0.56, frustumBottom = 0.13, frustumLeft = 0, frustumRight = 0.8): void {
        if (!isEmbedJapi) {
            log.errorWithTraceBack("没有内置japi环境！")
            return
        }
        //左上位置
        const [minX, maxY] = screen_to_world(frustumLeft, 0.6 - frustumTop);
        //右上位置
        const [maxX, max2Y] = screen_to_world(frustumRight, 0.6 - frustumTop);
        //右下位置
        const [max2X, minY] = screen_to_world(frustumRight, 0.6 - frustumBottom);

        GroupClear(_tempGroup);
        GroupEnumUnitsInRect(_tempGroup, bj_mapInitialPlayableArea, null);
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(_tempGroup)
            if (!IsHandle(unitHandle)) {
                break
            }
            let x = GetUnitX(unitHandle);
            if (x > minX && x < maxX) {
                let y = GetUnitY(unitHandle);
                if (y > minY && y < maxY) {
                    inCameraUnitsCallback(unitHandle)
                    GroupRemoveUnit(_tempGroup, unitHandle)
                    continue;
                }
            }
            if (outCameraUnitsCallback) {
                outCameraUnitsCallback(unitHandle)
            }
            GroupRemoveUnit(_tempGroup, unitHandle)
        }
    }
}
