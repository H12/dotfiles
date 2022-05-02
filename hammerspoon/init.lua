hs.window.animationDuration = 0 -- disable animations

local defaultPadding = 8
local defaultMash  = { 'ctrl', 'alt', 'cmd' }

function move(x, y, w, h, p)
	p = p or defaultPadding

	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	local aspectRatio = max.w / max.h

	local xOffset = (x == 0) and 0 or p / 2
	local yOffset = (y == 0) and 0 or p / 2
	local wOffset = (w == 1) and 2 or 1.5
	local hOffset = (h == 1) and 2 or 1.5

	f.x = max.x + (max.w * x) + (p - xOffset)
	f.y = max.y + (max.h * y) + (p - yOffset)
	f.w = max.w * w - (p * wOffset)
	f.h = max.h * h - (p * hOffset)

	-- If calling `center`...
	if (p > defaultPadding) then
		f.w = f.w - (p * aspectRatio) * 2
		f.x = f.x + (p * aspectRatio)
	end

	win:setFrame(f)
end

function bindHotkey(key, func, mash)
	mash = mash or defaultMash
	hs.hotkey.bind(mash, key, func)
end

function center()        move(0.0, 0.0, 1.0, 1.0, 84) end
function fill()          move(0.0, 0.0, 1.0, 1.0) end
function top50()         move(0.0, 0.0, 1.0, 0.5) end
function left60()        move(0.0, 0.0, 0.58, 1.0) end
function left50()        move(0.0, 0.0, 0.5, 1.0) end
function left40()        move(0.0, 0.0, 0.42, 1.0) end
function right60()       move(0.42, 0.0, 0.58, 1.0) end
function right50()       move(0.5, 0.0, 0.5, 1.0) end
function right40()       move(0.58, 0.0, 0.42, 1.0) end
function bottom50()      move(0.0, 0.5, 1.0, 0.5) end
function topLeft50()     move(0.0, 0.0, 0.5, 0.5) end
function topRight50()    move(0.5, 0.0, 0.5, 0.5) end
function bottomLeft50()  move(0.0, 0.5, 0.5, 0.5) end
function bottomRight50() move(0.5, 0.5, 0.5, 0.5) end
function topLeft40()     move(0.0, 0.0, 0.42, 0.5) end
function topRight40()    move(0.58, 0.0, 0.42, 0.5) end
function bottomLeft40()  move(0.0, 0.5, 0.42, 0.5) end
function bottomRight40() move(0.58, 0.5, 0.42, 0.5) end

bindHotkey("C", center)
bindHotkey("F", fill)
bindHotkey("K", top50)
bindHotkey("N", left40)
bindHotkey("H", left50)
bindHotkey("U", left60)
bindHotkey("I", right40)
bindHotkey("L", right50)
bindHotkey("M", right60)
bindHotkey("J", bottom50)
bindHotkey("1", topLeft50)
bindHotkey("2", topRight50)
bindHotkey("3", bottomRight50)
bindHotkey("4", bottomLeft50)
bindHotkey("5", topLeft40)
bindHotkey("6", topRight40)
bindHotkey("7", bottomRight40)
bindHotkey("8", bottomLeft40)
