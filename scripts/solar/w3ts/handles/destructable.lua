local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 10,["17"] = 11,["18"] = 6,["20"] = 6,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 14,["33"] = 10,["39"] = 23,["41"] = 18,["42"] = 19,["52"] = 27,["54"] = 30,["55"] = 31,["65"] = 35,["67"] = 38,["68"] = 39,["77"] = 43,["86"] = 47,["88"] = 50,["89"] = 51,["98"] = 55,["106"] = 59,["114"] = 63,["118"] = 66,["119"] = 67,["120"] = 66,["121"] = 70,["122"] = 71,["123"] = 70,["124"] = 74,["125"] = 75,["126"] = 74,["127"] = 78,["128"] = 79,["129"] = 78,["130"] = 82,["131"] = 83,["132"] = 82,["133"] = 86,["134"] = 87,["135"] = 86,["136"] = 90,["137"] = 91,["138"] = 90,["139"] = 94,["140"] = 95,["141"] = 94,["142"] = 98,["143"] = 99,["144"] = 98});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____widget = require("solar.w3ts.handles.widget")
local Widget = ____widget.Widget
____exports.Destructable = __TS__Class()
local Destructable = ____exports.Destructable
Destructable.name = "Destructable"
__TS__ClassExtends(Destructable, Widget)
function Destructable.prototype.____constructor(self, objectId, x, y, z, face, scale, varation)
    if Handle:initFromHandle() then
        Widget.prototype.____constructor(self)
    else
        Widget.prototype.____constructor(
            self,
            CreateDestructableZ(
                objectId,
                x,
                y,
                z,
                face,
                scale,
                varation
            )
        )
    end
end
__TS__SetDescriptor(
    Destructable.prototype,
    "invulnerable",
    {
        get = function(self)
            return IsDestructableInvulnerable(self.handle)
        end,
        set = function(self, flag)
            SetDestructableInvulnerable(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "life",
    {
        get = function(self)
            return GetDestructableLife(self.handle)
        end,
        set = function(self, value)
            SetDestructableLife(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "maxLife",
    {
        get = function(self)
            return GetDestructableMaxLife(self.handle)
        end,
        set = function(self, value)
            SetDestructableMaxLife(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "name",
    {get = function(self)
        return GetDestructableName(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "occluderHeight",
    {
        get = function(self)
            return GetDestructableOccluderHeight(self.handle)
        end,
        set = function(self, value)
            SetDestructableOccluderHeight(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "typeId",
    {get = function(self)
        return GetDestructableTypeId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "x",
    {get = function(self)
        return GetDestructableX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "y",
    {get = function(self)
        return GetDestructableY(self.handle)
    end},
    true
)
function Destructable.prototype.destroy(self)
    RemoveDestructable(self.handle)
end
function Destructable.prototype.heal(self, life, birth)
    DestructableRestoreLife(self.handle, life, birth)
end
function Destructable.prototype.kill(self)
    KillDestructable(self.handle)
end
function Destructable.prototype.queueAnim(self, whichAnimation)
    QueueDestructableAnimation(self.handle, whichAnimation)
end
function Destructable.prototype.setAnim(self, whichAnimation)
    SetDestructableAnimation(self.handle, whichAnimation)
end
function Destructable.prototype.setAnimSpeed(self, speedFactor)
    SetDestructableAnimationSpeed(self.handle, speedFactor)
end
function Destructable.prototype.show(self, flag)
    ShowDestructable(self.handle, flag)
end
function Destructable.fromEvent(self)
    return self:fromHandle(GetTriggerDestructable())
end
function Destructable.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
