local bar = require("resources/areas/bar")

-- INFO: UI for toolbar, eg pen, rubber

local toolBar = bar:New() -- TEST:

-- WARNING: toolBar:New will call objects that load their own sprites
function toolBar:New(y)
	print("creating, base" .. self.name) -- TEST:
	obj = self
	obj.name = "tool bar"
	-- measure height of images
	local imageWidth = 64 -- TEST:
	obj.x, obj.y, obj.width, obj.height = 0, y, (self.padding * 2) + imageWidth, window.height - y
	-- TODO: add buttons

	return obj
end

function toolBar:Debug()
	helpBar.PrintBar(self)
	print()
end

function toolBar:Draw()
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

return toolBar
