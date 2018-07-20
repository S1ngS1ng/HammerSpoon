#! /usr/bin/env lua
--
-- mouse-control.lua
-- Copyright (C) 2018 YongMan <YongMan@YongMBP.local>
--
-- Distributed under terms of the MIT license.
--

-- Move mouse to left screen
module = {}

-- Move mouse to next screen
module.moveNext = function()
  local screen = hs.mouse.getCurrentScreen()
  local nextScreen = screen:next()
  local rect = nextScreen:fullFrame()
  local center = hs.geometry.rectMidPoint(rect)

  hs.mouse.setAbsolutePosition(center)
end

return module

