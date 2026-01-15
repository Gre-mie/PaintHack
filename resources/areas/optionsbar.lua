local bar = require("resources/areas/bar")

-- INFO: UI for toolbar, eg pen, rubber

local optionsBar = bar:New() -- TEST:

-- WARNING: toolBar:New will call objects that load their own sprites
function optionsBar:New(x, y, width, height)
	print("creating, base" .. self.name) -- TEST:
	obj = self
	obj.name = "options bar"
	-- hight is assumed
	obj.x, obj.y, obj.width, obj.height = x, y, width, height
	-- TODO: add buttons

	return obj
end

function optionsBar:Debug()
	helpUI.DebugElement(self)
	print()
end

function optionsBar:Draw()
	local linewidth = 4
	love.graphics.setLineWidth(linewidth)
	love.graphics.setColor(0.62, 0.65, 0.72) -- TODO: change this colour, setup colour file, add coloured print vars
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(0.52, 0.52, 0.60)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)
end

return optionsBar
