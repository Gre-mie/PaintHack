local bar = {}

-- INFO: base ui object to be inherited

function bar:New() -- WARNING: padding is the padding on ONE side
	obj = { name = "default bar", x = 200, y = 200, width = 200, height = 200, padding = 5, buttons = {} }
	self.__index = self
	local object = setmetatable(obj, self)

	return object
end

function bar:Debug()
	helpUI.DebugElement(self)
	if self.name ~= "default bar" then
		message = self.name .. " does not yet have a Debug function"
		print("WARNING: " .. message)
		-- TODO: append to log
	end
end

-- INFO: prints the buttons at their xy cords. Buttons holde their own location
function bar:DrawButtons()
	for i = 1, #self.buttons do
		local button = self.buttons[i]
		button:Draw()
		if frame <= 1 then
			button:Debug()
		end
	end
end

-- INFO: this function should be overwriten by the object that inherits
function bar:Draw()
	-- fallback texture
	local linewidth = 10
	--local x, y, width, height = 0, 0, 300, 300

	if frame <= 1 then
		local message = self.name .. ", is drawing default bar texture"
		print("WARNING: " .. message)
		-- TODO: append to log
	end

	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.setColor(0.6, 0.6, 0.3)
	love.graphics.rectangle("fill", x, y, width, height)
	love.graphics.setColor(1, 0.5, 0.5)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)
end

return bar
