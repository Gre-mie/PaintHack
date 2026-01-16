local canvas = {}

-- INFO: the drawing area of the window

function canvas:New(x, y, width, height)
	local obj = { name = "canvas", x = x, y = y, height = height, width = width }

	self.__index = self
	return setmetatable(obj, self)
end

function canvas:Debug()
	print("canvas")
	print("x: " .. self.x .. " y: " .. self.y)
	print("width: " .. self.width .. " height: " .. self.height)
	print()
end

function canvas:Draw()
	-- TEST: vv
	linewidth = 10
	love.graphics.setColor(0.3, 0.4, 0.1)
	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)
	-- TEST: ^^
end

return canvas
