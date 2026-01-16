local uicanvas = require("resources/areas/canvas")

local ui = {}

-- INFO: ui holds all the areas and updates the elements
--
function ui:New()
	--window.width, window.height

	-- TODO: create section objects with their buttons, set their draw positions

	-- TEST: vv
	local padding = 10

	local canvas = uicanvas:New(200, 200, window.width - 200, window.height - 200) -- WARNING: draw area should be made last, and fill remaining space

	-- TODO: create base area interface with New, Draw, Debug methods
	-- program bar interface, inherit add buttons (overwrite functions)
	local programBar =
		{ name = "program bar", x = 0, y = 0, width = window.width, height = 100, padding = padding, buttons = {} } -- area:NEW()
	-- TEST: ^^

	local obj = { areas = { programBar, canvas } }

	self.__index = self
	return setmetatable(obj, self)
end

-- prints basic info
function ui:Debug()
	print("ui")
	print("areas: " .. #self.areas)
	for area, section in pairs(self.areas) do
		print(section.name)
		print("x: " .. section.x .. " y: " .. section.y)
		print("width: " .. section.width .. " height: " .. section.height)
	end

	print()
end

function ui:Draw()
	-- TEST: vv
	local linewidth = 10

	-- draw section
	for i = 1, #self.areas do
		local section = self.areas[i]
		if section.name == "canvas" then
			section:Draw()
			goto testloop
		end
		love.graphics.setLineWidth(linewidth, "smooth")
		love.graphics.setColor(0.5, 0.1, 0.4)
		love.graphics.rectangle(
			"line",
			section.x + linewidth / 2,
			section.y + linewidth / 2,
			section.width - linewidth,
			section.height - linewidth
		)

		-- Draw buttons in section
		-- TODO: sawp rectangle for button image
		linewidth = 5
		love.graphics.setLineWidth(linewidth, "smooth")
		love.graphics.setColor(0.5, 0.5, 0.5)
		for i = 1, #section.buttons do
			print("buttons len: " .. #section.buttons) -- TEST:
			local button = section.buttons[i]
			love.graphics.rectangle(
				"line",
				button.x + linewidth / 2,
				button.y + linewidth / 2,
				button.width,
				button.height
			)
		end

		::testloop::
	end

	-- TEST: ^^
end

return ui
