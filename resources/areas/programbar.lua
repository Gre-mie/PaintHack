local bar = require("resources/areas/bar")
local programBar = bar:New()
function programBar:New()
	obj = self
	obj.name = "program bar"
	local imageHeight = 32
	obj.x, obj.y, obj.width, obj.height = 0, 0, window.width, (self.padding * 2) + imageHeight
	return obj
end
function programBar:Debug()
	helpUI.DebugElement(self)
	print()
end
function programBar:Draw()
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

return programBar
