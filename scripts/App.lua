local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 10,["18"] = 12,["19"] = 12,["20"] = 12,["22"] = 17,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 17,["28"] = 17,["29"] = 28,["30"] = 30,["31"] = 33,["32"] = 14,["33"] = 12,["34"] = 41,["35"] = 41,["36"] = 41,["37"] = 42,["38"] = 41,["39"] = 41});
local ____exports = {}
local ____GlobalVars = require("solar.common.GlobalVars")
local GlobalVars = ____GlobalVars.default
local ____AppTest = require("AppTest")
local AppTest = ____AppTest.default
local ____StateInit = require("StateInit")
local StateInit = ____StateInit.default
local ____StateConfigInit = require("StateConfigInit")
local StateConfigInit = ____StateConfigInit.default
local ____BaseUtil = require("solar.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
GlobalVars:init()
____exports.default = __TS__Class()
local App = ____exports.default
App.name = "App"
function App.prototype.____constructor(self)
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        60,
        "TS:App!"
    )
    StateConfigInit(nil)
    StateInit(nil)
    __TS__New(AppTest)
end
____exports.default = App
BaseUtil.runLater(
    0.01,
    function()
        __TS__New(____exports.default)
    end
)
return ____exports
