local uicanvas = require("resources/areas/canvas")
local basebar = require("resources/areas/bar") -- TEST:

local ui = {}

-- INFO: ui holds all the areas and updates the elements
--
function ui:New()
	--window.width, window.height

	-- INFO: set area sizes
	-- WARNING: fixed
	-- TODO: measure the height/width of buttons
	-- TEST: here the basebar object is called as a temporary measure, later it will custom bars, in which x,y,width,height may not be needed (hard coding)
	local programBar = basebar:New(0, 0, window.width, 100)
	local toolBar = basebar:New(0, programBar.height, 100, window.height - programBar.height)

	local optionsBar = basebar:New(0, programBar.height + toolBar.height, window.width - toolBar.width, 150)

	local canvas = uicanvas:New(
		toolBar.width,
		programBar.height,
		window.width - toolBar.width,
		window.height - (programBar.height + optionsBar.height)
	)

	-- TODO: create base area interface with New, Draw, Debug methods
	-- program bar interface, inherit add buttons (overwrite functions)
	--	local programBar = { name = "program bar", x = 0, y = 0, width = window.width, height = 100, buttons = {} } -- area:NEW()

	local obj = { areas = { programBar, toolBar, optionsBar, canvas } }

	self.__index = self
	return setmetatable(obj, self)
end

-- prints basic info
function ui:Debug()
	print("ui")
	print("areas: " .. #self.areas)
	for area, section in pairs(self.areas) do
		section:Debug()
	end

	print()
end

function ui:Draw()
	if frame <= 1 then
		print("--> drawing sections...")
	end -- TEST:
	-- each draw section
	for i = 1, #self.areas do
		local section = self.areas[i]
		section:Draw()

		if frame <= 1 then
			section:Debug()
		end -- TEST:`
	end
end

return ui
