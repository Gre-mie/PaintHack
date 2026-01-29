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

return helpers
