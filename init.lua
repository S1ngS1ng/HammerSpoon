-- -----------------------------------------------------------------------
--           ** HammerSpoon Config File by S1ngS1ng with ❤️ **           --
-- -----------------------------------------------------------------------

--   ***   Please refer to README.MD for instructions. Cheers!    ***   --

-- -----------------------------------------------------------------------
--                         ** Something Global **                       --
-- -----------------------------------------------------------------------
-- Uncomment this following line if you don't wish to see animations
-- hs.window.animationDuration = 0

-- -----------------------------------------------------------------------
--                            ** Requires **                            --
-- -----------------------------------------------------------------------
require "window-management"
require "vox-control"
require "vim-binding"
require "key-binding"

-- -----------------------------------------------------------------------
--                            ** For Debug **                           --
-- -----------------------------------------------------------------------
function reloadConfig(files)
  local doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
    hs.alert.show('Config Reloaded')
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

-- Well, sometimes auto-reload is not working, you know u.u
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "n", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
