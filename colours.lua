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
				background = help.colourFromHex("#0f0f23"),

				lightgreen = help.colourFromHex("#01b404"),
				green = help.colourFromHex("#018903"),

				grey = help.colourFromHex("#515156"),
				white = help.colourFromHex("#c2c2c3"),

			
			},
		},

		-- colours for colour pallet in toolbar
		pallet = {
			black = help.colourFromHex("#000000"),
			white = help.colourFromHex("#ffffff"),
			blue = help.colourFromHex("#7777ff"),
			green = help.colourFromHex("#147800"),
			yellow = help.colourFromHex("#b58600"),
			red = help.colourFromHex("#950000"),
		},

		Warning = "\27[33mWARNING: \27[0m",
		Error = "\27[31mERROR: \27[0m",
	}

	self.__index = self
	setmetatable(obj, self)

	return obj
end

return colours
