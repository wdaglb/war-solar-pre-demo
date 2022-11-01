local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 7,["15"] = 8,["16"] = 5,["18"] = 5,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 11,["25"] = 11,["26"] = 11,["27"] = 11,["28"] = 11,["31"] = 7,["37"] = 32,["39"] = 35,["40"] = 36,["49"] = 40,["57"] = 44,["61"] = 47,["62"] = 48,["63"] = 47,["64"] = 51,["65"] = 52,["66"] = 51,["67"] = 55,["68"] = 56,["69"] = 55,["70"] = 59,["71"] = 60,["72"] = 59,["73"] = 63,["74"] = 64,["75"] = 63,["76"] = 67,["77"] = 68,["78"] = 67,["79"] = 71,["80"] = 72,["81"] = 71,["82"] = 87,["83"] = 88,["84"] = 87,["85"] = 91,["86"] = 92,["87"] = 91,["88"] = 99,["89"] = 100,["90"] = 99,["91"] = 103,["92"] = 104,["93"] = 103,["94"] = 107,["95"] = 108,["96"] = 107,["97"] = 111,["98"] = 112,["99"] = 111,["100"] = 115,["101"] = 116,["102"] = 115,["103"] = 119,["104"] = 120,["105"] = 119,["106"] = 123,["107"] = 124,["108"] = 123,["109"] = 127,["110"] = 128,["111"] = 127,["112"] = 131,["113"] = 132,["114"] = 131});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Sound = __TS__Class()
local Sound = ____exports.Sound
Sound.name = "Sound"
__TS__ClassExtends(Sound, Handle)
function Sound.prototype.____constructor(self, fileName, looping, is3D, stopWhenOutOfRange, fadeInRate, fadeOutRate, eaxSetting)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateSound(
                fileName,
                looping,
                is3D,
                stopWhenOutOfRange,
                fadeInRate,
                fadeOutRate,
                eaxSetting
            )
        )
    end
end
__TS__SetDescriptor(
    Sound.prototype,
    "duration",
    {
        get = function(self)
            return GetSoundDuration(self.handle)
        end,
        set = function(self, duration)
            SetSoundDuration(self.handle, duration)
        end
    },
    true
)
__TS__SetDescriptor(
    Sound.prototype,
    "loading",
    {get = function(self)
        return GetSoundIsLoading(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Sound.prototype,
    "playing",
    {get = function(self)
        return GetSoundIsPlaying(self.handle)
    end},
    true
)
function Sound.prototype.killWhenDone(self)
    KillSoundWhenDone(self.handle)
end
function Sound.prototype.registerStacked(self, byPosition, rectWidth, rectHeight)
    RegisterStackedSound(self.handle, byPosition, rectWidth, rectHeight)
end
function Sound.prototype.setChannel(self, channel)
    SetSoundDistanceCutoff(self.handle, channel)
end
function Sound.prototype.setConeAngles(self, inside, outside, outsideVolume)
    SetSoundConeAngles(self.handle, inside, outside, outsideVolume)
end
function Sound.prototype.setConeOrientation(self, x, y, z)
    SetSoundConeOrientation(self.handle, x, y, z)
end
function Sound.prototype.setDistanceCutoff(self, cutoff)
    SetSoundDistanceCutoff(self.handle, cutoff)
end
function Sound.prototype.setDistances(self, minDist, maxDist)
    SetSoundDistances(self.handle, minDist, maxDist)
end
function Sound.prototype.setParamsFromLabel(self, soundLabel)
    SetSoundParamsFromLabel(self.handle, soundLabel)
end
function Sound.prototype.setPitch(self, pitch)
    SetSoundPitch(self.handle, pitch)
end
function Sound.prototype.setPlayPosition(self, millisecs)
    SetSoundPlayPosition(self.handle, millisecs)
end
function Sound.prototype.setPosition(self, x, y, z)
    SetSoundPosition(self.handle, x, y, z)
end
function Sound.prototype.setVelocity(self, x, y, z)
    SetSoundVelocity(self.handle, x, y, z)
end
function Sound.prototype.setVolume(self, volume)
    SetSoundVolume(self.handle, volume)
end
function Sound.prototype.start(self)
    StartSound(self.handle)
end
function Sound.prototype.stop(self, killWhenDone, fadeOut)
    StopSound(self.handle, killWhenDone, fadeOut)
end
function Sound.prototype.unregisterStacked(self, byPosition, rectWidth, rectHeight)
    UnregisterStackedSound(self.handle, byPosition, rectWidth, rectHeight)
end
function Sound.fromHandle(self, handle)
    return self:getObject(handle)
end
function Sound.getFileDuration(self, fileName)
    return GetSoundFileDuration(fileName)
end
return ____exports
