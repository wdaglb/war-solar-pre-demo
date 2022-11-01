local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 5,["15"] = 5,["16"] = 9,["17"] = 10,["18"] = 9});
local ____exports = {}
local ____timer = require("solar.w3ts.handles.timer")
local Timer = ____timer.Timer
local elapsedTime = 0
local gameTimer = __TS__New(Timer):start(
    30,
    true,
    function()
        elapsedTime = elapsedTime + 30
    end
)
function ____exports.getElapsedTime(self)
    return elapsedTime + gameTimer.elapsed
end
return ____exports
