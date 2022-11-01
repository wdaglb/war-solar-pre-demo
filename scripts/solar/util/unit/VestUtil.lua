local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 7,["9"] = 7,["10"] = 7,["12"] = 7,["13"] = 15,["14"] = 15,["15"] = 15,["17"] = 15,["18"] = 15,["20"] = 15,["21"] = 15,["23"] = 15,["24"] = 15,["26"] = 15,["27"] = 15,["29"] = 16,["30"] = 17,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 18,["37"] = 18,["39"] = 20,["40"] = 20,["41"] = 20,["42"] = 20,["43"] = 20,["44"] = 20,["45"] = 20,["47"] = 22,["48"] = 23,["49"] = 25,["51"] = 28,["52"] = 29,["54"] = 31,["55"] = 32,["56"] = 33,["57"] = 34,["58"] = 35,["59"] = 35,["60"] = 35,["61"] = 35,["62"] = 36,["63"] = 37,["64"] = 37,["65"] = 37,["66"] = 38,["67"] = 37,["68"] = 37,["70"] = 41,["71"] = 15,["72"] = 7});
local ____exports = {}
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local VestUtil = ____exports.default
VestUtil.name = "VestUtil"
function VestUtil.prototype.____constructor(self)
end
function VestUtil.SunCreateVestByUnit(u, x, y, model, moveType, timer, player)
    if x == nil then
        x = GetUnitX(u)
    end
    if y == nil then
        y = GetUnitY(u)
    end
    if model == nil then
        model = ""
    end
    if moveType == nil then
        moveType = 0
    end
    if timer == nil then
        timer = 2
    end
    local mj
    if player then
        mj = CreateUnit(
            player,
            FourCC("hrdh"),
            x,
            y,
            0
        )
    else
        mj = CreateUnit(
            GetOwningPlayer(u),
            FourCC("hrdh"),
            x,
            y,
            GetUnitFacing(u)
        )
    end
    DzSetUnitModel(mj, model)
    if moveType == 1 then
        EXSetUnitMoveType(mj, 4)
    else
        EXSetUnitMoveType(mj, 0)
        ShowUnit(mj, false)
    end
    SetUnitPosition(mj, x, y)
    SetUnitMoveSpeed(mj, 0)
    SetUnitState(mj, UNIT_STATE_MAX_MANA, 99999)
    SetUnitState(mj, UNIT_STATE_MANA, 99999)
    UnitAddAbility(
        mj,
        FourCC("Aloc")
    )
    if timer > 0 then
        BaseUtil.runLater(
            timer,
            function()
                RemoveUnit(mj)
            end
        )
    end
    return mj
end
____exports.default = VestUtil
return ____exports
