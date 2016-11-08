--- === hs.vox ===
---
--- Controls for vox music player

local vox = {}

local alert = require "hs.alert"
local as = require "hs.applescript"
local app = require "hs.application"

--  TODO: DOUBLE CHECK
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

--- hs.vox.trackInfo()
--- Function
--- Displays information for current track on screen
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function vox.trackInfo()
  local artist = tell('artist') or "Unknown artist"
  local album  = tell('album') or "Unknown album"
  local track  = tell('track') or "Unknown track"
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
  return tell('artist')
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
  return tell('album')
end

--- hs.vox.getAlbumArtist()
--- Function
--- Gets the artist of current Album
---
--- Parameters:
---  * None
---
--- Returns:
---  * A string containing the artist of current Album, or nil if an error occurred
function vox.getAlbumArtist()
  return tell('album artist')
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
  return tell('track')
end

return vox
