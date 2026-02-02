local help = require("mainhelpers")
local colours = require("colours"):New()

local debug = {}

function debug:New()
	local obj = {active = false, mode = "none", store = {}, debugIcon = {
		text = "D", 
		colour = colours.debug.green, 
		width = ui.areas[2].width,
		height = ui.areas[2].width,
	}}

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
			print(colours.DebugMode.."OFF")
		end
end

function debug:addPoint()
	if self.mode then

	end
end

function debug:line()
	print("debugging line")
end

-- calls functions determined on the mode
function debug:handler()
	if self.active then
		if self.mode == "line" then
			print("line Mode") -- TEST:
		end

	end
end



return debug
