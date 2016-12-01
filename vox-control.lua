hv = require "hs.vox"
hk = require "hs.hotkey"

-- Hyper key for VOX control
local voxHyper = {"cmd", "alt", "shift"}

--- voxBind()
--- Function
--- Bind hotkey for VOX control
---
--- Parameters:
---  * key {string} hotkey
---  * fn {function} callback function
---  * hyper(optional) {table} hyper key, use voxHyper by default
local function voxBind(key, fn, hyper)
  hk.bind(hyper or voxHyper, key, function() fn() end)
end

voxBind("j", hv.playpause)
voxBind("h", hv.previous)
voxBind("l", hv.next)