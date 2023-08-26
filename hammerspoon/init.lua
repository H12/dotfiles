hs.window.animationDuration = 0 -- disable animations

local defaultMash = { 'ctrl', 'alt', 'cmd' }

local function move(x, y, w, h, c, r, i, j, p)
	-- NOTE: In order to have sensible defaults, it is assumed that the
	-- maximum number of rows or columns is two. To create window
	-- arrangements with more than two rows or columns, values must be
	-- provided for c, r, i, and j.

	-- Default col/row count is 1 if w/h is 1, 2 if w/h is less than 1
	local col_count = c or (w == 1 and 1 or 2)
	local row_count = r or (h == 1 and 1 or 2)

	-- Default col/row index is 0 if x/y is 0, 1 if x/y is greater than 0
	local col_index = i or (x == 0 and 0 or 1)
	local row_index = j or (y == 0 and 0 or 1)

	-- Get window & screen objects
	local window = hs.window.focusedWindow()
	local screen = window:screen()
	local windowFrame = window:frame()
	local screenFrame = screen:frame()

	-- Set padding default to a value proportional to diagonal screen size
	local screenSize = math.sqrt(screenFrame.w ^ 2 + screenFrame.h ^ 2)
	local padding = p or screenSize / 200

	-- Set raw window positions & sizes without padding
	local xRaw = screenFrame.x + (screenFrame.w * x)
	local yRaw = screenFrame.y + (screenFrame.h * y)
	local wRaw = screenFrame.w * w
	local hRaw = screenFrame.h * h

	-- Set position & size offsets from padding, row/col count, & index
	local xOffset = padding * (col_count - col_index) / col_count
	local yOffset = padding * (row_count - row_index) / row_count
	local wOffset = padding * (col_count + 1) / col_count
	local hOffset = padding * (row_count + 1) / row_count

	-- Apply position and width values to the window
	windowFrame.x = xRaw + xOffset
	windowFrame.y = yRaw + yOffset
	windowFrame.w = wRaw - wOffset
	windowFrame.h = hRaw - hOffset
	window:setFrame(windowFrame)
end

local function bindHotkey(key, func, mash)
	mash = mash or defaultMash
	hs.hotkey.bind(mash, key, func)
end

local function center() move(0.125, 0.075, 0.75, 0.85) end
local function fill() move(0.0, 0.0, 1.0, 1.0) end
local function top50() move(0.0, 0.0, 1.0, 0.5) end
local function left60() move(0.0, 0.0, 0.58, 1.0) end
local function left50() move(0.0, 0.0, 0.5, 1.0) end
local function left40() move(0.0, 0.0, 0.42, 1.0) end
local function right60() move(0.42, 0.0, 0.58, 1.0) end
local function right50() move(0.5, 0.0, 0.5, 1.0) end
local function right40() move(0.58, 0.0, 0.42, 1.0) end
local function bottom50() move(0.0, 0.5, 1.0, 0.5) end
local function topLeft50() move(0.0, 0.0, 0.5, 0.5) end
local function topRight50() move(0.5, 0.0, 0.5, 0.5) end
local function bottomLeft50() move(0.0, 0.5, 0.5, 0.5) end
local function bottomRight50() move(0.5, 0.5, 0.5, 0.5) end
local function topLeft40() move(0.0, 0.0, 0.42, 0.5) end
local function topRight40() move(0.58, 0.0, 0.42, 0.5) end
local function bottomLeft40() move(0.0, 0.5, 0.42, 0.5) end
local function bottomRight40() move(0.58, 0.5, 0.42, 0.5) end
local function firstThird() move(0.0, 0.0, 1 / 3, 1.0, 3, 1, 0, 0) end
local function secndThird() move(1 / 3, 0.0, 1 / 3, 1.0, 3, 1, 1, 0) end
local function thirdThird() move(2 / 3, 0.0, 1 / 3, 1.0, 3, 1, 2, 0) end

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

bindHotkey(",", firstThird)
bindHotkey(".", secndThird)
bindHotkey("/", thirdThird)
