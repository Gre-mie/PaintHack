-- INFO: Over write call back functions

-- INFO: load assets for setup
function love.load()
	love.graphics.setBackgroundColor(0.1, 0, 0.2) -- TEST:
	love.graphics.setColor(0.5, 0.1, 0.4) -- TEST:
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
	--
end

-- INFO: render to window
function love.draw()
	love.graphics.circle("fill", 200, 200, 50) -- TEST:
end
