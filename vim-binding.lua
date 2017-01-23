-- https://github.com/asmagill/hammerspoon-config/blob/master/_scratch/viKeys.lua

local module = {}

module.debugging = false -- whether to print status updates

local eventtap = require "hs.eventtap"
local event    = eventtap.event
local inspect  = require "hs.inspect"

local keyHandler = function(e)
  local watchFor = { h = "left", j = "down", k = "up", l = "right" }
  local actualKey = e:getCharacters(true)
  local replacement = watchFor[actualKey:lower()]
  if replacement then
    local isDown = e:getType() == event.types.keyDown
    local flags  = {}
    for k, v in pairs(e:getFlags()) do
      if v and k ~= "ctrl" then -- ctrl will be down because that's our "wrapper", so ignore it
        table.insert(flags, k)
      end
    end
    if module.debugging then print("viKeys: " .. replacement, inspect(flags), isDown) end
    local replacementEvent = event.newKeyEvent(flags, replacement, isDown)
    if isDown then
      -- allow for auto-repeat
      replacementEvent:setProperty(event.properties.keyboardEventAutorepeat, e:getProperty(event.properties.keyboardEventAutorepeat))
    end
    return true, { replacementEvent }
  else
    return false -- do nothing to the event, just pass it along
  end
end

local modifierHandler = function(e)
  local flags = e:getFlags()
  local onlyControlPressed = false
  for k, v in pairs(flags) do
    onlyControlPressed = v and k == "ctrl"
    if not onlyControlPressed then break end
  end
  -- you must tap and hold ctrl by itself to turn this on
  if onlyControlPressed and not module.keyListener then
    if module.debugging then print("viKeys: keyhandler on") end
    module.keyListener = eventtap.new({ event.types.keyDown, event.types.keyUp }, keyHandler):start()
    -- however, adding additional modifiers afterwards is ok... its only when ctrl isn't down that we switch back off
  elseif not flags.ctrl and module.keyListener then
    if module.debugging then print("viKeys: keyhandler off") end
    module.keyListener:stop()
    module.keyListener = nil
  end
  return false
end

module.modifierListener = eventtap.new({ event.types.flagsChanged }, modifierHandler)

module.start = function()
  module.modifierListener:start()
end

module.stop = function()
  if module.keyListener then
    module.keyListener:stop()
    module.keyListener = nil
  end
  module.modifierListener:stop()
end

module.start() -- autostart

return module
