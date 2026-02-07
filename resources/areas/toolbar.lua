local bar = require("resources/areas/bar")
local toolBar = bar:New()
function toolBar:New(y)
	obj = self
	obj.name = "tool bar"
	local imageWidth = 64
	obj.x, obj.y, obj.width, obj.height = 0, y, (self.padding * 2) + imageWidth, window.height - y
	return obj
end
function toolBar:Debug()
	helpUI.DebugElement(self)
	print()
end
function toolBar:Draw()
	if running ~= true then
		return
	end
	local linewidth = 4
	love.graphics.setLineWidth(linewidth)
	love.graphics.setColor(window.theme.background)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 5,5)
	love.graphics.setColor(window.theme.green)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth,
		5,5
	)
end

return toolBar
