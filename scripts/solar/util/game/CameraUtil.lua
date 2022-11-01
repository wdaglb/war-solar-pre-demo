local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 19,["12"] = 19,["13"] = 19,["15"] = 20,["16"] = 21,["17"] = 22,["19"] = 25,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 29,["24"] = 30,["25"] = 31,["26"] = 33,["27"] = 35,["28"] = 36,["29"] = 37,["30"] = 39,["31"] = 40,["32"] = 41,["33"] = 42,["34"] = 43,["35"] = 19,["36"] = 74,["37"] = 75,["38"] = 76,["39"] = 77,["42"] = 80,["44"] = 74,["45"] = 88,["46"] = 88,["47"] = 88,["49"] = 89,["50"] = 90,["51"] = 91,["54"] = 94,["56"] = 88,["57"] = 104,["58"] = 104,["59"] = 104,["61"] = 104,["62"] = 104,["64"] = 105,["65"] = 106,["66"] = 106,["67"] = 106,["68"] = 106,["69"] = 106,["71"] = 104,["72"] = 1});
local ____exports = {}
____exports.default = __TS__Class()
local CameraUtil = ____exports.default
CameraUtil.name = "CameraUtil"
function CameraUtil.prototype.____constructor(self)
end
function CameraUtil.getScreenCoordinates(self, x, y, z)
    if z == nil then
        z = 150
    end
    if isEmbedJapi then
        local sx, sy, ss = world_to_screen(x, y, z)
        return {x = sx, y = 0.6 - sy}
    end
    local y1 = GetCameraEyePositionY()
    local x1 = GetCameraEyePositionX()
    local z1 = GetCameraEyePositionZ()
    local w = (DzGetWindowWidth() - 20) / 2
    local h = DzGetWindowHeight() - 20
    local a = GetCameraField(ConvertCameraField(3)) * 180 / 3.141592653589793
    local b = 360 - GetCameraField(ConvertCameraField(2)) * 180 / 3.141592653589793
    y = y + z * (y - y1) / z1
    local sy = 0.3 * (y - y1 - z1 / math.tan(b + a / 2)) * math.sin(b + a / 2) / (z1 * math.sin(a / 2) * (math.sin(b) + math.cos(b) * (y - y1) / z1))
    sy = (sy - 0.3) * 1.66 + 0.3
    local sx = 0.4 * (x - x1) / w / (1 + 1 / ((y - y1) * (z1 / (y - y1) * math.tan(b) + 1) / (y - y1 - z1 / math.tan(b + a / 2)) - 1))
    local c = 235
    local d = 56 * c - 10500
    local sx1 = 0.03 * (w + b * c - d) / h
    sx = (sx + sx1) * 0.4 / sx1
    return {x = sx, y = sy}
end
function CameraUtil.setCameraHeight(self, height, whichPlayer)
    if whichPlayer then
        if GetLocalPlayer() == whichPlayer then
            SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, height, 0)
        end
    else
        SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, height, 0)
    end
end
function CameraUtil.moveCamera2xy(self, x, y, whichPlayer, duration)
    if duration == nil then
        duration = 0
    end
    if whichPlayer then
        if GetLocalPlayer() == whichPlayer then
            PanCameraToTimed(x, y, duration)
        end
    else
        PanCameraToTimed(x, y, duration)
    end
end
function CameraUtil.moveCamera2unit(self, unit, whichPlayer, duration)
    if whichPlayer == nil then
        whichPlayer = GetOwningPlayer(unit)
    end
    if duration == nil then
        duration = 0
    end
    if GetLocalPlayer() == whichPlayer then
        PanCameraToTimed(
            GetUnitX(unit),
            GetUnitY(unit),
            duration
        )
    end
end
____exports.default = CameraUtil
return ____exports
