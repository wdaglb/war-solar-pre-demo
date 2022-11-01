import DebugUtil from 'solar/util/debug/DebugUtil';
import BaseUtil from 'solar/util/BaseUtil';
import {Unit} from "./solar/w3ts/handles/unit";
import Gui from "./Gui";
import Log from 'solar/common/Log';
import {Easing, Tween} from "./solar/lib/tween";
import SyncUtil from 'solar/util/net/SyncUtil';
import {Frame} from "./solar/w3ts/handles/frame";
import ArchiveUtil from 'solar/util/archive/ArchiveUtil';
import AsyncUtil from 'solar/util/net/AsyncUtil';
import CameraUtil from 'solar/util/game/CameraUtil';
import InterpolationUtil from 'solar/util/math/InterpolationUtil';
import Vector3 from 'solar/lib/mod/Vector3';
import SolarDamageState from 'solar/atrribute/SolarDamageState';
import TextTagUtil from 'solar/util/text/TextTagUtil';
import DebugCheckSyncUtil from "./solar/util/debug/DebugCheckSyncUtil";


export default class AppTest {

    constructor() {
        if (isDebug) {
            se.playerChat("se", () => {
                this.seTest();
            })
            se.playerChat("cs", () => {
                DebugCheckSyncUtil.start()
            })


            this.solarTest();
            //
            SolarDamageState.config.damageEventHandlers.push(event => {
                if (!event.isCritical) {
                    return
                }
                //漂浮文字
                let tag = "暴击:"
                if (!event.isPhysical) {
                    tag = "法术" + tag;
                }
                TextTagUtil.textOnUnit(event.unit0, tag + Math.floor(event.resultDamage), 200, 20, 200)
            })

        }
    }

    onUnitAttacked(triggerUnit: unit, attacker: unit) {
        BJDebugMsg("触发单位=" + GetUnitName(triggerUnit))
        BJDebugMsg("攻击单位=" + GetUnitName(attacker))
    }

    //   se : SolarEvent (太阳事件总线)
    seTest() {
        se.unitAttacked((...args) => {
            this.onUnitAttacked(...args);
        })
        se.unitAttacked((triggerUnit, attacker) => {
            BJDebugMsg("被攻击单位2222=" + GetUnitName(triggerUnit))
            BJDebugMsg("攻击单位2222=" + GetUnitName(attacker))
        })
        se.unitDeath((triggerUnit, xs) => {
            BJDebugMsg("死亡单位=" + GetUnitName(triggerUnit))
            BJDebugMsg("凶手单位=" + GetUnitName(xs))
        })
        se.enterRect(null, u => {
            BJDebugMsg("进入区域了=" + GetUnitName(u))
        })
        se.unitDamaged((t, u, d) => {
            BJDebugMsg("受伤单位=" + GetUnitName(t))
            BJDebugMsg("伤害来源=" + GetUnitName(u))
            BJDebugMsg("伤害值=" + d)
        })

        se.unitPickupItem((triggerUnit, item, itemIdStr) => {
            BJDebugMsg("拾取物品的单位=" + GetUnitName(triggerUnit))
            BJDebugMsg("物品名称=" + GetItemName(item))
            BJDebugMsg("物品id=" + itemIdStr)
            DisableTrigger(GetTriggeringTrigger())
        })

    }

    /**
     * 更多测试 可在太阳基础TS仓库下的 test文件夹找到
     */
    solarTest() {
        se.playerChat("1", () => {
            DebugUtil.showText(BaseUtil.getGameTime() + "")
            let unit = new Unit(0, "hpea", 0, 0, 0)
            SetUnitState(unit.handle, ConvertUnitState(0x12), 500 + GetUnitState(GetTriggerUnit(), ConvertUnitState(0x12)) * 100)
            print_r(handledef(unit.handle).reference)
            DebugUtil.printLocalVars();
            this.uiTest();
        })
        // this.hookTest();
        //test http
        this.httpJsonTest();

        DebugUtil.onChat("2", () => {
            this.archiveTest();
        });

        this.w2sTest()
        //
        DebugUtil.onChat("4", () => {
            let sTimer = BaseUtil.onTimer(1, (c) => {
                BJDebugMsg("太阳计时器循环执行:" + c)
                return true;
            })

            BaseUtil.runLater(5, () => {
                BJDebugMsg("手动关闭太阳计时器循环执行:" + sTimer)
                sTimer.destroy();
            })
        });
    }

