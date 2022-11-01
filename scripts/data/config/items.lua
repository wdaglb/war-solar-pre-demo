local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 5});
local ____exports = {}
local ____Dao = require("data.config.items.Dao")
local Dao = ____Dao.Dao
____exports.itemClasses = {__TS__New(Dao)}
return ____exports
