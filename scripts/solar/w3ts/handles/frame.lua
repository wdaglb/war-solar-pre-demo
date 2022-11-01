local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__TypeOf = ____lualib.__TS__TypeOf
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 21,["21"] = 15,["22"] = 16,["23"] = 18,["24"] = 22,["27"] = 25,["28"] = 26,["29"] = 27,["32"] = 30,["33"] = 31,["35"] = 33,["36"] = 34,["38"] = 36,["39"] = 37,["41"] = 39,["42"] = 40,["44"] = 42,["45"] = 43,["46"] = 43,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 43,["52"] = 21,["58"] = 54,["59"] = 55,["60"] = 56,["62"] = 58,["63"] = 59,["64"] = 59,["65"] = 59,["66"] = 58,["67"] = 63,["68"] = 63,["69"] = 63,["70"] = 63,["71"] = 58,["72"] = 58,["73"] = 58,["74"] = 58,["77"] = 73,["79"] = 76,["80"] = 77,["90"] = 81,["91"] = 81,["92"] = 81,["93"] = 81,["95"] = 84,["96"] = 85,["97"] = 85,["98"] = 85,["99"] = 85,["100"] = 85,["110"] = 95,["112"] = 89,["113"] = 90,["123"] = 116,["125"] = 111,["126"] = 112,["136"] = 127,["137"] = 128,["139"] = 130,["141"] = 119,["142"] = 120,["143"] = 121,["144"] = 122,["155"] = 138,["157"] = 133,["158"] = 134,["168"] = 146,["170"] = 141,["171"] = 142,["181"] = 154,["183"] = 149,["184"] = 150,["194"] = 162,["196"] = 157,["197"] = 158,["207"] = 172,["209"] = 166,["210"] = 167,["211"] = 168,["221"] = 181,["223"] = 175,["224"] = 176,["225"] = 177,["233"] = 415,["234"] = 416,["235"] = 417,["243"] = 424,["247"] = 189,["248"] = 190,["249"] = 191,["250"] = 189,["251"] = 194,["252"] = 195,["253"] = 196,["254"] = 194,["255"] = 204,["256"] = 205,["257"] = 206,["258"] = 207,["259"] = 204,["260"] = 214,["261"] = 215,["262"] = 216,["263"] = 214,["264"] = 219,["265"] = 220,["266"] = 221,["267"] = 219,["268"] = 224,["269"] = 225,["270"] = 226,["271"] = 224,["272"] = 229,["273"] = 230,["274"] = 231,["275"] = 229,["276"] = 234,["277"] = 235,["278"] = 236,["279"] = 234,["280"] = 245,["281"] = 245,["282"] = 245,["284"] = 245,["285"] = 245,["287"] = 246,["288"] = 247,["289"] = 245,["290"] = 250,["291"] = 251,["292"] = 252,["293"] = 250,["294"] = 255,["295"] = 256,["296"] = 257,["297"] = 258,["298"] = 259,["299"] = 255,["300"] = 267,["301"] = 268,["302"] = 269,["303"] = 267,["304"] = 275,["305"] = 275,["306"] = 275,["308"] = 276,["309"] = 277,["310"] = 275,["311"] = 280,["312"] = 281,["313"] = 282,["314"] = 280,["315"] = 285,["316"] = 286,["317"] = 286,["318"] = 286,["319"] = 286,["320"] = 286,["321"] = 286,["322"] = 286,["323"] = 286,["324"] = 287,["325"] = 285,["326"] = 296,["327"] = 296,["328"] = 296,["330"] = 297,["331"] = 297,["332"] = 297,["333"] = 297,["334"] = 297,["335"] = 297,["336"] = 297,["337"] = 297,["338"] = 298,["339"] = 298,["340"] = 298,["341"] = 298,["342"] = 298,["343"] = 298,["344"] = 298,["345"] = 298,["346"] = 299,["347"] = 296,["348"] = 302,["349"] = 303,["350"] = 302,["351"] = 306,["352"] = 307,["353"] = 308,["354"] = 309,["355"] = 306,["356"] = 317,["357"] = 318,["358"] = 319,["359"] = 317,["360"] = 322,["361"] = 323,["362"] = 324,["363"] = 322,["364"] = 327,["365"] = 328,["366"] = 329,["367"] = 327,["368"] = 332,["369"] = 333,["370"] = 334,["371"] = 332,["372"] = 337,["373"] = 338,["374"] = 339,["375"] = 337,["376"] = 342,["377"] = 343,["378"] = 344,["379"] = 342,["380"] = 347,["381"] = 347,["382"] = 347,["384"] = 348,["385"] = 349,["386"] = 347,["387"] = 357,["388"] = 357,["389"] = 357,["391"] = 358,["392"] = 358,["393"] = 358,["394"] = 358,["395"] = 358,["396"] = 358,["397"] = 359,["398"] = 360,["399"] = 361,["400"] = 357,["401"] = 364,["402"] = 365,["403"] = 366,["404"] = 364,["405"] = 369,["406"] = 370,["407"] = 371,["408"] = 369,["409"] = 374,["410"] = 375,["411"] = 376,["412"] = 374,["413"] = 379,["414"] = 380,["415"] = 381,["416"] = 382,["417"] = 379,["418"] = 385,["419"] = 386,["420"] = 387,["421"] = 385,["422"] = 399,["423"] = 400,["424"] = 401,["425"] = 399,["426"] = 407,["427"] = 408,["428"] = 407,["429"] = 430,["430"] = 431,["431"] = 432,["432"] = 430,["433"] = 438,["434"] = 439,["435"] = 438,["436"] = 449,["437"] = 449,["438"] = 449,["440"] = 450,["441"] = 449,["442"] = 456,["443"] = 456,["444"] = 456,["446"] = 457,["447"] = 456,["448"] = 463,["449"] = 463,["450"] = 463,["452"] = 464,["453"] = 463,["454"] = 470,["455"] = 470,["456"] = 470,["458"] = 471,["459"] = 470,["460"] = 477,["461"] = 477,["462"] = 477,["464"] = 478,["465"] = 477,["466"] = 484,["467"] = 484,["468"] = 484,["470"] = 485,["471"] = 484,["472"] = 491,["473"] = 491,["474"] = 491,["476"] = 492,["477"] = 491,["478"] = 495,["479"] = 495,["480"] = 495,["482"] = 496,["483"] = 497,["486"] = 500,["487"] = 495,["488"] = 506,["489"] = 507,["490"] = 506,["491"] = 510,["492"] = 511,["493"] = 510,["494"] = 514,["495"] = 515,["496"] = 514,["497"] = 518,["498"] = 519,["499"] = 518,["500"] = 527,["501"] = 528,["502"] = 527,["503"] = 535,["504"] = 536,["505"] = 535,["506"] = 542,["507"] = 543,["508"] = 542,["509"] = 549,["510"] = 550,["511"] = 549,["512"] = 556,["513"] = 557,["514"] = 556,["515"] = 563,["516"] = 564,["517"] = 563,["518"] = 570,["519"] = 571,["520"] = 570,["521"] = 578,["522"] = 578,["523"] = 578,["525"] = 579,["526"] = 578});
local ____exports = {}
local ____DataBase = require("solar.common.DataBase")
local DataBase = ____DataBase.default
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
--- BACKDROP, TEXT, GLUETEXTBUTTON, BUTTON, TEXTBUTTON, TEXTAREA,
-- FRAME, CHECKBOX, EDITBOX, GLUEBUTTON, SCROLLBAR, SLIDER,
-- POPUPMENU, CONTROL, DIALOG, HIGHLIGHT, LISTBOX, MENU,
-- CHATDISPLAY, GLUECHECKBOX, SIMPLEFRAME, SIMPLEBUTTON;
____exports.Frame = __TS__Class()
local Frame = ____exports.Frame
Frame.name = "Frame"
function Frame.prototype.____constructor(self, frameOrFrameType, name, parent, template, id)
    self.current = 0
    self.type = ""
    self.propsTemp = nil
    if not frameOrFrameType then
        return
    end
    local ____type = __TS__TypeOf(frameOrFrameType)
    if ____type == "number" then
        self.current = frameOrFrameType
        return
    end
    if not name then
        name = "Solar:Frame:" .. tostring(BaseUtil.getUUID())
    end
    if not parent then
        parent = DzGetGameUI()
    end
    if not template then
        template = ""
    end
    if not id then
        id = 0
    end
    self.type = frameOrFrameType
    self.current = DzCreateFrameByTagName(
        frameOrFrameType,
        name,
        parent,
        template,
        id
    )
