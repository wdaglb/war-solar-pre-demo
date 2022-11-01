local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 3,["14"] = 11,["15"] = 12,["18"] = 15,["19"] = 16,["24"] = 31,["27"] = 20,["28"] = 21,["29"] = 22,["36"] = 34,["37"] = 36,["38"] = 37,["39"] = 38,["40"] = 39,["41"] = 39,["42"] = 40,["43"] = 37,["44"] = 43,["45"] = 44,["46"] = 45,["47"] = 46,["48"] = 46,["49"] = 47,["50"] = 44,["51"] = 50,["52"] = 51,["53"] = 52,["54"] = 52,["55"] = 52,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 52,["60"] = 53,["61"] = 53,["62"] = 54,["63"] = 51,["64"] = 57,["65"] = 58,["66"] = 59,["67"] = 59,["68"] = 59,["69"] = 59,["70"] = 59,["71"] = 59,["72"] = 59,["73"] = 60,["74"] = 60,["75"] = 61,["76"] = 58,["77"] = 64,["78"] = 65,["79"] = 66,["80"] = 67,["81"] = 67,["82"] = 68,["83"] = 65,["84"] = 74,["85"] = 75,["86"] = 78,["87"] = 78,["88"] = 78,["89"] = 78,["90"] = 78,["91"] = 78,["92"] = 78,["93"] = 79,["94"] = 79,["95"] = 79,["96"] = 80,["97"] = 79,["98"] = 79,["100"] = 83,["101"] = 84,["102"] = 11,["103"] = 88,["104"] = 89,["105"] = 90,["108"] = 92,["111"] = 95,["112"] = 96,["113"] = 97,["114"] = 98,["115"] = 99,["118"] = 101,["121"] = 104,["122"] = 105,["123"] = 106,["124"] = 107,["125"] = 108,["126"] = 109,["129"] = 98,["130"] = 88,["131"] = 118,["132"] = 119,["133"] = 120,["134"] = 121,["135"] = 121,["136"] = 121,["137"] = 121,["138"] = 121,["139"] = 121,["140"] = 121,["141"] = 122,["142"] = 124,["144"] = 126,["145"] = 127,["147"] = 129,["151"] = 131,["152"] = 133,["153"] = 134,["154"] = 135,["155"] = 136,["157"] = 138,["158"] = 139,["160"] = 141,["161"] = 142,["163"] = 144,["164"] = 145,["166"] = 147,["167"] = 148,["170"] = 152,["173"] = 150,["181"] = 156,["182"] = 157,["183"] = 158,["184"] = 159,["185"] = 118,["186"] = 4,["187"] = 5,["188"] = 6,["189"] = 7,["190"] = 8,["191"] = 9,["192"] = 3});
local ____exports = {}
local ____trigger = require("solar.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
____exports.default = __TS__Class()
local SolarReload = ____exports.default
SolarReload.name = "SolarReload"
function SolarReload.prototype.____constructor(self)
end
function SolarReload.init(self)
    if _G.SolarReloadInitED then
        return
    end
    _G.SolarReloadInitED = true
    if not local_map_dir_path then
        return
    end
    do
        local function ____catch(e)
            print(e)
        end
        local ____try, ____hasReturned = pcall(function()
            log.debug("local_map_dir_path=" .. local_map_dir_path)
            if isEmbedBrowser and webEngine then
                webEngine.path = (((((((((local_map_dir_path .. "webapp\\dist;") .. local_map_dir_path) .. "webapp\\public\\;") .. local_map_dir_path) .. "webapp;") .. local_map_dir_path) .. "frontend;") .. local_map_dir_path) .. "resource;") .. tostring(webEngine.path)
            end
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    ____exports.default:autoReload()
    local jassCreateTrigger = CreateTrigger
    _G.CreateTrigger = function()
        local hdl = jassCreateTrigger()
        local ____exports_default_TriggerHandle_0 = ____exports.default.TriggerHandle
        ____exports_default_TriggerHandle_0[#____exports_default_TriggerHandle_0 + 1] = hdl
        return hdl
    end
    local jassCreateTimer = CreateTimer
    _G.CreateTimer = function()
        local hdl = jassCreateTimer()
        local ____exports_default_TimerHandle_1 = ____exports.default.TimerHandle
        ____exports_default_TimerHandle_1[#____exports_default_TimerHandle_1 + 1] = hdl
        return hdl
    end
    local jassDzCreateFrameByTagName = DzCreateFrameByTagName
    _G.DzCreateFrameByTagName = function(frameType, name, parent, template, id)
        local hdl = jassDzCreateFrameByTagName(
            frameType,
            name,
            parent,
            template,
            id
        )
        local ____exports_default_frameHandle_2 = ____exports.default.frameHandle
        ____exports_default_frameHandle_2[#____exports_default_frameHandle_2 + 1] = hdl
        return hdl
    end
    local jassCreateUnit = CreateUnit
    _G.CreateUnit = function(id, unitid, x, y, face)
        local hdl = jassCreateUnit(
            id,
            unitid,
            x,
            y,
            face
        )
        local ____exports_default_unitHandle_3 = ____exports.default.unitHandle
        ____exports_default_unitHandle_3[#____exports_default_unitHandle_3 + 1] = hdl
        return hdl
    end
    local jassCreateItem = CreateItem
    _G.CreateItem = function(itemid, x, y)
        local hdl = jassCreateItem(itemid, x, y)
        local ____exports_default_itemHandle_4 = ____exports.default.itemHandle
        ____exports_default_itemHandle_4[#____exports_default_itemHandle_4 + 1] = hdl
        return hdl
    end
    if DzTriggerRegisterKeyEventByCode and not _G.HasTriggerRegisterKeyEvent then
        local t = jassCreateTrigger()
        DzTriggerRegisterKeyEventByCode(
            t,
            116,
            1,
            true,
            nil
        )
        TriggerAddAction(
            t,
            function()
                ____exports.default:reload()
            end
        )
    end
    _G.HasTriggerRegisterKeyEvent = true
    _G.reloadCount = 1
end
function SolarReload.autoReload(self)
    _G.scripts_lastModified = -1
    PACKAGE.loaded._SLA_temp = nil
    do
        pcall(function()
            require("_SLA_temp")
        end)
    end
    _G.scripts_last_reload = _G.scripts_lastModified
    local trigger = __TS__New(Trigger)
    trigger:registerTimerEvent(0.5, true)
    trigger:addAction(function()
        PACKAGE.loaded._SLA_temp = nil
        do
            pcall(function()
                require("_SLA_temp")
            end)
        end
        if _G.scripts_lastModified > _G.scripts_last_reload then
            print("======自动更新======")
            print("_G.scripts_lastModified=" .. tostring(_G.scripts_lastModified))
            print("_G.scripts_last_reload=" .. tostring(_G.scripts_last_reload))
            _G.scripts_last_reload = _G.scripts_lastModified
            ____exports.default:reload()
        else
        end
    end)
end
function SolarReload.reload(self)
    _G.reloadCount = _G.reloadCount + 1
    local info = ("No." .. tostring(_G.reloadCount)) .. " [重新加载代码脚本]!"
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        60,
        info
    )
    print(info)
    for loadedKey in pairs(PACKAGE.loaded) do
        do
            if loadedKey and (string.find(loadedKey, "solar.", nil, true) or 0) - 1 >= 0 then
                goto __continue23
            end
            PACKAGE.loaded[loadedKey] = nil
        end
        ::__continue23::
    end
    se:clear()
    for ____, handleElement in ipairs(____exports.default.TriggerHandle) do
        TriggerClearActions(handleElement)
        DisableTrigger(handleElement)
        DestroyTrigger(handleElement)
    end
    for ____, handleElement in ipairs(____exports.default.TimerHandle) do
        DestroyTimer(handleElement)
    end
    for ____, handleElement in ipairs(____exports.default.unitHandle) do
        RemoveUnit(handleElement)
    end
    for ____, handleElement in ipairs(____exports.default.itemHandle) do
        RemoveItem(handleElement)
    end
    for ____, handleElement in ipairs(____exports.default.frameHandle) do
        if handleElement and handleElement > 0 then
            do
                local function ____catch(e)
                    print((("销毁Frame出错:" .. tostring(handleElement)) .. "=") .. tostring(e))
                end
                local ____try, ____hasReturned = pcall(function()
                    DzDestroyFrame(handleElement)
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    end
    ____exports.default.TriggerHandle = {}
    ____exports.default.TimerHandle = {}
    ____exports.default.frameHandle = {}
    require("App")
end
SolarReload.config = {}
SolarReload.TriggerHandle = {}
SolarReload.TimerHandle = {}
SolarReload.frameHandle = {}
SolarReload.unitHandle = {}
SolarReload.itemHandle = {}
____exports.default = SolarReload
return ____exports
