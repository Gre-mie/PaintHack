function love.conf(t)
	t.version = "11.5"
	t.window.icon = "resources/images/icon.png"	t.gammacorrect = true
	t.console = false	t.window.title = "PaintHack"
	t.window.width = 1280
	t.window.height = 800
	t.identity = "painthack"
	t.accelerometerjoystick = false	t.modules.joystick = false
	t.modules.physics = false
	t.modules.video = false
	t.modules.data = false
	t.modules.audio = false
	t.modules.sound = false
	t.modules.thread = false
	t.modules.timer = false
	t.modules.touch = false
end
