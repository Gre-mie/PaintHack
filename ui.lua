helpUI = require("resources/areas/uihelpers")
local uiprogrambar = require("resources/areas/programbar")
local uitoolbar = require("resources/areas/toolbar")
local uioptionsbar = require("resources/areas/optionsbar")
local uicanvas = require("resources/areas/canvas")
local ui = {}
function ui:New()
	local programBar = uiprogrambar:New()
	if programBar == nil then
		local message = "programBar wasn't created"
		print(colours.Error..message)
		running = false
		love.event.quit(1)
		return
	end
	local toolBar = uitoolbar:New(programBar.height)
	if toolBar == nil then
		local message = "toolBar wasn't created"
		print(colours.Error..message)
		running = false
		love.event.quit(1)
		return
	end
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
		running = false
		love.event.quit(1)
		return
	end
	local canvas = uicanvas:New(
		toolBar.width,
		programBar.height,
		window.width - toolBar.width,
		window.height - (programBar.height + optionsBar.height)
	)
	if canvas == nil then
		local message = "canvas wasn't created"
		print(colours.Error..message)
		running = false
		love.event.quit(1)
		return
	end
	local obj = { name = "ui", areas = { programBar, toolBar, optionsBar }, canvas = canvas }
	self.__index = self
	return setmetatable(obj, self)
end
function ui:Debug(type)
	print(self.name)
	print("areas: " .. help.len(self.areas))
	if type == "areas" then
		for _, section in ipairs(self.areas) do
			section:Debug()
		end
	end
end
function ui:Draw()
	if running ~= true then
		return -- may not be working
	end
	for i = 1, help.len(self.areas) do
		local section = self.areas[i]
		section:Draw()
	end
	self.canvas:Draw()
	if self.canvas:CursorHover() then
		if love.mouse.isVisible() then
			love.mouse.setVisible(false)
		end
		self.canvas:DrawCursor()
	else
		if love.mouse.isVisible() == false then
			love.mouse.setVisible(true)
		end
	end
end

return ui
