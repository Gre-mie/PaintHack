local bar = require("resources/areas/bar")
local optionsBar = bar:New()
function optionsBar:New(x, y, width, height)
	obj = self
	obj.name = "options bar"
	obj.x, obj.y, obj.width, obj.height = x, y, width, height
	return obj
end
function optionsBar:Debug()
	helpUI.DebugElement(self)
	print()
end
function optionsBar:Draw()
	if running ~= true then
		return
	end
	local linewidth = 4
	love.graphics.setLineWidth(linewidth)
	love.graphics.setColor(window.theme.background)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, 5,5)
	love.graphics.setColor(window.theme.grey)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth,
		5,5
	)
end

return optionsBar
