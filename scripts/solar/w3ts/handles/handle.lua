local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 10,["14"] = 11,["15"] = 10,["20"] = 16,["24"] = 19,["25"] = 20,["26"] = 19,["27"] = 23,["28"] = 28,["29"] = 29,["30"] = 30,["31"] = 31,["32"] = 32,["34"] = 35,["35"] = 36,["36"] = 37,["37"] = 38,["38"] = 23});
local ____exports = {}
---
-- @noSelfInFile *
____exports.Handle = __TS__Class()
local Handle = ____exports.Handle
Handle.name = "Handle"
function Handle.prototype.____constructor(self, handle)
    self.handle = handle == nil and ____exports.Handle.initHandle or handle
end
__TS__SetDescriptor(
    Handle.prototype,
    "id",
    {get = function(self)
        return GetHandleId(self.handle)
    end},
    true
)
function Handle.initFromHandle(self)
    return ____exports.Handle.initHandle ~= nil
end
function Handle.getObject(self, handle)
    if not IsHandle(handle) then
        local tb = debug.traceback()
        log.error("Handle.getObject():你传的handle为空或0！")
        log.error(tb)
        return nil
    end
    ____exports.Handle.initHandle = handle
    local newObj = __TS__New(self)
    ____exports.Handle.initHandle = nil
    return newObj
end
return ____exports
