local ui = {}

-- INFO: ui holds all the areas and updates the elements
--
function ui:New()
	-- TODO: create section objects that use button objects

	-- TEST: vv
	local padding = 10
	local programBar = { x = 0, y = 0, width = window.width, height = 100, padding = padding } -- area:NEW()
	-- TEST: ^^

	local obj = { areas = { programBar = programBar } }

	self.__index = self
	return setmetatable(obj, self)
end

function ui:Draw()
	-- TEST: vv
	local linewidth = 10
	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.setColor(0.5, 0.1, 0.4)
	love.graphics.rectangle(
		"line",
		self.areas.programBar.x + linewidth / 2,
		self.areas.programBar.y + linewidth / 2,
		self.areas.programBar.width - linewidth,
		self.areas.programBar.height - linewidth
	)

	-- TEST: ^^
end

return ui
