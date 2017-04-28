HammerSpoon config file - by S1ngS1ng
=======

[![English](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/S1ngS1ng/HammerSpoon) [![Chinese](https://jaywcjlove.github.io/sb/lang/chinese.svg)](./README-cn.md)

> tl;dr [Click Me](#install)

# Features
* [Window Management](./window-management.lua)
    * Maximize window (not the full-screen mode)
    * Move window to another screen
    * Set window size **immediately** to half of the current screen toward **ANY** direction
    * Stretch or shrink window size toward **ANY** direction
    * **NEW Feature** Windows-like "relative" window cycle, just like `winKey + left/right` on Windows OS
* **NEW Feature** [VOX Music Player](./vox-control.lua) - Now merged as [hs.vox](http://www.hammerspoon.org/docs/hs.vox.html)
    * Basic commands such as `play`, `pause`, `next`, `forward`, `fastForward`, `increaseVolume` and so on
    * Advanced commands such as `addurl`, `playurl` and `togglePlaylist`
    * Retrieve song information such as `song title`, `artist`, `album`, `playerState` and so on
* **NEW Feature** [Global VIM-like Key Binding](./vim-binding.lua) (Thanks to [@A-RON](https://github.com/asmagill))
    * `Ctrl` + `hjkl` for `Left, Down, Up and Right`
    * Works with combinations of `Alt`, `Cmd` and `Shift`

# Example
## VIM Key Binding
![vim-key-binding](./assets/vim-key-binding(block-caret).gif)

## VOX
* Show track info (Track Title, Album, Artist)

![TrackInfo](./assets/vox-track-info.jpg)

## Window Management
* Centering and Maximize

![Imgur](http://i.imgur.com/okNaoJW.gif)

* Half the screen

![Imgur](http://i.imgur.com/VNo7nCI.gif)

* Resize (anchor top, left)

![Imgur](http://i.imgur.com/vIqDMUD.gif)

* Resize (anchor bottom, right)

![Imgur](http://i.imgur.com/fiIfeXe.gif)

# Install
* Install [HammerSpoon](https://github.com/Hammerspoon/hammerspoon)  **FIRST** 
* Download, Copy or `git clone` the following files:
    * [init.lua](https://github.com/S1ngS1ng/HammerSpoon/blob/master/init.lua) - Main entrance
    * [key-binding.lua](https://github.com/S1ngS1ng/HammerSpoon/blob/master/key-binding.lua) - Key mapping for window-management
    * [vim-binding.lua](https://github.com/S1ngS1ng/HammerSpoon/blob/master/vim-binding.lua) - vim-like key binding
    * [vox-control.lua](https://github.com/S1ngS1ng/HammerSpoon/blob/master/vox-control.lua) - VOX player control
    * [window-management.lua](https://github.com/S1ngS1ng/HammerSpoon/blob/master/window-management.lua) - Window management
* Put `init.lua`, `key-binding.lua`, `vim-binding.lua`, `vox-control.lua` and `window-management.lua` in ~/.hammerspoon

# Shortcuts

## Window Management
* Move window to another screen
	* `Ctrl-Alt + Left` - Set current window to the Left screen
	* `Ctrl-Alt + Right` - Set current window to the Right screen
* Set window size to full screen
	* `Ctrl-Alt-Command + M`
* Set window to center (keep window height)
	* `Ctrl-Alt-Command + C`
* Set window size to **EXACTLY** half of the current screen
	* `Ctrl-Alt-Command + Left` - Half the width, stick to Left
	* `Ctrl-Alt-Command + Right` - Half the width, stick to Right
	* `Ctrl-Alt-Command + Up` - Half the width, stick to Top
	* `Ctrl-Alt-Command + Down` - Half the width, stick to Bottom
* Adjust window size (anchor top, left)
	* `Ctrl-Alt-Shift + Left` - Move Right edge to the Left
	* `Ctrl-Alt-Shift + Right` - Move Right edge to the Right
	* `Ctrl-Alt-Shift + Up` - Move Bottom edge Up
	* `Ctrl-Alt-Shift + Down` - Move Bottom edge Down
* Adjust window size (anchor right, bottom)
	* `Alt-Command-Shift + Left` - Move Left edge to the Left
	* `Alt-Command-Shift + Right` - Move Left edge to the Right
	* `Alt-Command-Shift + Up` - Move Top edge Up
	* `Alt-Command-Shift + Down` - Move Top edge Down
* Windows-like window cycle (Just like winKey + left/right on Windows OS)
    * `Ctrl-Alt-Command + u` - Move window to the "relative" left and resize to half of the screen
    * `Ctrl-Alt-Command + i` - Move window to the "relative" right and resize to half of the screen

## VOX
* `Alt-Command-Shift + J` - Toggle Play and Pause
* `Alt-Command-Shift + H` - Previous song
* `Alt-Command-Shift + L` - Next song
* `Alt-Command-Shift + K` - Display track information
* `Alt-Command-Shift + I` - Toggle Playlist

## VIM-like key binding (I already map `Ctrl` to `CapsLock`)
* Basic
    * `Ctrl + h` - Left
    * `Ctrl + j` - Down
    * `Ctrl + k` - Up
    * `Ctrl + l` - Right
* Use with `Alt`
    * `Ctrl-Alt + H` - Move caret Left by 1 word
    * `Ctrl-Alt + L` - Move caret Right by 1 word
* Use with `Cmd`
    * `Ctrl-Cmd + H` - Move caret to the start of line
    * `Ctrl-Cmd + L` - Move caret to the end of line
* Use with `Shift`
    * For all the listed above, hold `Shift` at the same time will do selection

# Tips
* I would recommend to disable animation. Especially for resize anchoring Bottom, Right
* Feel free to open an issue or submit your Pull Request ^_^
* Any suggestions, comments, thoughts are all welcome
