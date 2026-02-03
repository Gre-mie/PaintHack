local help = require("mainhelpers")
local colours = require("colours"):New()

local debug = {}

function debug:New()
	local obj = {active = false, mode = "none", store = {}, debugIcon = {
		text = "D", 
		colour = colours.debug.green, 
		width = ui.areas[2].width,
		height = ui.areas[2].width,
		},
		wait = false, -- varible used to halt other parts of the code
	}

	-- add icon canvas
	obj.debugIcon.canvas = love.graphics.newCanvas(obj.debugIcon.width, obj.debugIcon.height)



	self.__index = self
	return setmetatable(obj, self)
end

-- clears and adds to the debug icon canvas
function debug:setDebugIcon()
	local icon = self.debugIcon

	love.graphics.setCanvas(icon.canvas)
	love.graphics.clear()
	love.graphics.setColor(icon.colour)

	local iconWidth = font:getWidth(icon.text)
	love.graphics.print(icon.text, (icon.width/2)-(iconWidth/2), 0)

	if self.mode ~= "none" then
		local modeWidth = font:getWidth(self.mode)
		local iconHeight = font:getHeight(icon.height)

		love.graphics.print(self.mode, icon.width/2, iconHeight, 0, 0.5, 0.5, modeWidth/2, 0)

	end

	love.graphics.setCanvas()
end

-- sets the debug mode and changes the debugIcon canvas
function debug:setMode(char)
	if char == nil then
		self.mode = "none"

	-- debug line drawing 
	elseif char == "l" then
		self.mode = "line"
		print(colours.DebugMode..self.mode)

	-- doesn't do anything
	elseif char == "t" then
		self.mode = "test"
		self:setDebugIcon()
		print(colours.DebugMode..self.mode)
	end
	self:setDebugIcon()
end

-- use when 
function debug:toggle()
	self.active = not self.active
		if self.active then
			print(colours.DebugMode.."ON")
		else
			self:setMode()
			-- clears the canvas when debug mode is turned off
			love.graphics.setCanvas(ui.canvas.canvas)
			love.graphics.clear()
			love.graphics.setCanvas()
			print(colours.DebugMode.."OFF")
		end
end

function debug:addToStore(item)

	-- if line
	if self.mode == "line" then
		local x, y = unpack(item)
		if x == nil or y == nil then
			message = "Debug mode \"line\" requires {x,y} when adding to debug.store"
			print(colours.Error..message)
			-- TODO: add to logs
			love.event.quit(1) -- WARNING: IOS doesn't like this and may cause restart instead
			return
		end
		
		-- add point to debug store and draw the point to the canvas
		if help.len(self.store) < 2 and not self.wait then
			table.insert(self.store, item)

			print("---- frame: "..frame.."----") -- TEST:

			print("add point x: "..x..", y: "..y)
			
			love.graphics.setCanvas(ui.canvas.canvas)
					
			love.graphics.setColor(colours.pallet.red)
			love.graphics.circle(
				"fill",
				x - ui.canvas.x,
				y - ui.canvas.y,
				ui.canvas.brushSize/2
			)

			love.graphics.setCanvas()	
		else 
			self.wait = false -- take back functionality
		end


	end
end

-- calls the line function with debug settings
function debug:line(func, offsetx, offsety)
	if help.len(self.store) == 2 then

		local a = self.store[1]
		local b = self.store[2]

		print("aX: "..a[1]..", aY: "..a[2])
		print("bX: "..b[1]..", bY: "..b[2])
		print()

		love.graphics.setColor(colours.pallet.yellow)
		func(a[1]-offsetx, a[2]-offsety, b[1]-offsetx, b[2]-offsety)

		-- reset store
		self.wait = true
		self.store = {}
	end

end


return debug
