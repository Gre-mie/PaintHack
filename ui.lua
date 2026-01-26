helpUI = require("resources/areas/uihelpers")

local uiprogrambar = require("resources/areas/programbar")
local uitoolbar = require("resources/areas/toolbar")
local uioptionsbar = require("resources/areas/optionsbar")
local uicanvas = require("resources/areas/canvas")

local ui = {}

--[[ INFO: ui holds all the areas and updates the elements
   WARNING: ui:New should only be used ONCE in love.load
 	uses ui bars that load their own sprites during creation
--]]
function ui:New()

	-- TODO: figgur out why the function runs past return in the bar existence checks

	-- INFO: create ui areas, sizes are fixed
	local programBar = uiprogrambar:New()
	if programBar == nil then
		local message = "programBar wasn't created"
		print(colours.Error..message)
		-- TODO: add to log
		running = false
		love.event.quit(1)
		return
		print("!!! this shouldn't print")
	end

	-- @arguments: y
	local toolBar = uitoolbar:New(programBar.height)
	if toolBar == nil then
		local message = "toolBar wasn't created"
		print(colours.Error..message)
		-- TODO: add to log
		running = false
		love.event.quit(1)
		return
		print("!!! this shouldn't print")
	end

	-- @arguments: x, y, width, height
	-- WARNING: height is calculated before images are measured, image size changes may cause issues
	-- 	uses toolbar padding
	local optionsBarHeight = (toolBar.padding * 2) + 128
	local optionsBar = uioptionsbar:New(
		toolBar.width,
		window.height - optionsBarHeight,
		window.width - toolBar.width,
		optionsBarHeight
	)
	if optionsBar == nil then
		local message = "optionsBar wasn't created"
		print(colours.Error..message)
		-- TODO: add to logs
		running = false
		love.event.quit(1)
		return
		print("!!! this shouldn't print")
	end

	-- @arguments: x, y, width, height
	local canvas = uicanvas:New(
		toolBar.width,
		programBar.height,
		window.width - toolBar.width,
		window.height - (programBar.height + optionsBar.height)
	)
	if canvas == nil then
		local message = "canvas wasn't created"
		print(colours.Error..message)
		-- TODO: add to log
		running = false
		love.event.quit(1)
		return
		print("!!! this shouldn't print")
	end

	local obj = { name = "ui", areas = { programBar, toolBar, optionsBar, canvas } }

	self.__index = self
	return setmetatable(obj, self)
end

-- prints basic info
function ui:Debug()
	print(self.name)
	print("areas: " .. help.len(self.areas))
	for _, section in ipairs(self.areas) do
		section:Debug()
	end
end

function ui:Draw()
	if frame <= 1 then
		print("--> drawing sections...")
	end -- TEST:
	
	-- draw areass
	for i = 1, help.len(self.areas) do
		local section = self.areas[i]
		section:Draw()

	end
end

return ui
