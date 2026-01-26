local bar = require("resources/areas/bar")

-- INFO: UI for toolbar, eg pen, rubber

local toolBar = bar:New()

-- WARNING: toolBar:New will call objects that load their own sprites
function toolBar:New(y)
	obj = self
	obj.name = "tool bar"
	-- measure height of images
	local imageWidth = 64 -- TEST:
	obj.x, obj.y, obj.width, obj.height = 0, y, (self.padding * 2) + imageWidth, window.height - y
	-- TODO: add buttons

	return obj
end

function toolBar:Debug()
	helpUI.DebugElement(self)
	print()
end

function toolBar:Draw()
	if running ~= true then
		return -- may not yet be working
	end

	local linewidth = 4
	love.graphics.setLineWidth(linewidth)
	love.graphics.setColor(0.43, 0.40, 0.55) -- TODO: change this colour, setup colour file, add coloured print vars
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(0.33, 0.28, 0.43)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)
end

return toolBar
