hv = require "hs.vox"
hk = require "hs.hotkey"

-- Hyper key for VOX control
local voxHyper = {"cmd", "alt", "shift"}

--- Bind hotkey for VOX control.
-- @function voxBindTable
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
-- @param {table} [hyper] - optional hyper key set, use local value voxHyper by default
local function voxBindTable(keyFuncTable, hyper)
  for key,fn in pairs(keyFuncTable) do
    hk.bind(hyper or voxHyper, key, function() fn() end)
  end
end

voxBindTable({
  j = hv.playpause,
  h = hv.previous,
  l = hv.next,
  k = hv.trackInfo,
  i = hv.togglePlaylist
})
