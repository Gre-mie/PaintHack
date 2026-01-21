helpBar = require("resources/areas/barhelpers")

--local uicanvas = require("resources/areas/canvas")
local uiprogrambar = require("resources/areas/programbar")
local uitoolbar = require("resources/areas/toolbar")

--local basebar = require("resources/areas/bar") -- TEST:

local ui = {}

-- INFO: ui holds all the areas and updates the elements
-- WARNING: ui:New should only be used ONCE in love.load
-- 	uses ui bars that load their own sprites during creation
function ui:New()
	-- areas of ui
	local programBar = uiprogrambar:New()
	if programBar == nil then
		local message = "programBar wasn't created"
		print(message)
		-- TODO: add to error logs and exit
	end

	-- @argument y
	local toolBar = uitoolbar:New(programBar.height)
	if toolBar == nil then
		local message = "toolBar wasn't created"
		print(message)
		-- TODO: add to error logs and exit
	end

	-- INFO: set area sizes
	-- WARNING: fixed

	--	local toolBar = basebar:New(0, programBar.height, 100, window.height - programBar.height)

	--	local optionsBar = basebar:New(0, programBar.height + toolBar.height, window.width - toolBar.width, 150)

	--	local canvas = uicanvas:New(
	--		toolBar.width,
	--		programBar.height,
	--		window.width - toolBar.width,
	--		window.height - (programBar.height + optionsBar.height)
	--	)

	-- TODO: create base area interface with New, Draw, Debug methods
	-- program bar interface, inherit add buttons (overwrite functions)
	--	local programBar = { name = "program bar", x = 0, y = 0, width = window.width, height = 100, buttons = {} } -- area:NEW()

	-- local obj = { areas = { programBar, toolBar, optionsBar, canvas } }
	local obj = { name = "ui", areas = { programBar, toolBar } }

	self.__index = self
	return setmetatable(obj, self)
end

-- prints basic info
function ui:Debug()
	print(self.name)
	print("areas: " .. #self.areas)
	for area, section in pairs(self.areas) do
		section:Debug()
	end
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