end
__TS__SetDescriptor(
    Frame.prototype,
    "props",
    {
        get = function(self)
            if not self.propsTemp then
                if self.current == 0 then
                    self.propsTemp = {size = {}, position = {relative = 0, x = 0, y = 0}, visible = true, scale = 1}
                else
                    self.propsTemp = {
                        size = {
                            width = 0,
                            height = DzFrameGetHeight(self.current)
                        },
                        position = {
                            relative = DzFrameGetParent(self.current),
                            x = 0,
                            y = 0
                        },
                        visible = true,
                        scale = 1
                    }
                end
            end
            return self.propsTemp
        end,
        set = function(self, obj)
            self.propsTemp = obj
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "solarData",
    {
        get = function(self)
            return DataBase:getDataByTypeId(
                "_SL_Frame",
                tostring(self.current)
            )
        end,
        set = function(self, obj)
            DataBase:setDataByTypeId(
                "_SL_Frame",
                tostring(self.current),
                obj
            )
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "alpha",
    {
        get = function(self)
            return DzFrameGetAlpha(self.current)
        end,
        set = function(self, alpha)
            DzFrameSetAlpha(self.current, alpha)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "enabled",
    {
        get = function(self)
            return DzFrameGetEnable(self.current)
        end,
        set = function(self, flag)
            DzFrameSetEnable(self.current, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "height",
    {
        get = function(self)
            if self.current == 0 then
                return self.props.size.height
            end
            return DzFrameGetHeight(self.current)
        end,
        set = function(self, height)
            self.props.size.height = height
            if self.current ~= 0 then
                DzFrameSetSize(self.current, self.width, height)
            end
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "parent",
    {
        get = function(self)
            return DzFrameGetParent(self.current)
        end,
        set = function(self, parent)
            DzFrameSetParent(self.current, parent)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "text",
    {
        get = function(self)
            return DzFrameGetText(self.current)
        end,
        set = function(self, text)
            DzFrameSetText(self.current, text)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "textSizeLimit",
    {
        get = function(self)
            return DzFrameGetTextSizeLimit(self.current)
        end,
        set = function(self, size)
            DzFrameSetTextSizeLimit(self.current, size)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "value",
    {
        get = function(self)
            return DzFrameGetValue(self.current)
        end,
        set = function(self, value)
            DzFrameSetValue(self.current, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "visible",
    {
        get = function(self)
            return self.props.visible
        end,
        set = function(self, flag)
            self.props.visible = flag
            DzFrameShow(self.current, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "width",
    {
        get = function(self)
            return self.props.size.width
        end,
        set = function(self, width)
            self.props.size.width = width
            DzFrameSetSize(self.current, width, self.height)
        end
    },
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "setModelPariticleSize",
    {set = function(self, size)
        FrameSetModelPariticle2Size(self.current, size)
        self.props.modelPariticleSize = size
    end},
    true
)
__TS__SetDescriptor(
    Frame.prototype,
    "getModelPariticleSize",
    {get = function(self)
        return self.props.modelPariticleSize
    end},
    true
)
function Frame.prototype.cageMouse(self, enable)
    DzFrameCageMouse(self.current, enable)
    return self
end
function Frame.prototype.clearPoints(self)
    DzFrameClearAllPoints(self.current)
    return self
end
function Frame.prototype.destroy(self)
    DzDestroyFrame(self.current)
    self.solarData = nil
    return self
end
function Frame.prototype.setAbsPoint(self, point, x, y)
    DzFrameSetAbsolutePoint(self.current, point, x, y)
    return self
end
function Frame.prototype.setAllPoints(self, relative)
    DzFrameSetAllPoints(self.current, relative)
    return self
end
function Frame.prototype.setAlpha(self, alpha)
    DzFrameSetAlpha(self.current, alpha)
    return self
end
function Frame.prototype.setEnabled(self, flag)
    DzFrameSetEnable(self.current, flag)
    return self
end
function Frame.prototype.setFocus(self, flag)
    DzFrameSetFocus(self.current, flag)
    return self
end
function Frame.prototype.setFont(self, height, filename, flags)
    if filename == nil then
        filename = "Fonts\\dfst-m3u.ttf"
    end
    if flags == nil then
        flags = 0
    end
    DzFrameSetFont(self.current, filename, height, flags)
    return self
end
function Frame.prototype.setHeight(self, height)
    DzFrameSetSize(self.current, self.props.size.width, height)
    return self
end
function Frame.prototype.SetSize(self, width, height)
    self.props.size.width = width
    self.props.size.height = height
    DzFrameSetSize(self.current, width, height)
    return self
end
function Frame.prototype.setMinMaxValue(self, minValue, maxValue)
    DzFrameSetMinMaxValue(self.current, minValue, maxValue)
    return self
end
function Frame.prototype.setModel(self, modelFile, modelType, flag)
    if flag == nil then
        flag = 0
    end
    DzFrameSetModel(self.current, modelFile, modelType, flag)
    return self
end
function Frame.prototype.setParent(self, parent)
    DzFrameSetParent(self.current, parent)
    return self
end
function Frame.prototype.setPoint(self, point, relative, relativePoint, x, y)
    DzFrameSetPoint(
        self.current,
        point,
        relative,
        relativePoint,
        x,
        y
    )
    return self
end
function Frame.prototype.setPoints(self, relative, widthGap, heightGap)
    if heightGap == nil then
        heightGap = widthGap
    end
    DzFrameSetPoint(
        self.current,
        FRAMEPOINT_TOPLEFT,
        relative,
        FRAMEPOINT_TOPLEFT,
        -widthGap,
        heightGap
    )
    DzFrameSetPoint(
        self.current,
        FRAMEPOINT_BOTTOMRIGHT,
        relative,
        FRAMEPOINT_BOTTOMRIGHT,
        widthGap,
        -heightGap
    )
    return self
end
function Frame.prototype.getScale(self)
    return self.props.scale
end
function Frame.prototype.setScale(self, scale)
    self.props.scale = scale
    DzFrameSetScale(self.current, scale)
    return self
end
function Frame.prototype.setSize(self, width, height)
    DzFrameSetSize(self.current, width, height)
    return self
end
function Frame.prototype.setSpriteAnimate(self, animId, autocast)
    DzFrameSetAnimate(self.current, animId, autocast)
    return self
end
function Frame.prototype.setStepSize(self, stepSize)
    DzFrameSetStepValue(self.current, stepSize)
    return self
end
function Frame.prototype.setText(self, text)
    DzFrameSetText(self.current, text)
    return self
end
function Frame.prototype.setTextColor(self, color)
    DzFrameSetTextColor(self.current, color)
    return self
end
function Frame.prototype.setTextSizeLimit(self, size)
    DzFrameSetTextSizeLimit(self.current, size)
    return self
end
function Frame.prototype.setTexture(self, texFile, flag)
    if flag == nil then
        flag = 0
    end
    DzFrameSetTexture(self.current, texFile, flag)
    return self
end
function Frame.prototype.addBackgroundImage(self, texFile, flag)
    if flag == nil then
        flag = 0
    end
    local backdropFrame = __TS__New(
        ____exports.Frame,
        "BACKDROP",
        ____exports.Frame:getRandomName(),
        self.current
    )
    backdropFrame:setTexture(texFile, flag)
    backdropFrame:setAllPoints(self.current)
    return backdropFrame
end
function Frame.prototype.setTooltip(self, tooltip)
    DzFrameSetTooltip(self.current, tooltip)
    return self
end
function Frame.prototype.setValue(self, value)
    DzFrameSetValue(self.current, value)
    return self
end
function Frame.prototype.setVertexColor(self, color)
    DzFrameSetVertexColor(self.current, color)
    return self
end
function Frame.prototype.setVisible(self, flag)
    self.props.visible = flag
    DzFrameShow(self.current, flag)
    return self
end
function Frame.prototype.setWidth(self, width)
    DzFrameSetSize(self.current, width, self.height)
    return self
end
function Frame.prototype.setModelSize(self, size)
    FrameSetModelSize(self.current, size)
    self.props.modelSize = size
end
function Frame.prototype.getModelSize(self)
    return self.props.modelSize
end
function Frame.prototype.setModelSpeed(self, Speed)
    FrameSetModelSpeed(self.current, Speed)
    self.props.modelSpeed = Speed
end
function Frame.prototype.getModelSpeed(self)
    return self.props.modelSpeed
end
function Frame.prototype.setOnClick(self, callback, sync)
    if sync == nil then
        sync = false
    end
    self:setEventCallback(FRAMEEVENT_CONTROL_CLICK, callback, sync)
end
function Frame.prototype.setOnDoubleClick(self, callback, sync)
    if sync == nil then
        sync = false
    end
    self:setEventCallback(FRAMEEVENT_MOUSE_DOUBLECLICK, callback, sync)
end
function Frame.prototype.setOnMouseEnter(self, callback, sync)
    if sync == nil then
        sync = false
    end
    self:setEventCallback(FRAMEEVENT_MOUSE_ENTER, callback, sync)
end
function Frame.prototype.setOnMouseLeave(self, callback, sync)
    if sync == nil then
        sync = false
    end
    self:setEventCallback(FRAMEEVENT_MOUSE_LEAVE, callback, sync)
end
function Frame.prototype.setOnMouseDown(self, callback, sync)
    if sync == nil then
        sync = false
    end
    self:setEventCallback(FRAMEEVENT_MOUSE_DOWN, callback, sync)
end
function Frame.prototype.setOnMouseUp(self, callback, sync)
    if sync == nil then
        sync = false
    end
    self:setEventCallback(FRAMEEVENT_MOUSE_UP, callback, sync)
end
function Frame.prototype.setOnMouseWheel(self, callback, sync)
    if sync == nil then
        sync = false
    end
    self:setEventCallback(FRAMEEVENT_MOUSE_WHEEL, callback, sync)
end
function Frame.prototype.setEventCallback(self, event, callback, sync)
    if sync == nil then
        sync = false
    end
    if sync and isAsync then
        log.errorWithTraceBack("无法在异步中注册同步方法！请在同步方法中执行！")
        return
    end
    DzFrameSetScriptByCode(self.current, event, callback, sync)
end
function Frame.fromEvent(self)
    return self:fromHandle(DzGetTriggerUIEventFrame())
end
function Frame.fromHandle(self, handle)
    return __TS__New(____exports.Frame, handle)
end
function Frame.fromName(self, name, createContext)
    return self:fromHandle(DzFrameFindByName(name, createContext))
end
function Frame.loadTOC(self, filename)
    return DzLoadToc(filename)
end
function Frame.getRandomName(self)
    return "Solar:Frame:" .. tostring(BaseUtil.getUUID())
end
function Frame.createBackDrop(self)
    return __TS__New(____exports.Frame, "BACKDROP")
end
function Frame.createTEXT(self)
    return __TS__New(____exports.Frame, "TEXT")
end
function Frame.createGLUETEXTBUTTON(self)
    return __TS__New(____exports.Frame, "GLUETEXTBUTTON")
end
function Frame.createBUTTON(self)
    return __TS__New(____exports.Frame, "BUTTON")
end
function Frame.createTEXTBUTTON(self)
    return __TS__New(____exports.Frame, "TEXTBUTTON")
end
function Frame.createTEXTAREA(self)
    return __TS__New(____exports.Frame, "TEXTAREA")
end
function Frame.createSPRITE(self, father)
    if father == nil then
        father = nil
    end
    return __TS__New(____exports.Frame, "SPRITE", nil, father)
end
return ____exports
