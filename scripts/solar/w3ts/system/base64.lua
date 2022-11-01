local ____lualib = require("lualib_bundle")
local __TS__StringCharAt = ____lualib.__TS__StringCharAt
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__StringSubstr = ____lualib.__TS__StringSubstr
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 3,["11"] = 5,["12"] = 6,["14"] = 8,["15"] = 8,["16"] = 8,["17"] = 8,["19"] = 8,["20"] = 8,["21"] = 8,["22"] = 8,["24"] = 8,["25"] = 8,["27"] = 8,["30"] = 10,["31"] = 10,["32"] = 10,["33"] = 10,["34"] = 10,["35"] = 10,["36"] = 10,["37"] = 12,["38"] = 13,["39"] = 14,["41"] = 16,["43"] = 19,["44"] = 20,["45"] = 21,["47"] = 24,["48"] = 8,["49"] = 8,["50"] = 8,["51"] = 8,["54"] = 27,["55"] = 5,["56"] = 30,["57"] = 31,["59"] = 32,["60"] = 32,["63"] = 33,["64"] = 34,["65"] = 35,["66"] = 36,["67"] = 37,["69"] = 39,["71"] = 41,["72"] = 41,["73"] = 41,["75"] = 41,["76"] = 41,["79"] = 42,["82"] = 45,["83"] = 46,["84"] = 41,["85"] = 41,["87"] = 41,["88"] = 41,["89"] = 41,["91"] = 41,["93"] = 41,["94"] = 41,["95"] = 41,["96"] = 41,["98"] = 41,["99"] = 41,["100"] = 41,["102"] = 41,["106"] = 48,["107"] = 30});
local ____exports = {}
---
-- @noSelfInFile
local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
function ____exports.base64Encode(input)
    local output = ""
    do
        local block = 0
        local charCode = 0
        local idx = 0
        local map = chars
        while true do
            local ____temp_2 = #__TS__StringCharAt(
                input,
                math.floor(idx) | 0
            ) > 0
            if not ____temp_2 then
                map = "="
                ____temp_2 = idx % 1
            end
            if not ____temp_2 then
                break
            end
            local ____string_byte_1 = string.byte
            local ____input_0 = input
            idx = idx + 3 / 4
            charCode = ____string_byte_1(
                ____input_0,
                math.floor(idx) + 1
            ) or 0
            if math.floor(idx) > #input and charCode == 0 then
                if #output % 4 == 1 then
                    return output .. "="
                end
                return output .. "=="
            end
            if charCode > 255 then
                print("'base64Encode' failed: The string to be encoded contains characters outside of the Latin1 range.")
                return output
            end
            block = block << 8 | charCode
            output = output .. __TS__StringCharAt(
                map,
                math.floor(63 & block >> 8 - idx % 1 * 8)
            )
        end
    end
    return output
end
function ____exports.base64Decode(input)
    local i = #input
    do
        while i > 0 and __TS__StringAccess(input, i) ~= "=" do
            i = i - 1
        end
    end
    local str = __TS__StringSubstr(input, 0, i - 1)
    local output = ""
    if #str % 4 == 1 then
        print("'base64Decode' failed: The string to be decoded is not correctly encoded.")
        return output
    end
    local bs = 0
    do
        local bc = 0
        local buffer
        local idx = 0
        while true do
            buffer = __TS__StringCharAt(str, idx)
            if not buffer then
                break
            end
            if #tostring(buffer) == 0 then
                break
            end
            buffer = (string.find(chars, buffer, nil, true) or 0) - 1
            idx = idx + 1
            local ____temp_6
            local ____temp_5 = ~buffer
            if ____temp_5 then
                local ____temp_3
                if bc % 4 ~= 0 then
                    ____temp_3 = bs * 64 + buffer
                else
                    ____temp_3 = buffer
                end
                bs = ____temp_3
                local ____bc_4 = bc
                bc = ____bc_4 + 1
                ____temp_5 = ____bc_4 % 4 ~= 0
            end
            if ____temp_5 then
                output = output .. string.char(255 & bs >> (-2 * bc & 6))
                ____temp_6 = output
            else
                ____temp_6 = 0
            end
        end
    end
    return output
end
return ____exports
