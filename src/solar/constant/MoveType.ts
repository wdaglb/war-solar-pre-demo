enum MoveType {
    /**没有， 无视碰撞 */none = "none",
    /**步行， 地面碰撞跟寻路  */foot = "foot",
    /**骑马  */horse = "horse",
    /**飞行  具有飞行视野，寻路能穿越树木跟悬崖，可以直接设置飞行高度 不用乌鸦形态了 */fly = "fly",
    /**浮空  不会踩中地雷 */hover = "hover",
    /**漂浮 只能在深水里活动 不能在地面活动 */float = "float",
    /**两栖 */amph = "amph",
    /**未知 自己测试 */unbuild = "unbuild",
}

export default MoveType