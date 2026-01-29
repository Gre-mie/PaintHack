local bar = require("resources/areas/bar")

-- INFO: UI for programe operations, eg save, new page

local programBar = bar:New()

-- WARNING: programBar:New will call objects that load their own sprites
function programBar:New()
	obj = self
	obj.name = "program bar"
	-- measure image width
	local imageHeight = 32 -- TEST:
	obj.x, obj.y, obj.width, obj.height = 0, 0, window.width, (self.padding * 2) + imageHeight
	-- TODO: add buttons

	return obj
end

function programBar:Debug()
	helpUI.DebugElement(self)
	print()
end

function programBar:Draw()
	if running ~= true then
		return -- may not yet be working
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
