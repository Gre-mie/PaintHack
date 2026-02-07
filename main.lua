local mainhelperspackage = require("mainhelpers")
local colourspackage = require("colours")
local uipackage = require("ui")
local debugpackage = require("debugfunc")
function love.load()
	love.graphics.setBlendMode("alpha")	
	running = true
	frame = 0
	help = mainhelperspackage
	colours = colourspackage:New()
	if help.len(colours) == 0 then
		message = "colours is len 0"
		print("\27[31mERROR: \27[0m"..message)
		love.event.quit(1)
	end
	window = { 
		width = love.graphics.getWidth(), 
		height = love.graphics.getHeight(), 
		fontsize = 32,
		activeButton = "pen",
		mouse = {
			cords = { 
				from= {x=nil, y=nil}, to = {x=nil, y=nil}, current = {x=0,y=0}
			}
		},
		theme = colours.theme.adventofcode,
		drawing = false,
	}
	love.graphics.setBackgroundColor(unpack(window.theme.background))
	font = love.graphics.newFont(window.fontsize)
	love.graphics.setFont(font)
	ui = uipackage:New()
	debug = debugpackage:New()
	if running ~= true then
		return
	end
end
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
		window.mouse.cords.from.x = nil
		window.mouse.cords.from.y = nil
		if debug.active then 
			if debug.mode == "line" then
				local mousex, mousey = love.mouse.getPosition()
				debug:addToStore({mousex, mousey})
			end
		end
	end
end
function love.keypressed(key, scancode, isrepeat)
	if key == "escape" and isrepeat ~= true then
		love.event.quit()
	elseif key == "d" then
		debug:toggle()
	end
	if debug.active then
		debug:setMode(key)
	end
end
function love.update(dt)
	if running ~= true then
		return
	end
	frame = frame + 1
	if window.drawing then
		if ui.canvas:CursorHover() then
			window.mouse.cords.from.x = window.mouse.cords.to.x
			window.mouse.cords.from.y = window.mouse.cords.to.y
			window.mouse.cords.to.x = window.mouse.cords.current.x
			window.mouse.cords.to.y = window.mouse.cords.current.y
			local offsetx = ui.canvas.x
			local offsety = ui.canvas.y
			local toX = window.mouse.cords.to.x - offsetx
			local toY = window.mouse.cords.to.y - offsety
			local fromX = window.mouse.cords.from.x - offsetx
			local fromY = window.mouse.cords.from.y - offsety
			love.graphics.setCanvas(ui.canvas.canvas)
			love.graphics.setColor(ui.canvas.paint)
			if not debug.active then
				help.line(fromX, fromY, toX, toY)
			else 
				if debug.mode == "line" then 
					if help.len(debug.store) == 2 then
						debug:line(help.line, offsetx, offsety)
					end
				end
			end
			love.graphics.setCanvas()
		end
	end
end
function love.draw()
	if running ~= true then
		return
	end
	ui:Draw()
	if debug.active then
		love.graphics.draw(debug.debugIcon.canvas, 0, window.height-debug.debugIcon.height)	
	end
end
