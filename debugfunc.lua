local help = require("mainhelpers")
local colours = require("colours"):New()

local debug = {}

function debug:New()
	local obj = {active = false, mode = "none", store = {}, debugIcon = {text = "D", colour = colours.debug.green}} 	

	self.__index = self
	return setmetatable(obj, self)
end

-- sets the debug mode
function debug:setMode(char)
	if char == nil then
		self.mode = "none"

	-- debug line drawing 
	elseif char == "l" then
		self.mode = "line"
		print(colours.DebugMode..self.mode)
	end
end

-- shows visual debug indicator in program
function debug:showIcon()
	local toolbar = ui.areas[2]
	local x = toolbar.width/2
	local y = window.height-(window.fontsize*2)

	local icon = self.debugIcon
	local iconWidth = font:getWidth(icon.text)
	local iconHeight = font:getHeight(icon.text)

	love.graphics.setColor(icon.colour)
	love.graphics.print(icon.text, x-iconWidth/2, y-(iconHeight/2))
	
	if self.mode ~= "none" then 
		local modeWidth = font:getWidth(self.mode)
		love.graphics.print(self.mode, x, y, 0, 0.5, 0.5, x, -(iconWidth+10))
	end
	
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
