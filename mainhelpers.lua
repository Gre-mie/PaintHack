-- INFO: contains simple functions used in the programme

local helpers = {}

-- INFO: returns the length of an array
	-- this function will count the elements of a map, which would usually return 0 even when elements are set
function helpers.len(arrtype)
	-- WARNING: its possible for this function to be run when colours is nil
	if arrtype == nil then
		message = "nil entity given to len function"
		print("\27[33mWARNING:\27[0m "..message)
		-- TODO: add to logs
	end

	-- checks for an index
	if #arrtype > 0 then
		return #arrtype
	end

	-- counts elements in map, if empty 0 will be returned
	local items = 0
	for key, val in pairs(arrtype) do
		items = items + 1
	end
	
	return items
	
end

-- converts a colour from hex colour string to rgba 1-0
-- @arguments hex string
-- @return {r, g, b, a}
function helpers.colourFromHex(hex) 
	if string.len(hex) < 7 then 
		local message = "invalid hex value given to colourFromHex helper function"
		print(colours.Warning..message)
		return 0, 0, 0, nil
	end

	-- decimal values from 0 - 255
	local rdec = tonumber(string.sub(hex, 2,3), 16)
	local gdec = tonumber(string.sub(hex, 4,5), 16)
	local bdec = tonumber(string.sub(hex, 6,7), 16)
	local adec = nil
	
	if string.len(hex) > 7 then
		adec = tonumber(string.sub(hex, 8,9), 16)
	end

	-- point values from 0 - 1
	r,g,b,a = love.math.colorFromBytes(rdec, gdec, bdec, adec)

	return {r,g,b,a}
end

-- calculate the distance between 2 points
-- @return distance int
function helpers.distance(aX, aY, bX, bY)
	local x = (bX - aX)*(bX-aX)
	local y = (bY - aY)*(bY-aY)
	local dist = math.sqrt(x+y)

	return dist
end

-- calculate the middle point between 2 points
-- floored to the nearest int
-- @return x, y int
function helpers.middlePoint(aX, aY, bX, bY)
	local xpoint = (aX+bX)/2
	local ypoint = (aY+bY)/2 
	return math.floor(xpoint), math.floor(ypoint)
end

-- draws a line by filling the gaps between points
-- @arguments point1, point2 map{x, y}, brushSize int 
function helpers.line(aX, aY, bX, bY)

	-- changes colours a mid point size for debugging
	if debugMode then
		
	end

	-- TODO: WRITE THE FUNCTION
	print("from x: "..aX..", y: "..aY)
	print("to   x: "..bX..", y: "..bY)
	print()
	love.graphics.setColor(colours.pallet.green)
	love.graphics.line(aX, aY, bX, bY)


end

return helpers
