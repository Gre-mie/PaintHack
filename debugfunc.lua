local help = require("mainhelpers")
local colours = require("colours"):New()

local debug = {}

function debug:New()
	local obj = {mode = false, store = {}}

	self.__index = self
	return setmetatable(obj, self)
end

function debug:changeMode()
	self.mode = not self.mode
		if self.mode then
			print(colours.DebugMode.."ON")
		else
			print(colours.DebugMode.."OFF")
		end
end

function debug:line()
	print("debugging line")
end



return debug
