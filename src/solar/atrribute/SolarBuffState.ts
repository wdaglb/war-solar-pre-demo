/**
 * 太阳Buff系统 调度中心
 *
 */
import {Trigger} from "solar/w3ts/handles/trigger";
import BuffUtil from "solar/util/system/BuffUtil";
import ObjectPool from "../tool/ObjectPool";
import {Frame} from "solar/w3ts/handles/frame";
import SelectUtil from "solar/util/unit/SelectUtil";
import Buff from "../tool/Buff";
import ColorStr from "../constant/ColorStr";
import DataBase from "../common/DataBase";
import AttributeUtil from "solar/util/system/AttributeUtil";
import UnitAttributeState from "./UnitAttributeState";
import SingletonUtil from "../util/lang/SingletonUtil";


export default class SolarBuffState {
    static config: {
        showSolarBuffUI //显示太阳buff UI
    } = {
        showSolarBuffUI: true
    }

    /**
     * 模拟buff的 ui显示
     */
    static objectPool = new ObjectPool<Frame[]>(() => {
        let frame = Frame.createBUTTON();
        let backgroundImage = frame.addBackgroundImage("");
        frame.setOnMouseEnter(SolarBuffState.showUbertip)
        frame.setOnMouseLeave(SolarBuffState.hideUbertip)
        frame.setSize(0.015, 0.015)
        return [frame, backgroundImage];
    });
    static frameBuffMap: { [frameId: string]: Buff } = {}
    static ubertipFrameBD: Frame = null;
    static ubertipFrameText: Frame = null;

    constructor() {
        if (SingletonUtil.notFirstTime(SolarBuffState)) {
            print("不能重复new SolarBuffState()")
            return;
        }
        /**buff 属性更新到单位属性*/
        let trigger2 = new Trigger();
        trigger2.registerTimerEvent(0.83, true)
        trigger2.addAction(() => {
            //遍历所有
            DataBase.forUnitSolarDatas((u, solarData: AppData) => {
                SolarBuffState.refreshBuffAtrributes2UnitSolarAtrribute(u)
            })
        });

        // buff ui显示
        if (SolarBuffState.config.showSolarBuffUI) {
            SolarBuffState.ubertipFrameBD = new Frame("BACKDROP", null, null, "_sl_border_backdrop", 0)
            //
            SolarBuffState.ubertipFrameText = Frame.createTEXT()
            SolarBuffState.ubertipFrameText.setAbsPoint(FRAMEPOINT_BOTTOMRIGHT, 0.78, 0.17)
            SolarBuffState.ubertipFrameText.setSize(0.16, 0)


            SolarBuffState.ubertipFrameBD.setPoints(SolarBuffState.ubertipFrameText.current, 0.01, 0.01);
            // SolarBuffState.ubertipFrameBD.setTexture("UI\\Glues\\BattleNet\\BattleNetTeamLevelBar\\Loading-BarBackground.blp")
            SolarBuffState.ubertipFrameBD.visible = false;
            SolarBuffState.ubertipFrameText.visible = false;

            //
            let trigger = new Trigger();
            trigger.registerTimerEvent(0.1, true);
            trigger.addAction(this.refreshSolarBuffUI)
        }

    }

    static showUbertip(this: void) {
        let frameH = DzGetTriggerUIEventFrame();
        let buff = SolarBuffState.frameBuffMap["f" + frameH];
        if (buff) {
            let buffTips = ColorStr.yellow + buff.getName() + "|n|n" + ColorStr.green + "Buff层数: " + buff.stackCount + "|n|n" + ColorStr.white + buff.getUbertip()
            SolarBuffState.ubertipFrameText.setText(buffTips)
            SolarBuffState.ubertipFrameBD.visible = true;
            SolarBuffState.ubertipFrameText.visible = true;
        }
    }

    static hideUbertip(this: void) {
        SolarBuffState.ubertipFrameBD.visible = false;
        SolarBuffState.ubertipFrameText.visible = false;
    }

    /**
     * 更新太阳buff
     */
    refreshSolarBuffUI(this: void) {
        let realSelectUnit = SelectUtil.getRealSelectUnit();
        if (!IsHandle(realSelectUnit)) {
            SolarBuffState.showBuffsUI(false);
            return;
        }


        let unitBuffs = BuffUtil.getUnitBuffs(realSelectUnit);
        if (!unitBuffs) {
            SolarBuffState.showBuffsUI(false);
            return;
        }
        //
        let objectPool = SolarBuffState.objectPool;
        objectPool.setAllIdleStatus(true);//设置对象池所有 ui为 空闲可使用状态
        let index = 0;
        for (let buffTypeId in unitBuffs) {
            let buff = unitBuffs[buffTypeId];
            if (buff.buffType.class && buff.buffType.class != "基础") {
                continue;//不是基础类型的其他类型则不在这里显示
            }
            let frames = objectPool.borrowObject();
            let frame = frames[0];
            frame.visible = true
            frames[1].setTexture(buff.buffType.art)
            frame.setAbsPoint(FRAMEPOINT_BOTTOMLEFT, 0.37 + (index * 0.016), 0.007)
            //绑定ui跟 buff
            SolarBuffState.frameBuffMap["f" + frame.current] = buff;
            index++;
        }

        objectPool.forDirtyObjects(frames => {
            frames[0].visible = false;
        })


    }

    /**
     * UI显示
     */
    static showBuffsUI(show: boolean) {
        SolarBuffState.objectPool.forActiveObjects(frames => {
            frames[0].visible = show;
        });
    }


    /**
     *
     */
    /**
     * 刷新单位携带的buff的属性值 附加到 单位属性中
     * @param unitHandle
     */
    static refreshBuffAtrributes2UnitSolarAtrribute(unitHandle: unit) {
        let atrributes: AppAttribute[] = BuffUtil.getUnitBuffAttributes(unitHandle);
        let unitOldBuffsAttr: AppAttribute = DataBase.getUnitSolarData(unitHandle, false)?._SL_totalBuffsSolarAtrribute;
        if (unitOldBuffsAttr == null) {//如果之前没有旧buff属性 则退出后续逻辑  否则还需将之前的旧属性 移除
            if (atrributes == null || atrributes.length == 0) {
                return
            }
        }
        let totalAtrribute: SolarAtrribute = AttributeUtil.sumAtrributes(atrributes);

        /**
         dmg system
         */
        let solarData = DataBase.getUnitSolarData(unitHandle);
        if (!solarData._SL_solarAtrribute) {
            solarData._SL_solarAtrribute = {}
        }

        AttributeUtil.subtract(solarData._SL_solarAtrribute, unitOldBuffsAttr);
        AttributeUtil.add(solarData._SL_solarAtrribute, totalAtrribute);

        solarData._SL_totalBuffsSolarAtrribute = totalAtrribute;
        //发送属性改变事件
        UnitAttributeState.refreshUnitSolarAtrribute(unitHandle)
    }

}