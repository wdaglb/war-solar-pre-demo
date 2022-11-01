local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 6,["14"] = 6,["15"] = 6,["17"] = 8,["23"] = 15,["25"] = 10,["26"] = 11,["34"] = 19,["41"] = 23,["48"] = 27,["55"] = 31,["62"] = 35,["69"] = 39,["76"] = 43,["83"] = 47,["90"] = 51,["97"] = 55,["104"] = 59,["111"] = 63,["114"] = 66,["115"] = 67,["116"] = 66,["117"] = 70,["118"] = 71,["119"] = 70,["120"] = 74,["121"] = 75,["122"] = 74,["123"] = 78,["124"] = 79,["125"] = 78,["126"] = 82,["127"] = 83,["128"] = 84,["130"] = 86,["132"] = 82,["133"] = 90,["134"] = 91,["135"] = 92,["137"] = 94,["139"] = 90,["140"] = 98,["141"] = 99,["142"] = 98,["143"] = 102,["144"] = 103,["145"] = 103,["146"] = 103,["147"] = 103,["148"] = 103,["149"] = 103,["150"] = 103,["151"] = 103,["152"] = 103,["153"] = 103,["154"] = 102,["155"] = 106,["156"] = 107,["157"] = 106,["158"] = 110,["159"] = 111,["160"] = 110,["161"] = 114,["162"] = 115,["163"] = 114,["164"] = 118,["165"] = 119,["166"] = 118,["167"] = 122,["168"] = 123,["169"] = 122,["170"] = 126,["171"] = 127,["172"] = 126,["173"] = 130,["174"] = 131,["175"] = 130,["176"] = 134,["177"] = 135,["178"] = 134,["179"] = 138,["180"] = 139,["181"] = 138,["182"] = 146,["183"] = 147,["184"] = 146,["185"] = 150,["186"] = 151,["187"] = 151,["188"] = 151,["189"] = 151,["190"] = 151,["191"] = 151,["192"] = 151,["193"] = 151,["194"] = 150,["195"] = 158,["196"] = 159,["197"] = 158,["198"] = 166,["199"] = 167,["200"] = 166,["201"] = 170,["202"] = 171,["203"] = 170,["204"] = 174,["205"] = 175,["206"] = 174,["207"] = 178,["208"] = 178,["209"] = 178,["211"] = 179,["212"] = 178,["213"] = 182,["214"] = 183,["215"] = 182,["216"] = 186,["217"] = 186,["218"] = 186,["220"] = 187,["221"] = 186,["222"] = 190,["223"] = 191,["224"] = 190,["225"] = 196,["226"] = 196,["227"] = 196,["228"] = 196,["230"] = 199,["231"] = 199,["232"] = 199,["234"] = 199,["236"] = 196,["237"] = 198,["242"] = 203,["251"] = 207,["253"] = 210,["254"] = 211,["264"] = 215,["266"] = 218,["267"] = 219,["272"] = 230,["273"] = 231,["274"] = 230,["275"] = 234,["276"] = 235,["277"] = 234,["278"] = 243,["279"] = 244,["280"] = 243,["281"] = 247,["282"] = 248,["283"] = 247,["284"] = 251,["285"] = 252,["286"] = 251,["287"] = 255,["288"] = 256,["289"] = 255,["290"] = 259,["291"] = 260,["292"] = 259,["293"] = 263,["294"] = 264,["295"] = 263});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____point = require("solar.w3ts.handles.point")
local Point = ____point.Point
____exports.Camera = __TS__Class()
local Camera = ____exports.Camera
Camera.name = "Camera"
function Camera.prototype.____constructor(self)
end
__TS__ObjectDefineProperty(
    Camera,
    "visible",
    {
        get = function(self)
            return IsCineFilterDisplayed()
        end,
        set = function(self, flag)
            DisplayCineFilter(flag)
        end
    }
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMinX",
    {get = function(self)
        return GetCameraBoundMinX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMinY",
    {get = function(self)
        return GetCameraBoundMinY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMaxX",
    {get = function(self)
        return GetCameraBoundMaxX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMaxY",
    {get = function(self)
        return GetCameraBoundMaxY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetX",
    {get = function(self)
        return GetCameraTargetPositionX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetY",
    {get = function(self)
        return GetCameraTargetPositionY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetZ",
    {get = function(self)
        return GetCameraTargetPositionZ()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeX",
    {get = function(self)
        return GetCameraEyePositionX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeY",
    {get = function(self)
        return GetCameraEyePositionY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeZ",
    {get = function(self)
        return GetCameraEyePositionZ()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyePoint",
    {get = function(self)
        return GetCameraEyePositionLoc()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetPoint",
    {get = function(self)
        return Point:fromHandle(GetCameraTargetPositionLoc())
    end}
)
function Camera.adjustField(self, whichField, offset, duration)
    AdjustCameraField(whichField, offset, duration)
end
function Camera.endCinematicScene(self)
    EndCinematicScene()
end
function Camera.forceCinematicSubtitles(self, flag)
    ForceCinematicSubtitles(flag)
end
function Camera.getMargin(self, whichMargin)
    return GetCameraMargin(whichMargin)
end
function Camera.pan(self, x, y, zOffsetDest)
    if not zOffsetDest then
        PanCameraTo(x, y)
    else
        PanCameraToWithZ(x, y, zOffsetDest)
    end
end
function Camera.panTimed(self, x, y, duration, zOffsetDest)
    if not zOffsetDest then
        PanCameraToTimed(x, y, duration)
    else
        PanCameraToTimedWithZ(x, y, zOffsetDest, duration)
    end
end
function Camera.reset(self, duration)
    ResetToGameCamera(duration)
end
function Camera.setBounds(self, x1, y1, x2, y2, x3, y3, x4, y4)
    SetCameraBounds(
        x1,
        y1,
        x2,
        y2,
        x3,
        y3,
        x4,
        y4
    )
end
function Camera.setCameraOrientController(self, whichUnit, xOffset, yOffset)
    SetCameraOrientController(whichUnit, xOffset, yOffset)
end
function Camera.setCineFilterBlendMode(self, whichMode)
    SetCineFilterBlendMode(whichMode)
end
function Camera.setCineFilterDuration(self, duration)
    SetCineFilterDuration(duration)
end
function Camera.setCineFilterEndColor(self, red, green, blue, alpha)
    SetCineFilterEndColor(red, green, blue, alpha)
end
function Camera.setCineFilterEndUV(self, minU, minV, maxU, maxV)
    SetCineFilterEndUV(minU, minV, maxU, maxV)
end
function Camera.setCineFilterStartColor(self, red, green, blue, alpha)
    SetCineFilterStartColor(red, green, blue, alpha)
end
function Camera.setCineFilterStartUV(self, minU, minV, maxU, maxV)
    SetCineFilterStartUV(minU, minV, maxU, maxV)
end
function Camera.setCineFilterTexMapFlags(self, whichFlags)
    SetCineFilterTexMapFlags(whichFlags)
end
function Camera.setCineFilterTexture(self, fileName)
    SetCineFilterTexture(fileName)
end
function Camera.setCinematicCamera(self, cameraModelFile)
    SetCinematicCamera(cameraModelFile)
end
function Camera.SetCinematicScene(self, portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
    SetCinematicScene(
        portraitUnitId,
        color,
        speakerTitle,
        text,
        sceneDuration,
        voiceoverDuration
    )
end
function Camera.setField(self, whichField, value, duration)
    SetCameraField(whichField, value, duration)
end
function Camera.setPos(self, x, y)
    SetCameraPosition(x, y)
end
function Camera.setRotateMode(self, x, y, radiansToSweep, duration)
    SetCameraRotateMode(x, y, radiansToSweep, duration)
end
function Camera.setSmoothingFactor(self, factor)
    CameraSetSmoothingFactor(factor)
end
function Camera.setSourceNoise(self, mag, velocity, vertOnly)
    if vertOnly == nil then
        vertOnly = false
    end
    CameraSetSourceNoiseEx(mag, velocity, vertOnly)
end
function Camera.setTargetController(self, whichUnit, xOffset, yOffset, inheritOrientation)
    SetCameraTargetController(whichUnit, xOffset, yOffset, inheritOrientation)
end
function Camera.setTargetNoise(self, mag, velocity, vertOnly)
    if vertOnly == nil then
        vertOnly = false
    end
    CameraSetTargetNoiseEx(mag, velocity, vertOnly)
end
function Camera.stop(self)
    StopCamera()
end
____exports.CameraSetup = __TS__Class()
local CameraSetup = ____exports.CameraSetup
CameraSetup.name = "CameraSetup"
__TS__ClassExtends(CameraSetup, Handle)
function CameraSetup.prototype.____constructor(self)
    local ____Handle_initFromHandle_result_0
    if Handle:initFromHandle() then
        ____Handle_initFromHandle_result_0 = nil
    else
        ____Handle_initFromHandle_result_0 = CreateCameraSetup()
    end
    Handle.prototype.____constructor(self, ____Handle_initFromHandle_result_0)
end
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destPoint",
    {get = function(self)
        return CameraSetupGetDestPositionLoc(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destX",
    {
        get = function(self)
            return CameraSetupGetDestPositionX(self.handle)
        end,
        set = function(self, x)
            CameraSetupSetDestPosition(self.handle, x, self.destY, 0)
        end
    },
    true
)
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destY",
    {
        get = function(self)
            return CameraSetupGetDestPositionY(self.handle)
        end,
        set = function(self, y)
            CameraSetupSetDestPosition(self.handle, self.destX, y, 0)
        end
    },
    true
)
function CameraSetup.prototype.apply(self, doPan, panTimed)
    CameraSetupApply(self.handle, doPan, panTimed)
end
function CameraSetup.prototype.applyForceDuration(self, doPan, forceDuration)
    CameraSetupApplyForceDuration(self.handle, doPan, forceDuration)
end
function CameraSetup.prototype.applyForceDurationZ(self, zDestOffset, forceDuration)
    CameraSetupApplyForceDurationWithZ(self.handle, zDestOffset, forceDuration)
end
function CameraSetup.prototype.applyZ(self, zDestOffset)
    CameraSetupApplyWithZ(self.handle, zDestOffset)
end
function CameraSetup.prototype.getField(self, whichField)
    return CameraSetupGetField(self.handle, whichField)
end
function CameraSetup.prototype.setDestPos(self, x, y, duration)
    CameraSetupSetDestPosition(self.handle, x, y, duration)
end
function CameraSetup.prototype.setField(self, whichField, value, duration)
    CameraSetupSetField(self.handle, whichField, value, duration)
end
function CameraSetup.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
