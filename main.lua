local mainhelperspackage = require("mainhelpers")
local colourspackage = require("colours")
local uipackage = require("ui")
local debugpackage = require("debugfunc")


-- INFO: Over write call back functions

-- INFO: load assets for setup
function love.load()

	love.graphics.setBlendMode("alpha")	
	running = true
	frame = 0
	-- press 'd' when program running to start debug mode
	help = mainhelperspackage
	colours = colourspackage:New()
	
	-- checks colours has keys/values
		-- dont remove this check, exits if empty/nil
	if help.len(colours) == 0 then
		message = "colours is len 0"
		print("\27[31mERROR: \27[0m"..message)
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
	font = love.graphics.newFont(window.fontsize) -- font size
	love.graphics.setFont(font)

	ui = uipackage:New()

	debug = debugpackage:New()

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
		
		-- debug mode options
		if debug.active then 
			-- add mouse cords to debug store
			if debug.mode == "line" then
				local mousex, mousey = love.mouse.getPosition()
				debug:addToStore({mousex, mousey})
			end
		end

	end

end

-- INFO: KEYBOARD
function love.keypressed(key, scancode, isrepeat)
	-- exit programe with 'Esc' key
	if key == "escape" and isrepeat ~= true then
		love.event.quit() -- WARNING: IOS doesn't like this and may cause restart instead
	elseif key == "d" then
		debug:toggle()
	end

	-- changes the debug mode if active
	if debug.active then
		debug:setMode(key)
	end
end

-- INFO: update application state
function love.update(dt) 				-- TODO: take a look at frame rate, things are being called to many times
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
			local offsetx = ui.canvas.x
			local offsety = ui.canvas.y
			local toX = window.mouse.cords.to.x - offsetx
			local toY = window.mouse.cords.to.y - offsety
			local fromX = window.mouse.cords.from.x - offsetx
			local fromY = window.mouse.cords.from.y - offsety

			love.graphics.setCanvas(ui.canvas.canvas)
--			love.graphics.setBlendMode("alpha", "premultiplied") -- WARNING: colours appear darker than they should, this will be a problem later
			
			love.graphics.setColor(ui.canvas.paint)

			-- TODO: DRAW FROM - TO: 
				-- draw cicle at point from and to, then recuse drawing a point at middle of points until vectors are less than ui.canvas.brushSize/2 distance
			-- TEST: vvv
				-- INFO: This is here as a backup. just in case I cant get vectors to work and need to fall back on this
					-- WARNING: looks horrible
				--love.graphics.setLineWidth(ui.canvas.brushSize)
				--love.graphics.line(fromX, fromY, toX, toY)
			-- TEST: ^^^

			-- updates canvas
			if not debug.active then
				help.line(fromX, fromY, toX, toY)
				love.graphics.circle(
					"fill", 
					toX, 
					toY, 
					ui.canvas.brushSize/2
				)
			else 
				-- handles debug mode
				if debug.mode == "line" then 
					if help.len(debug.store) == 2 then
						debug:line(help.line, offsetx, offsety)
					end
				end

			end

			-- TEST: vvv
--			if debug.active then
--				if help.len(debug.store) == 2 then
--					local a = debugStore[1]
--					local b = debugStore[2]

--					local midx, midy = help.middlePoint(a.x, a.y, b.x, b.y)
			--		print("midx: "..midx..", midy: "..midy)

					-- draw test line
--					love.graphics.setColor(colours.pallet.green)
--					love.graphics.line(a.x, a.y, b.x, b.y)
					
--					print()
--					print("distance: "..help.distance(a.x, a.y, b.x, b.y))
--					print("brush size: "..ui.canvas.brushSize)
--	this should be sooner		if help.distance(a.x, a.y, b.x, b.y) >= ui.canvas.brushSize then
--						-- draw center
--						love.graphics.setColor(colours.pallet.yellow)
--						love.graphics.circle(
--							"fill",
--							midx,
--							midy,
--							ui.canvas.brushSize/4 --- smaller for now
--						)
--					end

					



--					print()
					
--				end
--				
--			end

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

		print(ui.areas[2])

		
	end

	-- TEST: ^^
	

	-- shows when debug mode is active in the program
	if debug.active then
		love.graphics.draw(debug.debugIcon.canvas, 0, window.height-debug.debugIcon.height)	
	end

end
