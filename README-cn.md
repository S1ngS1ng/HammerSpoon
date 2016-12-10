HammerSpoon config file - by S1ngS1ng
=======

[![English](https://jaywcjlove.github.io/sb/lang/english.svg)](./README.md) [![Chinese](https://jaywcjlove.github.io/sb/lang/chinese.svg)](./README-cn.md)

> 太长不看：[点我安装](#安装)

# 功能概述
* [窗口管理](./window-management.lua)
    * 最大化窗口 (并不是 MacOS 的全屏模式)
    * 将当前窗口移动到另一屏幕
    * **直接**将窗口大小设置为当前的一半（上下左右四个方向）
    * 向**任意**方向调整窗口大小
* **新功能** [VOX 音乐播放器](./vox-control.lua) - 已加入官方 API，可以通过 [hs.vox](http://www.hammerspoon.org/docs/hs.vox.html) 调用。提供如下接口：
    * 播放、暂停、下一首、上一首、快进、快退、调整音量等基本操作
    * 添加 URL 到 VOX, 播放 URL 以及显示/隐藏播放列表等高级功能
    * 获取当前播放曲目信息，提供歌名、歌手、专辑、播放状态等信息
* **正在开发** [全局类 Vim 快捷键绑定]
    * `Ctrl + h` 左（光标向左，下同）
    * `Ctrl + j` 下
    * `Ctrl + k` 上
    * `Ctrl + l` 右
    * 可以与 `alt`, `shift`, `cmd` 搭配使用，实现按词移动、移到行首行尾以及选中

# 示例
## VOX
* 显示当前曲目信息 (分别为歌名，专辑名以及歌手名)

![TrackInfo](./assets/vox-track-info.jpg)

## 窗口管理
* 居中和最大化

![Imgur](http://i.imgur.com/okNaoJW.gif)

* 快速布局到 1/2 屏幕

![Imgur](http://i.imgur.com/VNo7nCI.gif)

* 调整大小（以左边和上边为基准，调整右边和下边）

![Imgur](http://i.imgur.com/vIqDMUD.gif)

* 调整大小（以右边和下边为基准，调整左边和上边）

![Imgur](http://i.imgur.com/fiIfeXe.gif)

# 安装
* **首先**安装 [HammerSpoon](https://github.com/Hammerspoon/hammerspoon)
* 下载、拷贝或者直接 `git clone` 这些文件：
    * [init.lua](https://github.com/S1ngS1ng/HammerSpoon/blob/master/init.lua) - 主程序入口
    * [window-management.lua](https://github.com/S1ngS1ng/HammerSpoon/blob/master/window-management.lua) - 窗口管理
    * [vox-control.lua](https://github.com/S1ngS1ng/HammerSpoon/blob/master/vox-control.lua) - VOX 播放器控制
* 将 `init.lua`, `window-management.lua` 和 `vox.control.lua` 放到 `~/.hammerspoon` 路径下

# 快捷键
## 窗口管理
* 将窗口移动到另一屏幕
	* `Ctrl-Alt + Left` - 将当前窗口移动到左侧的屏幕
	* `Ctrl-Alt + Right` - 将当前窗口移动到右侧屏幕
* 窗口最大化
	* `Ctrl-Alt-Command + M`
* 将窗口居中（注：会保持窗口高度）
	* `Ctrl-Alt-Command + C`
* 布局窗口至二分之一当前屏幕大小
	* `Ctrl-Alt-Command + Left` - 窗口占屏幕左半部分
	* `Ctrl-Alt-Command + Right` - 窗口占屏幕右半部分
	* `Ctrl-Alt-Command + Up` - 窗口占屏幕上半部分
	* `Ctrl-Alt-Command + Down` - 窗口占屏幕下半部分
* 调整窗口右边、下边位置（保持左边、上边不变）
	* `Ctrl-Alt-Shift + Left` - 右边左移（窗口变小）
	* `Ctrl-Alt-Shift + Right` - 右边右移（窗口变大）
	* `Ctrl-Alt-Shift + Up` - 下边上移（窗口变小）
	* `Ctrl-Alt-Shift + Down` - 下边下移（窗口变大）
* 调整窗口左边、上边位置（保持右边、下边不变）
	* `Alt-Command-Shift + Left` - 左边左移（窗口变大）
	* `Alt-Command-Shift + Right` - 左边右移（窗口变小）
	* `Alt-Command-Shift + Up` - 上边上移（窗口变大）
	* `Alt-Command-Shift + Down` - 上边下移（窗口变小）

## VOX
* `Alt-Command-Shift + J` 播放/暂停
* `Alt-Command-Shift + H` 上一首
* `Alt-Command-Shift + L` 下一首
* `Alt-Command-Shift + K` 显示当前歌曲信息

# 写在最后
* 个人建议，在 `init.lua` 中将动画效果取消（设为 0）
* 如果你在使用中发现任何问题、欢迎提交 Issue 或者 PR，我会尽快处理
* 如果你有任何想法、意见或者建议，欢迎联系我


