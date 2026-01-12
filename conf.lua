function love.conf(t)
	-- program general
	t.version = "11.5"
	t.window.icon = "resources/images/icon.png" -- INFO: may not show on small window bars
	t.gammacorrect = true

	-- window
	t.window.title = "PaintHack"
	-- INFO: uses Android tablet resolution, should be small enough for most screens
	t.window.width = 1280
	t.window.height = 800

	-- saving
	-- WARNING: I dont need these right now, but will when creating .exe .app

	-- t.appendidentity = true 	--for testing
	-- t.appendidentity = false 	-- default, will be used to save files outside of application eg game save directory (AppData on windows)
	t.identity = "painthack" -- INFO: the name of the directory the exicutible will be saved as/in

	-- input
	t.accelerometerjoystick = false -- WARNING: this should be true for applications exe type

	-- moduals
	-- INFO: unused moduals should be false
	t.modules.joystick = false
	t.modules.physics = false
	t.modules.video = false
	t.modules.data = false -- WARNING: may need this later for saving
	t.modules.audio = false -- WARNING: may need this later for playing sounds
	t.modules.audio = false -- WARNING: may need this later for decoding sound files
end
