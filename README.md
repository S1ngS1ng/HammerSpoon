# HammerSpoon
HammerSpoon config file

# Features
**All keyboard shortcuts**
> Based on grid system, it is easy to customize

* Maximize window (not the fullscreen mode)
* Move window to another screen
* Set window size **immediately** to half of the current screen toward **ANY** direction
* Stretch or shrink window size toward **ANY** direction

> Note that: I could add a `move window` feature to this, but I found it not useful to me.

# Install

* Install [HammerSpoon](https://github.com/Hammerspoon/hammerspoon)  **FIRST** 
* Download, Copy or `git clone` [my config file](https://github.com/S1ngS1ng/HammerSpoon/blob/master/init.lua)
* Put the `init.lua` in ~/.hammerspoon

# Shortcuts
* Move window to another screen
	* `Ctrl-Alt + Left`	Set current window to the Left screen
	* `Ctrl-Alt + Right`	Set current window to the Right screen
* Set window size to full screen
	* `Ctrl-Alt-Command + M`
* Set window to center (keep window height)
	* `Ctrl-Alt-Command + C`
* Set window size to **EXACTLY** half of the current screen
	* `Ctrl-Alt-Command + Left`	Half the width, stick to Left
	* `Ctrl-Alt-Command + Right`	Half the width, stick to Right
	* `Ctrl-Alt-Command + Up`		Half the width, stick to Top
	* `Ctrl-Alt-Command + Down`	Half the width, stick to Bottom
* Adjust window size (anchor top, left)
	* `Ctrl-Alt-Shift + Left`	Move Right edge to the Left
	* `Ctrl-Alt-Shift + Right`	Move Right edge to the Right
	* `Ctrl-Alt-Shift + Up`		Move Bottom edge Up
	* `Ctrl-Alt-Shift + Down`	Move Bottom edge Down
* Adjust window size (anchor right, bottom)
	* `Alt-Command-Shift + Left`	Move Left edge to the Left
	* `Alt-Command-Shift + Right`	Move Left edge to the Right
	* `Alt-Command-Shift + Up`		Move Top edge Up
	* `Alt-Command-Shift + Down`	Move Top edge Down

# Example
> Incase you might be confused

* Centering and Maximize

![Imgur](http://i.imgur.com/okNaoJW.gif)

* Half the screen

![Imgur](http://i.imgur.com/VNo7nCI.gif)

* Resize (anchor top, left)

![Imgur](http://i.imgur.com/vIqDMUD.gif)

* Resize (anchor bottom, right)

![Imgur](http://i.imgur.com/fiIfeXe.gif)

# Tips

* I would recommend to disable animation. Especially for resize anchoring Bottom, Right
* Feel free to open an issue or submit your Pull Request ^_^
* Any suggestions, comments, thoughts are all welcome
