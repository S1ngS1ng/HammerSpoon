--local function keyCode(key, modifiers)
--  modifiers = modifiers or {}
--
--  return function()
--    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
--    hs.timer.usleep(1000)
--    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
--  end
--end

local vimBinding = {
  h = 'left',
  j = 'down',
  k = 'up',
  l = 'right'
}

function getTable(modKeys)
  local modTable = {}
  for flag in pairs(modKeys) do
    table.insert(modTable, flag)
  end
  return modTable
end

key_table = {
  last_mods = {},
  key = false
}

last_mods = {}

modifierHandler = function(event)
  local new_mods = event:getFlags()
  print(last_mods['ctrl'], new_mods['ctrl'])
  if last_mods['ctrl'] == new_mods['ctrl'] then
    return false
  end
  if not last_mods['ctrl'] then
    last_mods = new_mods
    -- TODO: Get pressed KEY HERE!!
  else
    if key_table['key'] then
      print('executing')
      hs.eventtap.event.newKeyEvent({}, 'left', true):post()
      hs.eventtap.event.newKeyEvent({}, 'left', false):post()
      print('executed')
    end
    last_mods = new_mods
  end
  return false
end

local modifierListener = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, modifierHandler)
modifierListener:start()

--  local modFlags = event:getFlags()
--  hs.inspect(modFlags)
--  if modFlags['ctrl'] then
--    local modTable = hs.fnutils.filter(getTable(modFlags), function (e) return e ~= 'ctrl' end)
--    print(hs.inspect(modTable))
--    keyTap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
--      local keyDown = hs.keycodes.map[event:getKeyCode()]
--      if keyDown == 'h' or keyDown == 'j' or keyDown == 'k' or keyDown == 'l' then
--        print(hs.inspect(modTable), vimBinding[keyDown])
----        hs.eventtap.keyStroke(modTable, keyDown)
--      else
--        return false
--      end
--    end)
--    print('start')
--    keyTap:start()
--    print('after')
--  else
--    return false
--  end
-- end