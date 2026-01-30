local button = {}

-- INFO: A base to be inherited with default functions to be overwritten

--@input x, y int
function button:New(x, y, width, height, image)
	--	local message = "unable to create button, image is nil"
	--	if image == nil then
	--		print("ERROR: " .. message)
	--	end -- TODO: add propper error message with colour
	-- TODO: log message and quit
	obj = { name = name, x = x, y = x, width = width, height = height, padding = 4, image = image }
	self.__index = self
	return setmetatable(obj, self)
end

-- INFO: returns true if button is down and mouse is in area
-- @return bool
function button:Clicked()
	

end

function button:Debug()
	print(self.name)
	print("x: " .. self.x .. " y: " .. self.y)
	print("width: " .. self.width .. " height: " .. self.height)
	print("padding: " .. self.padding)
	print()
end

function button:Draw()
	-- TEST: vv
	local linewidth = 2
	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.setColor(0.7, 0.7, 0.7)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)
	-- TEST: ^^
end

return button
