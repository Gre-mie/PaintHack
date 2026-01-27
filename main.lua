local mainhelperspackage = require("mainhelpers")
local colourspackage = require("colours")
local uipackage = require("ui")


-- INFO: Over write call back functions

-- INFO: load assets for setup
function love.load()
	
	running = true
	frame = 0
	colours = colourspackage
	help = mainhelperspackage
	
	-- checks colours has keys/values
		-- dont remove this check, exits if empty/nil
	if help.len(colours) == 0 then
		message = "colours is len 0"
		print("\27[31mERROR: ", message)
		-- TODO: add to logs
		love.event.quit(1) -- WARNING: IOS doesn't like this and may cause restart instead

	end
	
	window = { 
		width = love.graphics.getWidth(), 
		height = love.graphics.getHeight(), 
		fontsize = 32,
		activeButton = "pen",
		mouse = {cords = {0,0}},
	}

	love.graphics.setBackgroundColor(0.50, 0.50, 0.52)
	local font = love.graphics.newFont(window.fontsize) -- font size
	love.graphics.setFont(font)

	ui = uipackage:New()
	if running ~= true then
		return -- may not be working
	end


end

-- INFO: user detection functions

-- INFO: MOUSE
function love.mousemoved(x, y, dx, dy, istouch)
	window.mouse.cords[1] = x
	window.mouse.cords[2] = y
end

function love.mousepressed(x, y, button, istouch, presses)
--	if ui.canvas:CursorHover() -- TEST: NEED TO SET VARAIBLE ON WINDOW, HAS FOCUS
end

function love.mousereleased(x, y, button, istouch, presses)
	--
end

-- INFO: KEYBOARD
function love.keypressed(key, scancode, isrepeat)
	-- exit programe with 'Esc' key
	if key == "escape" and isrepeat ~= true then
		love.event.quit() -- WARNING: IOS doesn't like this and may cause restart instead
	end

end

-- INFO: update application state
function love.update(dt)
	if running ~= true then
		return
	end
	frame = frame + 1
end

-- INFO: render to window
function love.draw()
	if running ~= true then
		return
	end

	-- TEST: vv
	if frame <= 1 then
		print("window\nwidth: " .. window.width .. " height: " .. window.height)
		ui:Debug()
		--ui:Debug("areas")
	end 
	-- TEST: ^^

	ui:Draw()
end
