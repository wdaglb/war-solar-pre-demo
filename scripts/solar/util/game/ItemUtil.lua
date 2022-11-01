local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 3,["8"] = 3,["10"] = 3,["11"] = 14,["12"] = 15,["13"] = 16,["16"] = 19,["17"] = 21,["18"] = 22,["19"] = 14,["20"] = 30,["21"] = 31,["22"] = 30,["23"] = 39,["24"] = 40,["25"] = 39,["26"] = 48,["27"] = 49,["28"] = 48,["29"] = 55,["30"] = 56,["31"] = 56,["34"] = 57,["35"] = 57,["36"] = 58,["37"] = 59,["38"] = 60,["40"] = 57,["43"] = 63,["44"] = 55,["45"] = 69,["46"] = 70,["47"] = 71,["48"] = 72,["51"] = 75,["52"] = 69,["53"] = 81,["55"] = 82,["56"] = 82,["57"] = 83,["58"] = 84,["59"] = 85,["61"] = 82,["64"] = 88,["65"] = 81,["66"] = 95,["67"] = 96,["69"] = 97,["70"] = 97,["71"] = 98,["72"] = 99,["73"] = 97,["76"] = 101,["77"] = 95,["78"] = 108,["79"] = 109,["81"] = 110,["82"] = 110,["83"] = 111,["84"] = 112,["85"] = 113,["86"] = 114,["87"] = 115,["89"] = 118,["90"] = 119,["91"] = 120,["93"] = 122,["94"] = 110,["97"] = 124,["98"] = 108,["99"] = 133,["100"] = 134,["101"] = 135,["103"] = 136,["104"] = 136,["106"] = 137,["107"] = 138,["108"] = 139,["110"] = 141,["111"] = 142,["112"] = 143,["114"] = 146,["115"] = 147,["116"] = 148,["118"] = 151,["119"] = 152,["120"] = 153,["121"] = 154,["122"] = 155,["123"] = 156,["127"] = 136,["130"] = 159,["131"] = 133,["132"] = 4,["133"] = 5,["134"] = 6,["135"] = 5,["136"] = 3});
local ____exports = {}
____exports.default = __TS__Class()
local ItemUtil = ____exports.default
ItemUtil.name = "ItemUtil"
function ItemUtil.prototype.____constructor(self)
end
function ItemUtil.forItemsInRect(r, callBack)
    if ____exports.default._temp_callBack ~= nil then
        log.errorWithTraceBack("不能在此函数回调参数里 再使用此函数!")
        return
    end
    ____exports.default._temp_callBack = callBack
    EnumItemsInRect(r, nil, ____exports.default._SL_EnumItemsInRectFunc)
    ____exports.default._temp_callBack = nil
end
function ItemUtil.setItemTip(itemcode, value)
    EXSetItemDataString(itemcode, 4, value)
end
function ItemUtil.setItemUbertip(itemcode, value)
    EXSetItemDataString(itemcode, 3, value)
end
function ItemUtil.setItemArt(itemcode, value)
    EXSetItemDataString(itemcode, 1, value)
end
function ItemUtil.isUnitHasItem(udw, otid)
    if type(otid) == "string" then
        otid = FourCC(otid)
    end
    do
        local index = 0
        while index < 6 do
            local wpid = GetItemTypeId(UnitItemInSlot(udw, index))
            if wpid == otid then
                return true
            end
            index = index + 1
        end
    end
    return false
end
function ItemUtil.isUnitItemArrayAll(udw, itAy)
    for ____, iterator in ipairs(itAy) do
        if not ____exports.default.isUnitHasItem(udw, iterator) then
            return false
        end
    end
    return true
end
function ItemUtil.getFirstItemFromUnit(unit)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                return item
            end
            i = i + 1
        end
    end
    return nil
end
function ItemUtil.getAllItemFromUnit(unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            items[i + 1] = item
            i = i + 1
        end
    end
    return items
end
function ItemUtil.getItemAndChargesFromUnit(unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            local itemTypeStr = id2string(GetItemTypeId(item))
            local itemCharges = GetItemCharges(item)
            if not itemCharges or itemCharges < 1 then
                itemCharges = 1
            end
            local oldCharges = items[itemTypeStr]
            if not oldCharges then
                oldCharges = 0
            end
            items[itemTypeStr] = oldCharges + itemCharges
            i = i + 1
        end
    end
    return items
end
function ItemUtil.costItemChargesFromUnit(unit, itemId, charges)
    local costCharges = 0
    local needCostCharges = 0
    do
        local i = 0
        while i < 6 do
            do
                needCostCharges = charges - costCharges
                if costCharges >= charges then
                    return costCharges
                end
                local item = UnitItemInSlot(unit, i)
                if GetItemTypeId(item) ~= itemId then
                    goto __continue27
                end
                local itemCharges = GetItemCharges(item)
                if not itemCharges or itemCharges < 1 then
                    itemCharges = 1
                end
                if itemCharges <= needCostCharges then
                    costCharges = costCharges + itemCharges
                    RemoveItem(item)
                elseif itemCharges > needCostCharges then
                    costCharges = costCharges + needCostCharges
                    SetItemCharges(item, itemCharges - needCostCharges)
                end
            end
            ::__continue27::
            i = i + 1
        end
    end
    return costCharges
end
ItemUtil._temp_callBack = nil
ItemUtil._SL_EnumItemsInRectFunc = function()
    ____exports.default:_temp_callBack(GetEnumItem())
end
____exports.default = ItemUtil
return ____exports