    w2sTest() {
        se.playerChat("3", () => {
            DebugUtil.showText(BaseUtil.getGameTime() + "测试世界坐标转屏幕坐标")
            let unit = new Unit(0, "Hamg", 0, 0, 0)
            BaseUtil.onTimer(0.05, c => {
                let screenCoordinates = CameraUtil.getScreenCoordinates(unit.x, unit.y);
                // @ts-ignore
                log.debug("sc=" + JSON.stringify(screenCoordinates))
                if (screenCoordinates.x < 0 || screenCoordinates.x > 0.8) {
                    return true;
                }
                if (screenCoordinates.y < 0 || screenCoordinates.y > 0.6) {
                    return true;
                }
                let frame = Frame.createBackDrop();
                frame.setTexture("ReplaceableTextures\\Selection\\SelectionCircleSmall.blp")
                frame.setSize(0.04, 0.04)
                screenCoordinates.x -= 0.02
                frame.setAbsPoint(FRAMEPOINT_TOPLEFT, screenCoordinates.x, screenCoordinates.y)

                let toX = 0;
                let toY = 0;
                const tween = new Tween({...screenCoordinates, p: 0, s: 0.04})
                    .to({x: toX, y: toY, p: 1, s: 0}, 2000)
                    .easing(Easing.Quadratic.Out) //
                    .onUpdate((temp) => {
                        //贝塞尔插值
                        let position = InterpolationUtil.bezier(temp.p,
                            new Vector3(screenCoordinates.x, screenCoordinates.y),
                            new Vector3(0, 0),
                            new Vector3(0, 0.8),
                            new Vector3(0.6, 0.8),
                            new Vector3(0.6, 0),
                            new Vector3(0, 0),
                            new Vector3(0, 0.8),
                            new Vector3(0.6, 0.8),
                            new Vector3(0.6, 0)
                        );

                        frame.setAbsPoint(FRAMEPOINT_TOPLEFT, position.x, position.y)
                        frame.setSize(temp.s, temp.s)
                    });
                //
                tween.start()
                return true;
            })
        })
    }


    uiTest() {
        let frame = Frame.createTEXTBUTTON();
        frame.setText("测试Frame按钮")
        frame.addBackgroundImage("ReplaceableTextures\\Selection\\SelectionCircleSmall.blp")
        frame.setSize(0.1, 0.2)
        frame.setAbsPoint(FRAMEPOINT_BOTTOMLEFT, 0.1, 0.2)
        frame.setOnClick(() => {
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0,
                20, "测试Frame按钮 点击了！")
        });
        //
        SyncUtil.onSyncData("gui_test", p => {
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0,
                20, '接收到数据同步！触发的玩家为:' + GetPlayerName(p))
        })
        AsyncUtil.run(() => {//异步执行
            new Gui();
        })
        // new Gui();
    }

    hookTest() {
        print(log.path)
        let jassCreateUnit = CreateUnit;
        _G.CreateUnit = function (this: void, id: player, unitid: number | string, x: number, y: number, face: number): unit {
            let info = "你创建了单位id:" + GetPlayerId(id) + " unitid=" + unitid + " x,y=" + x + "," + y
            print(info)
            log.info(info)
            //禁用日志写文件
            Log.enable = false
            return jassCreateUnit(id, unitid, x, y, face)
        }
        let jassRemoveItem = RemoveItem;
        _G.RemoveItem = function (this: void, whichItem: item): void {
            let info = "移除了物品:" + GetItemName(whichItem) + " handle=" + whichItem;
            print(info)
            log.info(info)
            //禁用日志打印
            // Log.enablePrint = false
            jassRemoveItem(whichItem)
        }
    }

    archiveTest() {

        //
        let key = "key值也占用存档空间,推荐短命名比如a1,B2,C34,以及中文"
        let av = ArchiveUtil.get(Player(0), key);
        if (av) {
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, '从存档拉出的数据是:' + av);
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60,
                '从存档读对象表:' + ArchiveUtil.get(Player(0), "我存个对象").套娃.a);
        } else {
            ArchiveUtil.set(Player(0), key,
                "哈哈我使劲存啊，把存档占满，不用白不用！！！！，布尔值可存0跟1以节省空间。我这里其实可以存超过64个长度的字符串啊 最大可存1.9W个字符")
            ArchiveUtil.set(Player(0), "我存个对象",
                {"存个整数": 1, "存个布尔": true, "存个字符": "a", "套娃": {"a": "我是对象里的对象的套娃a数据"}})
        }
    }


    httpJsonTest() {
        se.playerChat("tj", () => {
            // @ts-ignore
            let result: any = JSON.stringify({a: [1, {b: 2}]})
            DebugUtil.showText(BaseUtil.getGameTime() + "[对象转Json字符串=]" + result)
            // @ts-ignore
            result = JSON.parse('{"a":[1,{"b":2}]}')
            DebugUtil.showText(BaseUtil.getGameTime() + "[Json字符串转对象=]" + result)
            print_r(result)
            let a: any[] = result['a']
            DebugUtil.showText(BaseUtil.getGameTime() + "[Json字符串转对象a[0]=]" + a[0])
            DebugUtil.showText(BaseUtil.getGameTime() + "[Json字符串转对象a[1][\"b\"]=]" + a[1]["b"])
            //test http
            // HttpRequest("www.baidu.com", "", httpResponseData => {
            //     DebugUtil.showText("http请求响应报文数据=" + httpResponseData)
            // });
        })
    }

}