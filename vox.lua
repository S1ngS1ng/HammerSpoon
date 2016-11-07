--- === hs.vox ===
---
--- Controls for vox music player

local vox = {}

local alert = require "hs.alert"
local as = require "hs.applescript"
local app = require "hs.application"

--- hs.vox.state_paused
--- Constant
--- Returned by `hs.vox.getPlaybackState()` to indicates vox is paused
vox.state_paused = "kPSp"

--- hs.vox.state_playing
--- Constant
--- Returned by `hs.vox.getPlaybackState()` to indicates vox is playing
vox.state_playing = "kPSP"

--- hs.vox.state_stopped
--- Constant
--- Returned by `hs.vox.getPlaybackState()` to indicates vox is stopped
vox.state_stopped = "kPSS"

-- Internal function to pass a command to Applescript.
local function tell(cmd)
  local _cmd = 'tell application "vox" to ' .. cmd
  local ok, result = as.applescript(_cmd)
  if ok then
    return result
  else
    return nil
  end
end

--- hs.vox.playpause()
--- Function
--- Toggles play/pause of current vox track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.playpause()
  tell('playpause')
end

--- hs.vox.play()
--- Function
--- Plays the current vox track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.play()
  tell('play')
end

--- hs.vox.pause()
--- Function
--- Pauses the current vox track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.pause()
  tell('pause')
end

--- hs.vox.next()
--- Function
--- Skips to the next vox track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.next()
  tell('next track')
end

--- hs.vox.previous()
--- Function
--- Skips to previous vox track
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.previous()
  tell('previous track')
end

--- hs.vox.displayCurrentTrack()
--- Function
--- Displays information for current track on screen
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.displayCurrentTrack()
  local artist = tell('artist of the current track') or "Unknown artist"
  local album  = tell('album of the current track') or "Unknown album"
  local track  = tell('name of the current track') or "Unknown track"
  alert.show(track .."\n".. album .."\n".. artist, 1.75)
end

--- hs.vox.getCurrentArtist()
--- Function
--- Gets the name of the artist of the current track
---
--- Parameters:
---  * None
---
--- Returns:
---  * A string containing the Artist of the current track, or nil if an error occurred
function vox.getCurrentArtist()
  return tell('artist of the current track')
end

--- hs.vox.getCurrentAlbum()
--- Function
--- Gets the name of the album of the current track
---
--- Parameters:
---  * None
---
--- Returns:
---  * A string containing the Album of the current track, or nil if an error occurred
function vox.getCurrentAlbum()
  return tell('album of the current track')
end

--- hs.vox.getCurrentTrack()
--- Function
--- Gets the name of the current track
---
--- Parameters:
---  * None
---
--- Returns:
---  * A string containing the name of the current track, or nil if an error occurred
function vox.getCurrentTrack()
  return tell('name of the current track')
end

--- hs.vox.getPlaybackState()
--- Function
--- Gets the current playback state of vox
---
--- Parameters:
---  * None
---
--- Returns:
---  * A string containing one of the following constants:
---    - `hs.vox.state_stopped`
---    - `hs.vox.state_paused`
---    - `hs.vox.state_playing`
function vox.getPlaybackState()
  return tell('get player state')
end

--- hs.vox.isRunning()
--- Function
--- Returns whether vox is currently open. Most other functions in hs.vox will automatically start the application, so this function can be used to guard against that.
---
--- Parameters:
---  * None
---
--- Returns:
---  * A boolean value indicating whether the vox application is running.
function vox.isRunning()
  return app.get("vox") ~= nil
end

--- hs.vox.isPlaying()
--- Function
--- Returns whether vox is currently playing
---
--- Parameters:
---  * None
---
--- Returns:
---  * A boolean value indicating whether vox is currently playing a track, or nil if an error occurred (unknown player state). Also returns false if the application is not running
function vox.isPlaying()
  -- We check separately to avoid starting the application if it's not running
  if not hs.vox.isRunning() then
    return false
  end
  state = hs.vox.getPlaybackState()
  if state == hs.vox.state_playing then
    return true
  elseif state == hs.vox.state_paused or state == hs.vox.state_stopped then
    return false
  else  -- unknown state
    return nil
  end
end

--- hs.vox.getVolume()
--- Function
--- Gets the vox volume setting
---
--- Paramters:
---  * None
---
--- Returns:
---  * A number containing the volume vox is set to between 1 and 100
function vox.getVolume() return tell'sound volume' end

--- hs.vox.setVolume(vol)
--- Function
--- Sets the vox volume setting
---
--- Parameters:
---  * vol - A number between 1 and 100
---
--- Returns:
---  * None
function vox.setVolume(v)
  v=tonumber(v)
  if not v then error('volume must be a number 1..100',2) end
  return tell('set sound volume to '..math.min(100,math.max(0,v)))
end

--- hs.vox.volumeUp()
--- Function
--- Increases the volume by 5
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.volumeUp() return vox.setVolume(vox.getVolume()+5) end

--- hs.vox.volumeDown()
--- Function
--- Reduces the volume by 5
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.volumeDown() return vox.setVolume(vox.getVolume()-5) end

--- hs.vox.getPosition()
--- Function
--- Gets the playback position (in seconds) in the current song
---
--- Parameters:
---  * None
---
--- Returns:
---  * A number indicating the current position in the song
function vox.getPosition() return tell'player position' end

--- hs.vox.setPosition(pos)
--- Function
--- Sets the playback position in the current song
---
--- Parameters:
---  * pos - A number containing the position (in seconds) to jump to in the current song
---
--- Returns:
---  * None
function vox.setPosition(p)
  p=tonumber(p)
  if not p then error('position must be a number in seconds',2) end
  return tell('set player position to '..p)
end

--- hs.vox.ff()
--- Function
--- Skips the playback position forwards by 5 seconds
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.ff() return vox.setPosition(vox.getPosition()+5) end

--- hs.vox.rw
--- Function
--- Skips the playback position backwards by 5 seconds
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.rw() return vox.setPosition(vox.getPosition()-5) end

return vox
