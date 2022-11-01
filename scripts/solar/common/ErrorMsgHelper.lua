local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 3,["12"] = 3,["13"] = 3,["14"] = 28,["15"] = 25,["16"] = 29,["17"] = 30,["18"] = 31,["19"] = 32,["20"] = 33,["21"] = 34,["23"] = 36,["24"] = 37,["26"] = 39,["27"] = 28,["32"] = 147,["40"] = 151,["48"] = 155,["52"] = 7,["53"] = 8,["54"] = 9,["56"] = 11,["57"] = 11,["58"] = 11,["59"] = 12,["60"] = 13,["62"] = 15,["63"] = 15,["64"] = 15,["65"] = 15,["66"] = 15,["67"] = 15,["68"] = 15,["70"] = 11,["71"] = 11,["72"] = 18,["73"] = 7,["74"] = 42,["75"] = 43,["76"] = 44,["77"] = 45,["79"] = 47,["80"] = 48,["81"] = 49,["82"] = 50,["83"] = 51,["84"] = 52,["86"] = 54,["87"] = 55,["88"] = 56,["89"] = 57,["90"] = 58,["91"] = 59,["92"] = 60,["93"] = 61,["94"] = 62,["95"] = 63,["96"] = 64,["97"] = 65,["98"] = 66,["99"] = 67,["100"] = 68,["101"] = 69,["102"] = 70,["103"] = 71,["104"] = 72,["105"] = 73,["106"] = 74,["107"] = 75,["108"] = 76,["109"] = 77,["110"] = 78,["111"] = 79,["112"] = 80,["113"] = 81,["114"] = 82,["115"] = 83,["116"] = 84,["117"] = 85,["118"] = 86,["119"] = 87,["120"] = 88,["121"] = 89,["122"] = 90,["123"] = 91,["124"] = 92,["125"] = 93,["126"] = 94,["127"] = 95,["129"] = 97,["130"] = 98,["131"] = 99,["132"] = 100,["133"] = 101,["134"] = 102,["135"] = 103,["136"] = 104,["138"] = 106,["139"] = 107,["141"] = 109,["142"] = 42,["143"] = 113,["144"] = 114,["145"] = 115,["146"] = 116,["148"] = 118,["149"] = 119,["150"] = 120,["152"] = 121,["153"] = 125,["155"] = 127,["156"] = 128,["157"] = 129,["158"] = 130,["159"] = 131,["160"] = 132,["161"] = 133,["162"] = 134,["163"] = 139,["167"] = 141,["168"] = 142,["169"] = 113,["170"] = 159,["171"] = 159,["172"] = 159,["174"] = 160,["175"] = 161,["176"] = 163,["177"] = 164,["178"] = 165,["179"] = 166,["180"] = 167,["182"] = 169,["183"] = 170,["185"] = 174,["186"] = 175,["187"] = 176,["188"] = 177,["189"] = 178,["190"] = 179,["192"] = 181,["193"] = 182,["194"] = 183,["196"] = 187,["197"] = 188,["198"] = 188,["199"] = 188,["200"] = 188,["201"] = 188,["202"] = 188,["203"] = 188,["204"] = 189,["205"] = 189,["206"] = 189,["207"] = 189,["208"] = 189,["209"] = 189,["210"] = 189,["211"] = 190,["212"] = 190,["213"] = 190,["214"] = 190,["215"] = 190,["216"] = 190,["217"] = 190,["218"] = 191,["219"] = 191,["220"] = 191,["221"] = 191,["222"] = 191,["223"] = 191,["224"] = 191,["225"] = 192,["226"] = 193,["227"] = 193,["228"] = 193,["229"] = 193,["230"] = 193,["231"] = 193,["232"] = 193,["235"] = 159,["236"] = 4,["237"] = 3});
local ____exports = {}
local ____DebugUtil = require("solar.util.debug.DebugUtil")
local DebugUtil = ____DebugUtil.default
____exports.default = __TS__Class()
local ErrorMsgHelper = ____exports.default
ErrorMsgHelper.name = "ErrorMsgHelper"
function ErrorMsgHelper.prototype.____constructor(self, msg, traceback)
    self._repairSuggestions = ""
    ____exports.default:init0()
    self._msg = tostring(msg)
    self._traceback = tostring(traceback)
    if isDebug then
        self.cnMsg = self:translateMsg()
        self.cnTraceback = self:translateTraceback()
    else
        self.cnMsg = self._msg
        self.cnTraceback = self._traceback
    end
    ____exports.default.lastError = self
end
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "msg",
    {get = function(self)
        return self._msg
    end},
    true
)
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "traceback",
    {get = function(self)
        return self._traceback
    end},
    true
)
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "repairSuggestions",
    {get = function(self)
        return self._repairSuggestions
    end},
    true
)
function ErrorMsgHelper.init0(self)
    if not isDebug or ____exports.default.justInvoke then
        return true
    end
    DebugUtil.onChat(
        "se",
        function()
            if ____exports.default.lastError then
                ____exports.default.printErrorMsgHelper(____exports.default.lastError, false)
            else
                DisplayTimedTextToPlayer(
                    GetLocalPlayer(),
                    0,
                    0,
                    60,
                    "没有最近的错误消息！"
                )
            end
        end
    )
    return true
