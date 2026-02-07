local help = require("mainhelpers")
local colours = {}

function colours:New()
	obj = {
		theme = {
			adventofcode = {
				background = help.colourFromHex("#0f0f23ff"),

				lightgreen = help.colourFromHex("#01b404ff"),
				green = help.colourFromHex("#018903ff"),

				grey = help.colourFromHex("#515156ff"),
				white = help.colourFromHex("#c2c2c3ff"),
			},
		},
		pallet = {
			black = help.colourFromHex("#000000ff"),
			white = help.colourFromHex("#ffffffff"),
			grey = help.colourFromHex("#898989ff"),
			blue = help.colourFromHex("#7777ffff"),
			green = help.colourFromHex("#147800ff"),
			yellow = help.colourFromHex("#b58600ff"),
			red = help.colourFromHex("#950000ff"),
			pink = help.colourFromHex("#bc45a8ff"),
		},
		debug = {
			green = help.colourFromHex("#2ee000"),
		},
		text = {
			default = "\27[0m",
			yellow = "\27[33m",
			red = "\27[31m",
			green = "\27[92m",
		},
		Warning = "\27[33mWARNING: \27[0m",
		Error = "\27[31mERROR: \27[0m",
		DebugMode = "\27[92mDebug mode: \27[0m",
	}
	self.__index = self
	setmetatable(obj, self)
	return obj
end

return colours
