local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 3,["11"] = 3,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 24,["17"] = 25,["18"] = 6,["19"] = 27,["20"] = 6,["22"] = 28,["24"] = 29,["25"] = 6,["27"] = 30,["30"] = 24,["36"] = 12,["37"] = 13,["39"] = 15,["41"] = 18,["42"] = 19,["52"] = 178,["53"] = 179,["54"] = 180,["56"] = 182,["58"] = 168,["59"] = 169,["60"] = 170,["61"] = 171,["71"] = 197,["72"] = 198,["73"] = 199,["75"] = 201,["77"] = 188,["78"] = 189,["79"] = 190,["89"] = 216,["91"] = 207,["92"] = 208,["93"] = 209,["103"] = 231,["104"] = 232,["105"] = 233,["107"] = 235,["109"] = 222,["110"] = 223,["111"] = 224,["121"] = 250,["123"] = 241,["124"] = 242,["125"] = 243,["135"] = 265,["137"] = 256,["138"] = 257,["139"] = 258,["149"] = 281,["151"] = 271,["152"] = 272,["153"] = 273,["154"] = 274,["164"] = 296,["166"] = 287,["167"] = 288,["168"] = 289,["178"] = 311,["180"] = 302,["181"] = 303,["182"] = 304,["187"] = 154,["188"] = 155,["189"] = 154,["190"] = 161,["191"] = 162,["192"] = 161,["193"] = 317,["194"] = 318,["195"] = 319,["196"] = 320,["197"] = 317,["198"] = 326,["199"] = 327,["200"] = 328,["201"] = 329,["203"] = 331,["204"] = 332,["206"] = 334,["207"] = 326,["208"] = 340,["209"] = 341,["210"] = 342,["211"] = 340,["212"] = 348,["213"] = 349,["214"] = 348,["215"] = 355,["216"] = 356,["217"] = 357,["218"] = 355,["219"] = 363,["220"] = 364,["221"] = 363,["222"] = 370,["223"] = 371,["224"] = 372,["225"] = 373,["226"] = 374,["227"] = 375,["228"] = 370,["229"] = 381,["230"] = 382,["231"] = 383,["232"] = 381,["233"] = 386,["234"] = 387,["235"] = 386});
local ____exports = {}
local ____handle = require("solar.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Effect = __TS__Class()
local Effect = ____exports.Effect
Effect.name = "Effect"
__TS__ClassExtends(Effect, Handle)
function Effect.prototype.____constructor(self, modelName, a, b)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    elseif type(a) == "number" and type(b) == "number" then
        Handle.prototype.____constructor(
            self,
            AddSpecialEffect(modelName, a, b)
        )
    elseif type(a) ~= "number" and type(b) == "string" then
        Handle.prototype.____constructor(
            self,
            AddSpecialEffectTarget(modelName, a.handle, b)
        )
    end
end
__TS__SetDescriptor(
    Effect.prototype,
    "data",
    {
        get = function(self)
            if not self._data then
                self._data = {}
            end
            return self._data
        end,
        set = function(self, value)
            self._data = value
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectSize",
    {
        get = function(self)
            local size = self._data.size
            if not size then
                size = EXGetEffectSize(self.handle)
            end
            return size
        end,
        set = function(self, size)
            EXSetEffectSize(self.handle, size)
            SetPariticle2Size(self.handle, size)
            self._data.size = size
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectZ",
    {
        get = function(self)
            local z = self._data.z
            if not z then
                z = EXGetEffectZ(self.handle)
            end
            return z
        end,
        set = function(self, Z)
            EXSetEffectZ(self.handle, Z)
            self._data.z = Z
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectSpeed",
    {
        get = function(self)
            return self._data.Speed
        end,
        set = function(self, Speed)
            EXSetEffectSpeed(self.handle, Speed)
            self._data.Speed = Speed
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectColor",
    {
        get = function(self)
            local Color = self._data.color
            if not Color then
                Color = EXGetEffectColor(self.handle)
            end
            return Color
        end,
        set = function(self, Color)
            EXSetEffectColor(self.handle, Color)
            self._data.color = Color
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectFogVisible",
    {
        get = function(self)
            return self._data.fogvisible
        end,
        set = function(self, fogvisible)
            EXSetEffectFogVisible(self.handle, fogvisible)
            self._data.fogvisible = fogvisible
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectVisible",
    {
        get = function(self)
            return self._data.visible
        end,
        set = function(self, visible)
            EXSetEffectVisible(self.handle, visible)
            self._data.visible = visible
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectRotateZ",
    {
        get = function(self)
            return self._data.rotateZ
        end,
        set = function(self, z)
            self:reset()
            EXEffectMatRotateZ(self.handle, z)
            self._data.rotateZ = z
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectRotateX",
    {
        get = function(self)
            return self._data.rotateX
        end,
        set = function(self, x)
            EXEffectMatRotateX(self.handle, x)
            self._data.rotateX = x
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectRotateY",
    {
        get = function(self)
            return self._data.rotateY
        end,
        set = function(self, y)
            EXEffectMatRotateY(self.handle, y)
            self._data.rotateY = y
        end
    },
    true
)
function Effect.createEffect(self, modelName, x, y)
    return __TS__New(____exports.Effect, modelName, x, y)
end
function Effect.createEffectTarget(self, modelName, a, b)
    return __TS__New(____exports.Effect, modelName, a, b)
end
function Effect.prototype.setEffectXY(self, x, y)
    EXSetEffectXY(self.handle, x, y)
    self._data.x = x
    self._data.y = y
end
function Effect.prototype.getEffectXY(self)
    local xy = {x = self._data.x, y = self._data.y}
    if not xy.x then
        xy.x = EXGetEffectX(self.handle)
    end
    if not xy.y then
        xy.y = EXGetEffectY(self.handle)
    end
    return xy
end
function Effect.prototype.setBindEffect(self, han, node)
    BindEffect(han, node, self.handle)
    self._data.binding = han
end
function Effect.prototype.getBindEffect(self)
    return self._data.binding
end
function Effect.prototype.unBindEffect(self)
    UnBindEffect(self.handle)
    self._data.binding = nil
end
function Effect.prototype.setEffectAnimation(self, aon)
    EXSetEffectAnimation(self.handle, aon)
end
function Effect.prototype.reset(self)
    EXEffectMatReset(self.handle)
    self._data.size = 1
    self._data.rotateX = 0
    self._data.rotateY = 0
    self._data.rotateZ = 0
end
function Effect.prototype.destroy(self)
    __TS__Delete(self, "_data")
    DestroyEffect(self.handle)
end
function Effect.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
