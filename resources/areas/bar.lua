local bar = {}

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

function bar:Draw()
	--
end

return bar
