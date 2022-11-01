-- 此lua脚本为太阳引导程序 即第一个被执行的lua
package.path = "scripts\\?.lua;lua\\?.lua;" .. package.path
-- 环境初始化

-- require("jass.runtime").console = true
-- require("base")

--local cj = require("jass.common")
--cj.DisplayTimedTextToPlayer(cj.Player(0),0,0,60,"solar_boot!")

-- 获取环境信息
local bj_questSecretSound = require("jass.globals").bj_questSecretSound
local isInitBlizzard = bj_questSecretSound ~= nil and bj_questSecretSound ~= 0;

-- 初始化脚本环境
local GlobalVars = require("solar.common.GlobalVars").default


-- 加载APP
if isInitBlizzard then
    GlobalVars:initOnMain()
    require 'App'
else
    pcall(function()
        require("solar.browser.EmbedBrowser")
        require "LoadingCallback"
    end)
    --
    local code = require("jass.code")
    local old_main = code.main
    code.main = function()
        old_main()
        GlobalVars:initOnMain()
        require("App")
    end
end



