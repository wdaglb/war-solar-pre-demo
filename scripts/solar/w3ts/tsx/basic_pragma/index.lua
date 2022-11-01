local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["11"] = 8,["12"] = 3,["13"] = 4,["14"] = 3,["15"] = 4,["18"] = 9,["19"] = 9,["20"] = 9,["21"] = 9,["22"] = 9,["25"] = 10,["26"] = 10,["27"] = 10,["30"] = 11,["31"] = 11,["32"] = 11,["33"] = 11,["34"] = 11,["37"] = 12,["38"] = 12,["39"] = 12,["42"] = 13,["43"] = 13,["44"] = 13});
local ____exports = {}
do
    local ____adapter = require("solar.w3ts.tsx.basic_pragma.adapter")
    local setAdapter = ____adapter.setAdapter
    ____exports.setAdapter = setAdapter
end
do
    local ____element = require("solar.w3ts.tsx.basic_pragma.element")
    local createElement = ____element.createElement
    local Fragment = ____element.Fragment
    ____exports.createElement = createElement
    ____exports.Fragment = Fragment
end
do
    local ____reconciler = require("solar.w3ts.tsx.basic_pragma.reconciler")
    local render = ____reconciler.render
    local flushUpdates = ____reconciler.flushUpdates
    ____exports.render = render
    ____exports.flushUpdates = flushUpdates
end
do
    local ____useReducer = require("solar.w3ts.tsx.basic_pragma.hooks.useReducer")
    local useReducer = ____useReducer.useReducer
    ____exports.useReducer = useReducer
end
do
    local ____useState = require("solar.w3ts.tsx.basic_pragma.hooks.useState")
    local useState = ____useState.useState
    local useForceUpdate = ____useState.useForceUpdate
    ____exports.useState = useState
    ____exports.useForceUpdate = useForceUpdate
end
do
    local ____useEffect = require("solar.w3ts.tsx.basic_pragma.hooks.useEffect")
    local useEffect = ____useEffect.useEffect
    ____exports.useEffect = useEffect
end
do
    local ____useRef = require("solar.w3ts.tsx.basic_pragma.hooks.useRef")
    local useRef = ____useRef.useRef
    ____exports.useRef = useRef
end
return ____exports
