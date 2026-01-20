-- INFO: helper functions used in bar objects

local helpers = {}

-- prints x, y, width, hight
function helpers.PrintBar(bar)
	print(bar.name)
	print("x: " .. bar.x .. " y: " .. bar.y)
	print("width: " .. bar.width .. " height: " .. bar.height)
end

return helpers
