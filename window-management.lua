-- -----------------------------------------------------------------------
--                         ** Something Global **                       --
-- -----------------------------------------------------------------------
  -- Comment out this following line if you wish to see animations
hs.window.animationDuration = 0
grid = require "hs.grid"
grid.setMargins('0, 0')

module = {}

-- Set screen watcher, in case you connect a new monitor, or unplug a monitor
screens = {}
screenArr = {}
local screenwatcher = hs.screen.watcher.new(function()
  screens = hs.screen.allScreens()
end)
screenwatcher:start()

-- Construct list of screens
indexDiff = 0
for index=1,#hs.screen.allScreens() do
  local xIndex,yIndex = hs.screen.allScreens()[index]:position()
  screenArr[xIndex] = hs.screen.allScreens()[index]
end

-- Find lowest screen index, save to indexDiff if negative
hs.fnutils.each(screenArr, function(e)
  local currentIndex = hs.fnutils.indexOf(screenArr, e)
  if currentIndex < 0 and currentIndex < indexDiff then
    indexDiff = currentIndex
  end
end)

-- Set screen grid depending on resolution
  -- TODO: set grid according to pixels
for _index,screen in pairs(hs.screen.allScreens()) do
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

module.maximizeWindow = function ()
  local this = current:new()
  hs.grid.maximizeWindow(this.window)
end

module.centerOnScreen = function ()
  local this = current:new()
  this.window:centerOnScreen(this.screen)
end

module.throwLeft = function ()
  local this = current:new()
  this.window:moveOneScreenWest()
end

module.throwRight = function ()
  local this = current:new()
  this.window:moveOneScreenEast()
end

module.leftHalf = function ()
  local this = current:new()
  local cell = Cell(0, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
  this.window.setShadows(true)
end

module.rightHalf = function ()
  local this = current:new()
  local cell = Cell(0.5 * this.screenGrid.w, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

-- Windows-like cycle left
module.cycleLeft = function ()
  local this = current:new()
  -- Check if this window is on left or right
  if this.windowGrid.x == 0 then
    local currentIndex = hs.fnutils.indexOf(screenArr, current.scr)
    local previousScreen = screenArr[(currentIndex - indexDiff - 1) % #hs.screen.allScreens() + indexDiff]
    this.window:moveToScreen(previousScreen)
    module.rightHalf()
  else 
    module.leftHalf()
  end
end

-- Windows-like cycle right
module.cycleRight = function ()
  local this = current:new()
  -- Check if this window is on left or right
  if this.windowGrid.x == 0 then
    module.rightHalf()
  else
    local currentIndex = hs.fnutils.indexOf(screenArr, current.scr)
    local nextScreen = screenArr[(currentIndex - indexDiff + 1) % #hs.screen.allScreens() + indexDiff]
    this.window:moveToScreen(nextScreen)
    module.leftHalf()
  end
end

module.topHalf = function ()
  local this = current:new()
  local cell = Cell(0, 0, this.screenGrid.w, 0.5 * this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

module.bottomHalf = function ()
  local this = current:new()
  local cell = Cell(0, 0.5 * this.screenGrid.h, this.screenGrid.w, 0.5 * this.screenGrid.h)
  grid.set(this.window, cell, this.screen)
end

module.rightToLeft = function ()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w - 1, this.windowGrid.h)
  if this.windowGrid.w > 1 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Small Enough :)")
  end
end

module.rightToRight = function ()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w + 1, this.windowGrid.h)
  if this.windowGrid.w < this.screenGrid.w - this.windowGrid.x then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Touching Right Edge :|")
  end
end

module.bottomUp = function ()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w, this.windowGrid.h - 1)
  if this.windowGrid.h > 1 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Small Enough :)")
  end
end

module.bottomDown = function ()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w, this.windowGrid.h + 1)
  if this.windowGrid.h < this.screenGrid.h - this.windowGrid.y then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Touching Bottom Edge :|")
  end
end

module.leftToLeft = function ()
  local this = current:new()
  local cell = Cell(this.windowGrid.x - 1, this.windowGrid.y, this.windowGrid.w + 1, this.windowGrid.h)
  if this.windowGrid.x > 0 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Touching Left Edge :|")
  end
end

module.leftToRight = function ()
  local this = current:new()
  local cell = Cell(this.windowGrid.x + 1, this.windowGrid.y, this.windowGrid.w - 1, this.windowGrid.h)
  if this.windowGrid.w > 1 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Small Enough :)")
  end
end

module.topUp = function ()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y - 1, this.windowGrid.w, this.windowGrid.h + 1)
  if this.windowGrid.y > 0 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Touching Top Edge :|")
  end
end

module.topDown = function ()
  local this = current:new()
  local cell = Cell(this.windowGrid.x, this.windowGrid.y + 1, this.windowGrid.w, this.windowGrid.h - 1)
  if this.windowGrid.h > 1 then
    grid.set(this.window, cell, this.screen)
  else
    hs.alert.show("Small Enough :)")
  end
end

return module
