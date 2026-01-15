local button = {}

-- INFO: A base to be inherited with default functions to be overwritten

--@input x, y int
function button:New(x, y)
	obj = { x = x, y = x, width = 32, height = 32 }
	self.__index = self
	return setmetatable(obj, self)
end

function button:Draw()

	-- TEST: vv
	love.
	love.graphics.rectangle("fill", self.x, self.y, 
	-- TEST: ^^
end

return button
