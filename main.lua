local mainhelperspackage = require("mainhelpers")
local colourspackage = require("colours")
local uipackage = require("ui")


-- INFO: Over write call back functions

-- INFO: load assets for setup
function love.load()
	
	running = true
	frame = 0
	debugMode = false
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
		-- WARNING: fromx/y can be nil and to.x/y can be nil. 
			-- use from and to when drawing to the canvas
			-- use current.x/y when drawing curser and checking cords
		mouse = {
			cords = { 
				from= {x=nil, y=nil}, to = {x=nil, y=nil}, current = {x=0,y=0}
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
	window.mouse.cords.current.x = x
	window.mouse.cords.current.y = y
end

function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then
		window.drawing = true
		window.mouse.cords.from.x = x
		window.mouse.cords.from.y = y
		window.mouse.cords.to.x = x
		window.mouse.cords.to.y = y
	end
end

function love.mousereleased(x, y, button, istouch, presses)
	if button == 1 then
		window.drawing = false
		-- set last cords back to nil when drawing stopped
		window.mouse.cords.from.x = nil
		window.mouse.cords.from.y = nil
	end
end

-- INFO: KEYBOARD
function love.keypressed(key, scancode, isrepeat)
	-- exit programe with 'Esc' key
	if key == "escape" and isrepeat ~= true then
		love.event.quit() -- WARNING: IOS doesn't like this and may cause restart instead
	elseif key == "f" then
		debugMode = not debugMode
		if debugMode then
			print(colours.DebugMode.."ON")
		else
			print(colours.DebugMode.."OFF")
		end
	end
end

-- INFO: update application state
function love.update(dt)
	if running ~= true then
		return
	end
	frame = frame + 1

	-- INFO: draws to the canvas element
	if window.drawing then
		
		
		if ui.canvas:CursorHover() then
			-- update last and to cords
			window.mouse.cords.from.x = window.mouse.cords.to.x
			window.mouse.cords.from.y = window.mouse.cords.to.y
			window.mouse.cords.to.x = window.mouse.cords.current.x
			window.mouse.cords.to.y = window.mouse.cords.current.y

			-- canvas gets an offest of canvas.x/y, so it most be reflected when adding to the canvas
			local toX = window.mouse.cords.to.x - ui.canvas.x
			local toY = window.mouse.cords.to.y - ui.canvas.y
			local fromX = window.mouse.cords.from.x - ui.canvas.x
			local fromY = window.mouse.cords.from.y - ui.canvas.y

			love.graphics.setCanvas(ui.canvas.canvas)
			love.graphics.setBlendMode("alpha", "premultiplied") -- WARNING: colours appear darker than they should, this will be a problem later
			
			love.graphics.setColor(ui.canvas.paint)

			-- TODO: DRAW FROM - TO: 
				-- draw cicle at point from and to, then recuse drawing a point at middle of points until vectors are less than ui.canvas.brushSize/2 distance
			-- TEST: vvv
				-- INFO: This is here as a backup. just in case I cant get vectors to work and need to fall back on this
					-- WARNING: looks horrible
				--love.graphics.setLineWidth(ui.canvas.brushSize)
				--love.graphics.line(fromX, fromY, toX, toY)
			-- TEST: ^^^


			love.graphics.circle(
				"fill", 
				toX, 
				toY, 
				ui.canvas.brushSize/2
			)



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
