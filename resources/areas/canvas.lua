local canvas = {}

-- INFO: the drawing area of the window

function canvas:New()
	local obj = {x= , y= , height= , width= }

	self.__index = self
	return setmetatable(obj, self)
end

function canvas:Draw() 

end

return canvas
