local helpers = {}
function helpers.DebugElement(element)
	print(element.name)
	print("x: " .. element.x .. " y: " .. element.y)
	print("width: " .. element.width .. " height: " .. element.height)
	if element.padding ~= nil then
		print("padding: " .. element.padding)
	end
	if element.buttons ~= nil then
		print("buttons: " .. help.len(element.buttons))
	end
	if element.backgroundColour ~= nil then
		print(
			"background colour: {"
				.. element.backgroundColour[1]
				.. ", "
				.. element.backgroundColour[2]
				.. ", "
				.. element.backgroundColour[3]
				.. "}"
		)
	end
	if element.name == "canvas" then
		print("background colour: {}")
	end
end

return helpers
