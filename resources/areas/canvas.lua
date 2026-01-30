local canvas = {}

-- INFO: the drawing area of the window

function canvas:New(x, y, width, height)
	local obj = { name = "canvas", x = x, y = y, height = height, width = width, backgroundColour = nil, paint = colours.pallet.blue, brushSize = 20 }
	
	window.primaryColour = obj.paint
	self.__index = self
	return setmetatable(obj, self)
end

function canvas:Debug()
	helpUI.DebugElement(self)
	print()
end

-- INFO: checks if the cursor is in the draw area
-- @return bool
function canvas:CursorHover()
	x, y = window.mouse.cords.x, window.mouse.cords.y
	if x > self.x and
		-- must be slightly smaller on right side to handle cursor leaving the window
		x < (self.x + self.width)-1 and
		y > self.y and
		y < (self.y + self.height) then
		return true
	else return false end
end

-- draws the cursor
function canvas:DrawCursor()
	love.graphics.setColor(self.paint)
	love.graphics.circle("fill", x, y, self.brushSize/2)

	linewidth = 2
	love.graphics.setLineWidth(linewidth)
	love.graphics.setColor(window.theme.white)
	love.graphics.circle("line", window.mouse.cords.x, window.mouse.cords.y, self.brushSize/2)
	
end

function canvas:Draw()
	-- draws the background colour if set
	-- INFO: mouse right click on colour in colour pallet, should set the background. colour should be from the colours file rgba
	if self.backgroundColour ~= nil and running then
		love.graphics.setColor(unpack(self.backgroundColour)) -- unpacks the elements of a table and places them in as arguments
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	end

	-- draws the canvas border
	linewidth = 2
	love.graphics.setColor(window.theme.lightgreen)	-- TODO: use colours from colours file
	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth,
		5,5
	) 
	
end

return canvas
