/**
 * 游戏中心
 *
 * 用于管理游戏中的全局对象
 */
export default class GameCenter {
    private static isInit: boolean = false;
    private static allUnits: unit[] = [];


    /**
     * 获取地图所有单位
     */
    static getAllUnits(): unit[] {
        if (GameCenter.isInit) {
            return this.allUnits;
        }
        GameCenter.checkInit();
        return this.allUnits;
    }


    private static checkInit(): void {
        if (GameCenter.isInit) {
            return
        }

        let t: trigger = CreateTrigger()
        let r: region = CreateRegion()
        let world: rect = GetWorldBounds()

        RegionAddRect(r, world)
        TriggerRegisterEnterRegion(t, r, null)//实时增量更新
        TriggerAddAction(t, () => {
            GameCenter.allUnits.push(GetTriggerUnit());
        })

        let t2: trigger = CreateTrigger()
        TriggerRegisterTimerEvent(t2, 3, true)//每3秒全量更新
        TriggerAddAction(t, GameCenter.updateAllUnits);
        //
        GameCenter.updateAllUnits()
        GameCenter.isInit = true;
    }

    private static updateAllUnits(this: void): void {
        //
        GroupEnumUnitsInRect(tempGroup, bj_mapInitialPlayableArea, null);
        let allUnits = []
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(tempGroup)
            if (!IsHandle(unitHandle)) {
                break
            }
            allUnits.push(unitHandle)
            GroupRemoveUnit(tempGroup, unitHandle)
        }
        GameCenter.allUnits = allUnits;
    }
}