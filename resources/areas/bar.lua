local bar = {}

-- INFO: base ui object to be inherited

function bar:New(x, y, width, height)
	obj = { name = "default bar", x = x, y = y, width = width, height = height, buttons = {} }
	self.__index = self
	return setmetatable(obj, self)
end

function bar:Debug()
	print(self.name)
	print("x: " .. self.x .. " y: " .. self.y)
	print("width: " .. self.width .. " height: " .. self.height)
	print()
end

-- INFO: this function should be overwriten by the object that inherits
function bar:Draw()
	local linewidth = 10

	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.setColor(0.6, 0.6, 0.6)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(0.5, 0.5, 0.5)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)
end

return bar
