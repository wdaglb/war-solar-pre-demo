local ____lualib = require("lualib_bundle")
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 5,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 9,["16"] = 11,["17"] = 12,["18"] = 13,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 17,["24"] = 17,["26"] = 17,["27"] = 18,["28"] = 18,["29"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 19,["36"] = 19,["37"] = 20,["38"] = 20,["39"] = 20,["41"] = 8,["42"] = 8,["43"] = 8,["44"] = 8,["45"] = 8,["46"] = 8,["47"] = 8,["48"] = 8,["49"] = 8,["50"] = 8,["51"] = 8,["52"] = 8,["53"] = 8,["54"] = 8,["55"] = 8,["56"] = 8,["57"] = 8,["58"] = 25,["59"] = 26,["60"] = 28,["61"] = 29,["63"] = 31,["65"] = 33,["66"] = 34,["68"] = 36,["69"] = 37,["71"] = 39,["72"] = 40,["73"] = 41,["75"] = 43,["76"] = 44,["78"] = 46,["80"] = 47,["81"] = 7,["82"] = 7,["83"] = 51,["84"] = 53,["85"] = 54,["86"] = 55,["87"] = 55,["88"] = 55,["89"] = 56,["90"] = 57,["91"] = 59,["94"] = 62,["95"] = 64,["98"] = 68,["99"] = 55,["100"] = 55,["101"] = 72,["102"] = 73,["103"] = 74,["104"] = 74,["105"] = 74,["106"] = 75,["107"] = 76,["108"] = 78,["111"] = 81,["112"] = 83,["115"] = 87,["116"] = 74,["117"] = 74,["118"] = 91,["119"] = 92,["120"] = 93,["121"] = 93,["122"] = 93,["123"] = 94,["124"] = 95,["125"] = 97,["128"] = 100,["129"] = 102,["132"] = 106,["133"] = 93,["134"] = 93,["135"] = 110,["136"] = 111,["137"] = 112,["138"] = 112,["139"] = 112,["140"] = 113,["141"] = 114,["142"] = 116,["145"] = 119,["146"] = 121,["149"] = 125,["150"] = 112,["151"] = 112});
local ____exports = {}
local ____common = require("data.items.common")
local ItemEventType = ____common.ItemEventType
local itemHandleData = ____common.itemHandleData
local ____config = require("data.items.config")
local itemClasses = ____config.itemClasses
____exports.itemData = {}
__TS__ArrayForEach(
    itemClasses,
    function(____, item)
        local ____item_data_id_4 = item.data.id
        local ____item_data_name_5 = item.data.name
        local ____item_data_description_6 = item.data.description
        local ____item_data_description_7 = item.data.description
        local ____item_data_icon_8 = item.data.icon
        local ____item_data_model_9 = item.data.model
        local ____temp_10 = tostring(item.data.money) .. ""
        local ____item_data_lumber_0 = item.data.lumber
        if ____item_data_lumber_0 == nil then
            ____item_data_lumber_0 = 0
        end
        local ____temp_11 = tostring(____item_data_lumber_0) .. ""
        local ____item_data_number_1 = item.data.number
        if ____item_data_number_1 == nil then
            ____item_data_number_1 = 0
        end
        local ____temp_12 = tostring(____item_data_number_1) .. ""
        local ____item_data_buyStart_2 = item.data.buyStart
        if ____item_data_buyStart_2 == nil then
            ____item_data_buyStart_2 = 0
        end
        local ____temp_13 = tostring(____item_data_buyStart_2) .. ""
        local ____item_data_stock_3 = item.data.stock
        if ____item_data_stock_3 == nil then
            ____item_data_stock_3 = 1
        end
        local data = {
            id = ____item_data_id_4,
            _parent = "afac",
            Name = ____item_data_name_5,
            Tip = ____item_data_description_6,
            Description = ____item_data_description_7,
            Art = ____item_data_icon_8,
            file = ____item_data_model_9,
            goldcost = ____temp_10,
            lumbercost = ____temp_11,
            uses = ____temp_12,
            stockStart = ____temp_13,
            stockMax = tostring(____item_data_stock_3) .. "",
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
            data.abilList = item.data.ability:join(",")
        end
        if item.data.pos and item.data.pos.length == 2 then
            data.Buttonpos_1 = tostring(item.data.pos[0]) .. ""
            data.Buttonpos_2 = tostring(item.data.pos[1]) .. ""
        end
        if item.data.hotKey then
            data.Hotkey = tostring(item.data.hotKey) .. ""
        end
        item:onItemFill(data)
        local ____exports_itemData_14 = ____exports.itemData
        ____exports_itemData_14[#____exports_itemData_14 + 1] = data
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
            if not handle:listen():includes(ItemEventType.pickup) then
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
            if not handle:listen():includes(ItemEventType.drop) then
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
            if not handle:listen():includes(ItemEventType.use) then
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
            if not handle:listen():includes(ItemEventType.sell) then
                return
            end
            handle:onSell(unit)
        end
    )
end
return ____exports
