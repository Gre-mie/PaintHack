-- INFO: holds all colours.
	-- colours to be set when drawing to the window: rgb 0-255 converted to rgb 0-1
	-- colours for terminal print are strings that use excape codes

local colours = {}

-- inserts hex colours as rgba 0-1 arrays
function colours:New()
	obj = {

		-- themes for ui
		theme = {
			
			adventofcode = {
				background = help.colourFromHex("#0f0f23ff"),

				lightgreen = help.colourFromHex("#01b404ff"),
				green = help.colourFromHex("#018903ff"),

				grey = help.colourFromHex("#515156ff"),
				white = help.colourFromHex("#c2c2c3ff"),

			
			},
		},

		-- colours for colour pallet in toolbar
		pallet = {
			black = help.colourFromHex("#000000ff"),
			white = help.colourFromHex("#ffffffff"),
			blue = help.colourFromHex("#7777ffff"),
			green = help.colourFromHex("#147800ff"),
			yellow = help.colourFromHex("#b58600ff"),
			red = help.colourFromHex("#950000ff"),
		},

		Warning = "\27[33mWARNING: \27[0m",
		Error = "\27[31mERROR: \27[0m",
		DebugMode = "\27[92mDebug mode: \27[0m"
	}

	self.__index = self
	setmetatable(obj, self)

	return obj
end

return colours
