local bar = require("resources/areas/bar")

-- INFO: UI for programe operations, eg save, new page

local programBar = bar:New() -- TEST:

function programBar:New()
	print("creating, base" .. self.name) -- TEST:
	obj = self
	obj.name = "program bar"
	obj.x, obj.y, obj.width, obj.height = 0, 0, window.width, 42

	return obj
end

function programBar:Debug()
	helpBar.PrintBar(self)
	print()
end

function programBar:Draw()
	local linewidth = 4
	love.graphics.setLineWidth(linewidth)
	love.graphics.setColor(0.67, 0.70, 0.72) -- TODO: change this colour, setup colour file, add coloured print vars
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(0.61, 0.63, 0.67)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)
end

return programBar
