//base
import GlobalVars from 'solar/common/GlobalVars';
// app imports
import AppTest from "./AppTest";
import StateInit from "./StateInit";
import StateConfigInit from "./StateConfigInit";
import BaseUtil from 'solar/util/BaseUtil';
//这里可传入的isDebug 布尔值为是否打开控制台日志方便开发，
//若不传值则自动推测当前地图是否为测试环境（在太阳编辑器打开此地图的机器测试 无太阳编辑器打开此地图的不测试）
GlobalVars.init()

export default class App {

    constructor() {

        //先打印一个文本 让我们知道已运行到了TS入口代码
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, 'TS:App!');


        /**
         * 地图脚本推荐由2部分组成
         * 1、数据 （推荐从xlsx编译获得）
         * 2、功能模块（通用的逻辑代码）
         * 通常每张图的数据都不一样 可由xlsx配置这些数据（物编、数值等）
         * 地图的功能模块逻辑通用性很强（请沉淀此部分代码）
         */
        //配置此地图的功能模块运转的数据 (可从xlsx表格编译获得)
        StateConfigInit();
        //启动此地图需要的功能模块 (推荐高内聚，低耦合的编码方式以沉淀这些逻辑代码)
        StateInit();
  
        //测试区
        new AppTest();

    }

}

// new App();
//如果初始化执行的触发报错提示不全 可换以下代码使用中心计时器延迟执行逻辑代码 以显示完整的报错堆栈信息
BaseUtil.runLater(0.01, () => {
    new App();
});