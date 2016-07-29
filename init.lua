-- -----------------------------------------------------------------------
--           ** HammerSpoon Config File by S1ngS1ng with ❤️ **           --
-- -----------------------------------------------------------------------

--   ***   Please refer to README.MD for instructions. Cheers!    ***   --

-- -----------------------------------------------------------------------
--                         ** Something Global **                       --
-- -----------------------------------------------------------------------
  -- Uncomment this following line if you don't wish to see animations
  -- hs.window.animationDuration = 0
grid = require "hs.grid"
grid.setMargins('0, 0')

-- Set screen watcher, in case you connect a new monitor, or unplug a monitor
screens = {}
local screenwatcher = hs.screen.watcher.new(function()
  screens = hs.screen.allScreens()
end)
screenwatcher:start()

-- Set screen grid depending on resolution
  -- TODO: set grid according to pixels
for index,screen in pairs(hs.screen.allScreens()) do
  if screen:frame().w / screen:frame().h > 2 then
    -- 10 * 4 for ultra wide screen
    grid.setGrid('10 * 4', screen)
  else
    if screen:frame().w < screen:frame().h then
      -- 4 * 8 for vertically aligned screen
      grid.setGrid('4 * 8', screen)
    else
      -- 8 * 4 for normal screen
      grid.setGrid('8 * 4', screen)
    end
  end
end

-- Some constructors, just for programming
function Cell(x, y, w, h)
  return hs.geometry(x, y, w, h)
end

-- Please leave a comment if you have any suggestions
-- I know this looks weird, but it works :C
current = {}
function init()
  current.win = hs.window.focusedWindow()
  current.scr = hs.window.focusedWindow():screen()
end

function current:new()
  init()
  o = {}
  setmetatable(o, self)
  o.window, o.screen = self.win, self.scr
  o.screenGrid = grid.getGrid(self.scr)
  o.windowGrid = grid.get(self.win)
  return o
end

-- -----------------------------------------------------------------------
--                   ** ALERT: GEEKS ONLY, GLHF  :C **                  --
--            ** Keybinding configurations locate at bottom **          --
-- -----------------------------------------------------------------------

local function maximizeWindow()
  local this = current:new()
  hs.grid.maximizeWindow(this.window)
end

local function centerOnScreen()
  local this = current:new()
  this.window:centerOnScreen(this.screen)
end

local function throwLeft()
  local this = current:new()
  this.window:moveOneScreenWest()
end

local function throwRight()
  local this = current:new()
  this.window:moveOneScreenEast()
end

local function leftHalf()
  local this = current:new()
  local cell = Cell(0, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
  this.window.setShadows(true)
end

local function rightHalf()
  local this = current:new()
  local cell = Cell(0.5 * this.screenGrid.w, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

local function topHalf()
  local this = current:new()
  local cell = Cell(0, 0, this.screenGrid.w, 0.5 * this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

local function bottomHalf()
  local this = current:new()
  local cell = Cell(0, 0.5 * this.screenGrid.h, this.screenGrid.w, 0.5 * this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

local function rightToLeft()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w - 1, this.windowGrid.h)
  if this.windowGrid.w > 1 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Small Enough :)")
  end
end

local function rightToRight()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w + 1, this.windowGrid.h)
  if this.windowGrid.w < this.screenGrid.w - this.windowGrid.x then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Touching Right Edge :|")
  end
end

local function bottomUp()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w, this.windowGrid.h - 1)
  if this.windowGrid.h > 1 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Small Enough :)")
  end
end

local function bottomDown()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w, this.windowGrid.h + 1)
  if this.windowGrid.h < this.screenGrid.h - this.windowGrid.y then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Touching Bottom Edge :|")
  end
end

local function leftToLeft()
  local this = current:new()
  local cell = Cell(this.windowGrid.x - 1, this.windowGrid.y, this.windowGrid.w + 1, this.windowGrid.h)
  if this.windowGrid.x > 0 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Touching Left Edge :|")
  end
end

local function leftToRight()
  local this = current:new()
  local cell = Cell(this.windowGrid.x + 1, this.windowGrid.y, this.windowGrid.w - 1, this.windowGrid.h)
  if this.windowGrid.w > 1 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Small Enough :)")
  end
end

local function topUp()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y - 1, this.windowGrid.w, this.windowGrid.h + 1)
  if this.windowGrid.y > 0 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Touching Top Edge :|")
  end
end

local function topDown()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y + 1, this.windowGrid.w, this.windowGrid.h - 1)
  if this.windowGrid.h > 1 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Small Enough :)")
  end
end

-- -----------------------------------------------------------------------
--                           ** Key Binding **                          --
-- -----------------------------------------------------------------------
key = require "hs.hotkey"
------------------------ * Move window to screen * -----------------------
hs.hotkey.bind({"ctrl", "alt"}, "left", throwLeft)
hs.hotkey.bind({"ctrl", "alt"}, "right", throwRight)
-------------------- * Set Window Position on screen* --------------------
hs.hotkey.bind({"ctrl", "alt", "cmd" }, "m", maximizeWindow)    -- ⌃⌥⌘ + M
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "c", centerOnScreen)     -- ⌃⌥⌘ + C
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "left", leftHalf)        -- ⌃⌥⌘ + ←
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", rightHalf)      -- ⌃⌥⌘ + →
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "up", topHalf)           -- ⌃⌥⌘ + ↑
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "down", bottomHalf)      -- ⌃⌥⌘ + ↓
-------------------- * Set Window Position on screen* --------------------
hs.hotkey.bind({"ctrl", "alt", "shift"}, "left", rightToLeft)   -- ⌃⌥⇧ + ←
hs.hotkey.bind({"ctrl", "alt", "shift"}, "right", rightToRight) -- ⌃⌥⇧ + →
hs.hotkey.bind({"ctrl", "alt", "shift"}, "up", bottomUp)        -- ⌃⌥⇧ + ↑
hs.hotkey.bind({"ctrl", "alt", "shift"}, "down", bottomDown)    -- ⌃⌥⇧ + ↓
-------------------- * Set Window Position on screen* --------------------
hs.hotkey.bind({"alt", "cmd", "shift"}, "left", leftToLeft)     -- ⌥⌘⇧ + ←
hs.hotkey.bind({"alt", "cmd", "shift"}, "right", leftToRight)   -- ⌥⌘⇧ + →
hs.hotkey.bind({"alt", "cmd", "shift"}, "up", topUp)            -- ⌥⌘⇧ + ↑
hs.hotkey.bind({"alt", "cmd", "shift"}, "down", topDown)        -- ⌥⌘⇧ + ↓

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