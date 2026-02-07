local helpers = {}
function helpers.len(arrtype)
	if arrtype == nil then
		message = "nil entity given to len function"
		print("\27[33mWARNING:\27[0m "..message)
	end
	if #arrtype > 0 then
		return #arrtype
	end
	local items = 0
	for key, val in pairs(arrtype) do
		items = items + 1
	end	
	return items
	
end
function helpers.colourFromHex(hex) 
	if string.len(hex) < 7 then 
		local message = "invalid hex value given to colourFromHex helper function"
		print(colours.Warning..message)
		return 0, 0, 0, nil
	end
	local rdec = tonumber(string.sub(hex, 2,3), 16)
	local gdec = tonumber(string.sub(hex, 4,5), 16)
	local bdec = tonumber(string.sub(hex, 6,7), 16)
	local adec = nil
	if string.len(hex) > 7 then
		adec = tonumber(string.sub(hex, 8,9), 16)
	end
	r,g,b,a = love.math.colorFromBytes(rdec, gdec, bdec, adec)
	return {r,g,b,a}
end
function helpers.distance(aX, aY, bX, bY)
	local x = (bX - aX)*(bX-aX)
	local y = (bY - aY)*(bY-aY)
	local dist = math.sqrt(x+y)
	return dist
end
function helpers.middlePoint(aX, aY, bX, bY)
	local xpoint = (aX+bX)/2
	local ypoint = (aY+bY)/2 
	return math.floor(xpoint), math.floor(ypoint)
end
function helpers.line(aX, aY, bX, bY)	
	local brushSize = ui.canvas.brushSize
	local lineWidth = ui.canvas.brushSize/2
	if debug.active and help.len(debug.store) == 2 then
		if aX ~= nil and aY ~= nil then
			love.graphics.setColor(colours.pallet.grey)
			love.graphics.line(aX, aY, bX, bY)
		end
		love.graphics.setColor(colours.pallet.red)
		lineWidth = ui.canvas.brushSize/6
	end
	if aX == nil or aY == nil then
		love.graphics.circle("fill", bX, bY, lineWidth)
		return
	else
		love.graphics.circle("fill", aX, aY, lineWidth)
		love.graphics.circle("fill", bX, bY, lineWidth)
		local recurseMid = function(func, aX, aY, bX, bY)	
			if help.distance(aX, aY, bX, bY) <= brushSize/2 then
				return
			end
			local midX, midY = help.middlePoint(aX, aY, bX, bY)
			love.graphics.circle("fill", midX, midY, lineWidth)
			func(func, aX, aY, midX, midY)
			func(func, midX, midY, bX, bY)
		end
		recurseMid(recurseMid, aX, aY, bX, bY)
	end
end

return helpers
