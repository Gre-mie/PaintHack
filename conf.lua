function love.conf(t)
	print("love.conf started...") -- TEST:

	-- program general
	t.version = "11.5"
	t.gammacorrect = true

	-- window
	t.window.title = "PaintHack"
	t.window.width = 1024
	t.window.height = 768

	print("love.conf ended")
end
