local canvas = {}

-- INFO: the drawing area of the window

function canvas:New(x, y, width, height)
	local obj = { name = "canvas", x = x, y = y, height = height, width = width, backgroundColour = nil }

	self.__index = self
	return setmetatable(obj, self)
end

function canvas:Debug()
	helpUI.DebugElement(self)
	print()
end

function canvas:Draw()
	-- draws the background colour if set
	-- INFO: mouse right click on colour in colour pallet, should set the background. colour should be from the colours file rgba
	if self.backgroundColour ~= nil and running then
		love.graphics.setColor(unpack(self.backgroundColour)) -- unpacks the elements of a table and places them in as arguments
		love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	end

	-- draws the canvas border
	linewidth = 5
	love.graphics.setColor(0.05, 0, 0.1)	-- TODO: use colours from colours file
	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)
end

return canvas
