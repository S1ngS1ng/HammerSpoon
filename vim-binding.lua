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

execute = function (mods, flag)
  local keyListener = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function (event)
    print('here')
    local keyArr = { 'h', 'j', 'k', 'l' }
    local keyPressed = event:getCharacters()
    print('keyPressed: '..keyPressed)
    if hs.fnutils.contains(keyArr, keyPressed) then
      print('tereh')
      hs.eventtap.event.newKeyEvent({}, vimBinding[keyPressed], true):post()
      hs.eventtap.event.newKeyEvent({}, vimBinding[keyPressed], false):post()
    else
      return false
    end
  end)
  if flag then
    keyListener:start()
  else
    keyListener:stop()
  end
  print('inside execute')
end


modifierHandler = function(event)
  local new_mods = event:getFlags()
  if last_mods['ctrl'] == new_mods['ctrl'] then
    print('Inside equal')
    return false
  end
  if not last_mods['ctrl'] then
    last_mods = new_mods
    execute(new_mods, true)
    print('repeated!!!!')
    -- TODO: Get pressed KEY HERE!!
  else
    if key_table['key'] then
      print('executing')
--      hs.eventtap.event.newKeyEvent({}, 'left', true):post()
--      hs.eventtap.event.newKeyEvent({}, 'left', false):post()
      print('executed')
    end
    last_mods = new_mods
    return false
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