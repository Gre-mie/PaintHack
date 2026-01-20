local bar = require("resources/areas/bar")

-- INFO: UI for programe operations, eg save, new page

local programBar = bar:New() -- TEST:

function programBar:New()
	print("creating, base" .. self.name) -- TEST:
	obj = self
	obj.name = "program bar"
	obj.x, obj.y, obj.width, obj.height = 200, 200, 200, 200 -- TEST:

	return obj
end

function programBar:Debug()
	helpBar.PrintBar(self)
	print()
end

function programBar:Draw()
	local linewidth
end

return programBar
