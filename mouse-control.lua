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

