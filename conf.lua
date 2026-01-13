function love.conf(t)
	print("love.conf started...") -- TEST:

	-- program general
	t.version = "11.5"
	t.gammacorrect = true

	-- window
	t.window.title = "PaintHack"
	-- INFO: uses Android tablet resolution, should be small enough for most screens
	t.window.width = 1280
	t.window.height = 800

	print("love.conf ended")
end
