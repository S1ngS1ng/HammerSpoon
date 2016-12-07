local vimBinding = {
  h = 'left',
  j = 'down',
  k = 'up',
  l = 'right'
}

local modifierListener = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(event)
  local modFlags = event:getFlags()
  local modTable = {}
  if modFlags['ctrl'] then
    local keyDown
    local keyListener = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
      local keyDown = hs.keycodes.map[event:getKeyCode()]
      if keyDown == 'h' or 'j' or 'k' or 'l' then
        print(keyDown)
        keyListener:stop()
          hs.eventtap.event.newKeyEvent(modTable, vimBinding.keyDown, true):post()
      end
    end)
    for flag in pairs(modFlags) do
      table.insert(modTable, flag)
    end
    print(keyListener:start())
  end
end)
modifierListener:start()