end
function ErrorMsgHelper.prototype.translateMsg(self)
    local newMsg = tostring(self._msg)
    if not newMsg or not #newMsg or #newMsg == 0 then
        return newMsg
    end
    local cn = nil
    local onlyCn = false
    if (string.find(newMsg, "invalid key to 'next'", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "invalid key to 'next'", "'next'键无效")
        self._repairSuggestions = "请检查是否存在对象遍历中先进行置空操作，再进行了增加新元素的操作！"
        onlyCn = true
    end
    if (string.find(newMsg, "attempt to index a number value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to index a number value", "不能从数字类型获取属性")
        self._repairSuggestions = "请检查变量读取正确或存入了正确的值！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to index a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to index a nil value", "不能从空值中获取属性")
        self._repairSuggestions = "请在获取属性前加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to call a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to call a nil value", "不能调用空值函数")
        self._repairSuggestions = "请在要调用的函数前加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to compare number with nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to compare number with nil", "不能用空值与数字比较大小")
        self._repairSuggestions = "请在判断中加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to compare nil with number", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to compare nil with number", "不能用空值与数字比较大小")
        self._repairSuggestions = "请在判断中加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to concatenate a nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to concatenate a nil", "不能连接一个空值")
        self._repairSuggestions = "请在使用的变量前加上对空值的判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform arithmetic on a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform arithmetic on a nil value", "不能对空值进行算术运算")
        self._repairSuggestions = "请在算术运算前面加上对空值或赋予初始值进行运算！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform 'n%0'", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform 'n%0'", "不能对0取余数")
        self._repairSuggestions = "请修改余数不能为0"
        onlyCn = true
    elseif (string.find(newMsg, "Call jass function crash.", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "Call jass function crash.", "调用底层Jass函数异常")
        self._repairSuggestions = "请检查函数的所有参数是否正确！(如参数是否为空值、是否存在此物编、数值是否超过最大边界、参数类型是否正确)"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform", "不能执行")
        self._repairSuggestions = "请检查算法是否存在0或null！请赋值初始值！"
    elseif (string.find(newMsg, "(data string too short)", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "(data string too short)", "字符串数据长度太短")
        self._repairSuggestions = "请检查字符串数据是否为空值或长度过短"
    end
    if cn and #cn and #cn > 0 then
        cn = __TS__StringReplace(cn, " (local ", " (局部变量 ")
        cn = __TS__StringReplace(cn, " (global ", " (全局变量 ")
        cn = __TS__StringReplace(cn, "bad argument", "参数错误")
        cn = __TS__StringReplace(cn, " (value expected)", " (允许值)")
        cn = __TS__StringReplace(cn, "bad argument #", "错误的参数 #")
        cn = __TS__StringReplace(cn, "<unknown>", "<未知>")
        newMsg = (newMsg .. "\r\n") .. cn
    end
    if onlyCn then
        return cn
    end
    return newMsg
end
function ErrorMsgHelper.prototype.translateTraceback(self)
    local newMsg = self.traceback
    if not newMsg or not #newMsg or #newMsg == 0 then
        return newMsg
    end
    local strings = __TS__StringSplit(newMsg, "\n")
    local cnMsg = ""
    for ____, line in ipairs(strings) do
        do
            if (string.find(line, "solar\\common\\", nil, true) or 0) - 1 >= 0 or (string.find(line, "lualib_bundle.lua:", nil, true) or 0) - 1 >= 0 or (string.find(line, "solar\\", nil, true) or 0) - 1 >= 0 then
                goto __continue31
            end
            line = __TS__StringReplace(line, "[C]: in upvalue ", "在上值底层C代码: ")
            line = __TS__StringReplace(line, " in ", " 在 ")
            line = __TS__StringReplace(line, " local ", " 局部变量 ")
            line = __TS__StringReplace(line, " global ", " 全局变量 ")
            line = __TS__StringReplace(line, " method ", " 方法 ")
            line = __TS__StringReplace(line, " function ", " 函数 ")
            line = __TS__StringReplace(line, " upvalue ", " 上值 ")
            line = __TS__StringReplace(line, "(...tail calls...)", "(...尾调用...)")
            cnMsg = (cnMsg .. line) .. "\r\n"
        end
        ::__continue31::
    end
    cnMsg = __TS__StringReplace(cnMsg, "stack traceback:", "函数堆栈:")
    return cnMsg
end
function ErrorMsgHelper.printErrorMsgHelper(errorMsgHelper, translate)
    if translate == nil then
        translate = true
    end
    local title = "------------------异常报告---------------------"
    local ____end = "---------------------------------------"
    local newMsg
    local tb
    if translate then
        newMsg = errorMsgHelper.cnMsg
        tb = errorMsgHelper.cnTraceback
    else
        newMsg = errorMsgHelper.msg
        tb = errorMsgHelper.traceback
    end
    print(title)
    print(newMsg .. "\n")
    print(tb)
    if translate then
        local baseTb = "\n\n-------------------原始堆栈--------------------\n\n" .. errorMsgHelper.traceback
        print(baseTb)
    end
    print(____end)
    if #errorMsgHelper.repairSuggestions > 0 then
        print(errorMsgHelper.repairSuggestions)
    end
    if DisplayTimedTextToPlayer then
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            title
        )
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            newMsg
        )
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            tb
        )
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            ____end
        )
        if #errorMsgHelper.repairSuggestions > 0 then
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                errorMsgHelper.repairSuggestions
            )
        end
    end
end
ErrorMsgHelper.justInvoke = false
____exports.default = ErrorMsgHelper
return ____exports
