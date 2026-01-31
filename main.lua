local mainhelperspackage = require("mainhelpers")
local colourspackage = require("colours")
local uipackage = require("ui")


-- INFO: Over write call back functions

-- INFO: load assets for setup
function love.load()
	
	running = true
	frame = 0
	help = mainhelperspackage
	colours = colourspackage:New()
	
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
		-- WARNING: window.mouse.cords.lastx/y can be nil, use current.x/y by default
		mouse = {
			cords = { 
				last= {x=nil, y=nil}, current = {x=0,y=0}
			}
		},
		theme = colours.theme.adventofcode,
		drawing = false,
		-- INFO: other variables set during ui creation
		-- primaryColour 
	}

	love.graphics.setBackgroundColor(unpack(window.theme.background))
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
	-- if drawing set last cords to current before updating current
	if window.drawing then
		window.mouse.cords.last.x = window.mouse.cords.current.x
		window.mouse.cords.last.y = window.mouse.cords.current.y

		window.mouse.cords.current.x = x
		window.mouse.cords.current.y = y
	else
		window.mouse.cords.current.x = x
		window.mouse.cords.current.y = y
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then
		window.drawing = true
	end
end

function love.mousereleased(x, y, button, istouch, presses)
	if button == 1 then
		window.drawing = false
		-- set last cords back to nil when drawing stopped
		window.mouse.cords.last.x = nil
		window.mouse.cords.last.y = nil
	end
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
	if window.drawing then
		if ui.canvas:CursorHover() then
			love.graphics.setCanvas(ui.canvas.canvas) -- draws to the canvas element
			love.graphics.setBlendMode("alpha", "premultiplied") -- WARNING: colours appear darker than they should, this will be a problem later
			
			-- canvas gets an offest of canvas.x/y, so it most be reflected when adding to the canvas
			love.graphics.setColor(ui.canvas.paint)
			love.graphics.circle(
				"fill", 
				window.mouse.cords.current.x-ui.canvas.x, 
				window.mouse.cords.current.y-ui.canvas.y, 
				ui.canvas.brushSize/2
			)
-- TEST: vvv

-- TEST: ^^^

			love.graphics.setCanvas() -- resets the canvas to main canvas
		end
	end

end

-- INFO: render to window
function love.draw()
	if running ~= true then
		return
	end
	
	ui:Draw()


	-- TEST: vv
	if frame <= 1 then
		print("window\nwidth: " .. window.width .. " height: " .. window.height)
		ui:Debug()
		
	end 

end
