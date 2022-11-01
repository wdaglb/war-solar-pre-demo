local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 7,["13"] = 7,["14"] = 7,["16"] = 7,["17"] = 17,["18"] = 17,["19"] = 17,["21"] = 18,["22"] = 18,["23"] = 18,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 22,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 29,["39"] = 29,["40"] = 29,["42"] = 29,["43"] = 30,["44"] = 31,["46"] = 33,["47"] = 34,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["52"] = 35,["53"] = 35,["54"] = 35,["55"] = 35,["56"] = 36,["57"] = 28,["58"] = 28,["59"] = 17,["60"] = 45,["61"] = 46,["62"] = 47,["63"] = 48,["64"] = 45,["65"] = 7});
local ____exports = {}
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____AsyncUtil = require("solar.util.net.AsyncUtil")
local AsyncUtil = ____AsyncUtil.default
____exports.default = __TS__Class()
local ExFrameApiUtil = ____exports.default
ExFrameApiUtil.name = "ExFrameApiUtil"
function ExFrameApiUtil.prototype.____constructor(self)
end
function ExFrameApiUtil.setUnitMapHeadPortrait(self, unit, head_pic_path, picSize)
    if picSize == nil then
        picSize = 0.01
    end
    local head_ui = DzCreateFrameByTagName(
        "BACKDROP",
        "ExFrameApiUtil_" .. tostring(AsyncUtil:getUUIDAsync()),
        DzGetGameUI(),
        "template",
        0
    )
    DzFrameSetSize(head_ui, picSize, picSize)
    DzFrameSetTexture(head_ui, head_pic_path, 0)
    local width = GetRectWidthBJ(GetPlayableMapRect())
    local height = GetRectHeightBJ(GetPlayableMapRect())
    local w = 0.112 / width
    local h = 0.113 / height
    DataBase:getUnitSolarData(unit)._sl_head_ui = head_ui
    return BaseUtil.onTimer(
        0.1,
        function()
            local ____DataBase_getUnitSolarData_result__sl_head_ui_0 = DataBase:getUnitSolarData(unit, false)
            if ____DataBase_getUnitSolarData_result__sl_head_ui_0 ~= nil then
                ____DataBase_getUnitSolarData_result__sl_head_ui_0 = ____DataBase_getUnitSolarData_result__sl_head_ui_0._sl_head_ui
            end
            if ____DataBase_getUnitSolarData_result__sl_head_ui_0 == nil then
                DzDestroyFrame(head_ui)
                return false
            end
            local x = GetUnitX(unit) * w
            local y = GetUnitY(unit) * h
            DzFrameSetPoint(
                head_ui,
                4,
                DzFrameGetMinimap(),
                4,
                x,
                y
            )
            return true
        end
    )
end
function ExFrameApiUtil.createBaseFrameInSimpleFrame(self, parentSimpleFrame)
    local uuid = AsyncUtil:getUUIDAsync()
    DzCreateSimpleFrame("_sl_simpleframe_and_frame", parentSimpleFrame, uuid)
    return DzFrameFindByName("_sl_simpleframe_and_frame_frame", uuid)
end
____exports.default = ExFrameApiUtil
return ____exports
