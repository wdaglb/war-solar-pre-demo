export default class EffectUtil {


    /**
     * 新建特效(创建到坐标)
     */
    static addSpecialEffect(modelName: string, x: number, y: number): effect {
        //判断游戏设置 是否关闭了特效显示
        if (settings.isEffectDisplay == false) {
            return AddSpecialEffect("", x, y)
        } else {
            return AddSpecialEffect(modelName, x, y)
        }
    }

    /**
     * 新建特效(创建到坐标) 并且销毁它 (显示其动画)
     */
    static addSpecialEffectAndDestroy(modelName: string, x: number, y: number): void {
        DestroyEffect(EffectUtil.addSpecialEffect(modelName, x, y));
    }

    /**
     * 新建特效(创建到单位)
     */
    static addSpecialEffectTarget(modelName: string, targetWidget: widget, attachPointName: string): effect {
        if (settings.isEffectDisplay == false) {
            return AddSpecialEffectTarget("", targetWidget, attachPointName)
        } else {
            return AddSpecialEffectTarget(modelName, targetWidget, attachPointName)
        }
    }

    /**
     * 新建特效(创建到单位) 并且销毁它 (显示其动画)
     */
    static addSpecialEffectTargetAndDestroy(modelName: string, targetWidget: widget, attachPointName: string): void {
        DestroyEffect(EffectUtil.addSpecialEffectTarget(modelName, targetWidget, attachPointName));
    }


}