local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["11"] = 10,["12"] = 10,["13"] = 10,["16"] = 12,["17"] = 12,["18"] = 12,["21"] = 25,["22"] = 16,["23"] = 18,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 23,["28"] = 24,["29"] = 16,["30"] = 18,["31"] = 20,["32"] = 21,["33"] = 22,["34"] = 23,["35"] = 24});
local ____exports = {}
local ____adapter = require("solar.w3ts.tsx.adapter")
local adapter = ____adapter.adapter
local ____basic_pragma = require("solar.w3ts.tsx.basic_pragma.index")
local setAdapter = ____basic_pragma.setAdapter
setAdapter(adapter)
do
    local ____AdapterUtil = require("solar.w3ts.tsx.AdapterUtil")
    local setPixelScale = ____AdapterUtil.setPixelScale
    ____exports.setPixelScale = setPixelScale
end
do
    local ____CreateFrameUtil = require("solar.w3ts.tsx.CreateFrameUtil")
    local data = ____CreateFrameUtil.data
    ____exports.data = data
end
do
    local ____basic_pragma = require("solar.w3ts.tsx.basic_pragma.index")
    local createElement = ____basic_pragma.createElement
    local Fragment = ____basic_pragma.Fragment
    local render = ____basic_pragma.render
    local useEffect = ____basic_pragma.useEffect
    local useForceUpdate = ____basic_pragma.useForceUpdate
    local useRef = ____basic_pragma.useRef
    local useState = ____basic_pragma.useState
    ____exports.createElement = createElement
    ____exports.Fragment = Fragment
    ____exports.render = render
    ____exports.useEffect = useEffect
    ____exports.useForceUpdate = useForceUpdate
    ____exports.useRef = useRef
    ____exports.useState = useState
end
return ____exports
