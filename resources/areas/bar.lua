local bar = {}
function bar:New()
	obj = { name = "default bar", x = 200, y = 200, width = 200, height = 200, padding = 5, buttons = {} }
	self.__index = self
	local object = setmetatable(obj, self)
	return object
end
function bar:Debug()
	helpUI.DebugElement(self)
	if self.name ~= "default bar" then
		message = self.name .. " does not yet have a Debug function"
		print(colours.Warning .. message)
	end
end
function bar:DrawButtons()
	for i = 1, help.len(self.buttons) do
		local button = self.buttons[i]
		button:Draw()
		if frame <= 1 then
			button:Debug()
		end
	end
end
function bar:Draw()
	if running ~= true then
		return
	end
	local linewidth = 10
	if frame <= 1 then
		local message = self.name .. ", is drawing default bar texture"
		print(colours.Warning .. message)
	end
	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.setColor(0.6, 0.6, 0.3)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
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
