local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 5,["14"] = 7,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 8,["21"] = 8,["22"] = 8,["23"] = 8,["24"] = 8,["25"] = 8,["26"] = 8,["27"] = 8,["28"] = 8,["29"] = 8,["30"] = 8,["31"] = 8,["32"] = 8,["33"] = 8,["34"] = 8,["35"] = 26,["36"] = 27,["37"] = 29,["38"] = 30,["40"] = 32,["42"] = 34,["43"] = 35,["45"] = 37,["46"] = 38,["48"] = 40,["49"] = 41,["50"] = 42,["52"] = 44,["53"] = 45,["55"] = 47,["57"] = 48,["58"] = 7,["59"] = 7,["60"] = 52,["61"] = 54,["62"] = 55,["63"] = 56,["64"] = 56,["65"] = 56,["66"] = 57,["67"] = 58,["68"] = 60,["71"] = 63,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["78"] = 69,["79"] = 56,["80"] = 56,["81"] = 73,["82"] = 74,["83"] = 75,["84"] = 75,["85"] = 75,["86"] = 76,["87"] = 77,["88"] = 79,["91"] = 82,["92"] = 84,["93"] = 84,["94"] = 84,["95"] = 84,["98"] = 88,["99"] = 75,["100"] = 75,["101"] = 92,["102"] = 93,["103"] = 94,["104"] = 94,["105"] = 94,["106"] = 95,["107"] = 96,["108"] = 98,["111"] = 101,["112"] = 103,["113"] = 103,["114"] = 103,["115"] = 103,["118"] = 107,["119"] = 94,["120"] = 94,["121"] = 111,["122"] = 112,["123"] = 113,["124"] = 113,["125"] = 113,["126"] = 114,["127"] = 115,["128"] = 117,["131"] = 120,["132"] = 122,["133"] = 122,["134"] = 122,["135"] = 122,["138"] = 126,["139"] = 113,["140"] = 113});
local ____exports = {}
local ____common = require("data.lib.item.common")
local ItemEventType = ____common.ItemEventType
local itemHandleData = ____common.itemHandleData
local ____items = require("data.config.items")
local itemClasses = ____items.itemClasses
____exports.itemData = {}
__TS__ArrayForEach(
    itemClasses,
    function(____, item)
        local data = {
            id = item.data.id,
            _parent = "afac",
            Name = item.data.name,
            Tip = item.data.name,
            Description = item.data.description,
            Ubertip = item.data.description,
            Art = item.data.icon,
            file = item.data.model,
            goldcost = tostring(item.data.money) .. "",
            lumbercost = tostring(item.data.lumber or 0) .. "",
            uses = tostring(item.data.number or 0) .. "",
            stockStart = tostring(item.data.buyStart or 0) .. "",
            stockMax = tostring(item.data.stock or 1) .. "",
            sellable = "1",
            pawnable = "1",
            Level = "1"
        }
        if item.data.use then
            data.usable = "1"
            data.cooldownID = item.data.cdGroup
            data.perishable = "1"
        else
            data.perishable = "0"
        end
        if item.data.buyCD ~= nil then
            data.stockRegen = tostring(item.data.buyCD) .. ""
        end
        if item.data.ability then
            data.abilList = table.concat(item.data.ability, ",")
        end
        if item.data.pos and #item.data.pos == 2 then
            data.Buttonpos_1 = tostring(item.data.pos[1]) .. ""
            data.Buttonpos_2 = tostring(item.data.pos[2]) .. ""
        end
        if item.data.hotKey then
            data.Hotkey = item.data.hotKey .. ""
        end
        item:onItemFill(data)
        local ____exports_itemData_0 = ____exports.itemData
        ____exports_itemData_0[#____exports_itemData_0 + 1] = data
    end
)
function ____exports.default(self)
    local tri = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(tri, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    TriggerAddAction(
        tri,
        function()
            local unit = GetTriggerUnit()
            local item = GetManipulatedItem()
            if not itemHandleData:has(item) then
                return
            end
            local handle = itemHandleData:get(item)
            if not __TS__ArrayIncludes(
                handle:listen(),
                ItemEventType.pickup
            ) then
                return
            end
            handle:onPickup(unit)
        end
    )
    tri = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(tri, EVENT_PLAYER_UNIT_DROP_ITEM)
    TriggerAddAction(
        tri,
        function()
            local unit = GetTriggerUnit()
            local item = GetManipulatedItem()
            if not itemHandleData:has(item) then
                return
            end
            local handle = itemHandleData:get(item)
            if not __TS__ArrayIncludes(
                handle:listen(),
                ItemEventType.drop
            ) then
                return
            end
            handle:onDrop(unit)
        end
    )
    tri = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(tri, EVENT_PLAYER_UNIT_USE_ITEM)
    TriggerAddAction(
        tri,
        function()
            local unit = GetTriggerUnit()
            local item = GetManipulatedItem()
            if not itemHandleData:has(item) then
                return
            end
            local handle = itemHandleData:get(item)
            if not __TS__ArrayIncludes(
                handle:listen(),
                ItemEventType.use
            ) then
                return
            end
            handle:onUse(unit)
        end
    )
    tri = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(tri, EVENT_PLAYER_UNIT_PAWN_ITEM)
    TriggerAddAction(
        tri,
        function()
            local unit = GetTriggerUnit()
            local item = GetSoldItem()
            if not itemHandleData:has(item) then
                return
            end
            local handle = itemHandleData:get(item)
            if not __TS__ArrayIncludes(
                handle:listen(),
                ItemEventType.sell
            ) then
                return
            end
            handle:onSell(unit)
        end
    )
end
return ____exports
