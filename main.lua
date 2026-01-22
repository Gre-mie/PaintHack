local uipackage = require("ui")
-- TODO: IMPORT COLOUR

-- INFO: Over write call back functions

-- INFO: load assets for setup
function love.load()
	-- TODO: add array of global colours

	window = { width = love.graphics.getWidth(), height = love.graphics.getHeight(), fontsize = 32 }

	love.graphics.setBackgroundColor(0.50, 0.50, 0.52)
	local font = love.graphics.newFont(window.fontsize) -- font size
	love.graphics.setFont(font)

	ui = uipackage:New()

	frame = 0
end

-- INFO: user detection functions

-- INFO: MOUSE
function love.mousemoved(x, y, dx, dy, istouch)
	--
end

function love.mousepressed(x, y, button, istouch, presses)
	--
end

function love.mousereleased(x, y, button, istouch, presses)
	--
end

-- INFO: KEYBOARD
function love.keypressed(key, scancode, isrepeat)
	--
end

-- INFO: update application state
function love.update(dt)
	frame = frame + 1
end

-- INFO: render to window
function love.draw()
	if frame <= 1 then
		print("window\nwidth: " .. window.width .. " height: " .. window.height)
		ui:Debug()
	end -- TEST:

	ui:Draw()
end
