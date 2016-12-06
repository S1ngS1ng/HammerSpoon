local modifierListener = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(event)
  local modFlags = event:getFlags()
  local modTable = {}
  if modFlags['ctrl'] then
    for flag in pairs(modFlags) do
      table.insert(modTable, flag)
    end
    hs.eventtap.event.newKeyEvent(modTable, vimBinding[key], true):post()
  end
end)
modifierListener:start()

local vimBinding = {
  h = 'left',
  j = 'down',
  k = 'up',
  l = 'right'
}