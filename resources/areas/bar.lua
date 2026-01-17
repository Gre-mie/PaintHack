local uibutton = require("resources/areas/buttons/button") -- TEST:

local bar = {}

-- INFO: base ui object to be inherited

function bar:New(x, y, width, height)
	-- TEST: vv
	-- WARNING: DONT BE A NUMPTY: the buttons will have their location set by the function the object that inherits from bar
	-- they will be cardcoded for each type of button, in each type of bar
	local b1 = uibutton:New(0, 50, 32, 32)
	local b2 = uibutton:New(42, 50, 32, 32)
	local b3 = uibutton:New(84, 50, 32, 32)
	local buttons = { b1, b2, b3 }
	-- TEST: ^^

	obj = { name = "default bar", x = x, y = y, width = width, height = height, padding = 10, buttons = buttons }
	self.__index = self
	return setmetatable(obj, self)
end

function bar:Debug()
	print(self.name)
	print("x: " .. self.x .. " y: " .. self.y)
	print("width: " .. self.width .. " height: " .. self.height)
	print("padding: " .. self.padding)
	print("buttons: " .. #self.buttons)
	print()
end

-- INFO: prints the buttons at their xy cords. Buttons holde their own location
function bar:DrawButtons()
	for i = 1, #self.buttons do
		local button = self.buttons[i]
		button:Draw()
		if frame <= 1 then
			button:Debug()
		end
	end
end

-- INFO: this function should be overwriten by the object that inherits
function bar:Draw()
	local linewidth = 10
	-- draws the bar grahics
	love.graphics.setLineWidth(linewidth, "smooth")
	love.graphics.setColor(0.6, 0.6, 0.6)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(0.5, 0.5, 0.5)
	love.graphics.rectangle(
		"line",
		self.x + linewidth / 2,
		self.y + linewidth / 2,
		self.width - linewidth,
		self.height - linewidth
	)

	self:DrawButtons()

	-- TEST: vv

	--love.graphics.setColor(0, 0, 0)
	--local padding = 10
	--love.graphics.print("testing", self.x + padding, self.y + padding) -- WARNING: theres a little space above the default font that might make things look like their not alineing, remember there SHOULD be space at the top
	-- TEST: ^^
end

return bar
