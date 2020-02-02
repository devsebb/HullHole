extends StaticBody2D

var framesTilReset = 150
var cycleDir = -1

func _physics_process(delta):
	if cycleDir == 1:
		self.position -= Vector2(0, -1)
	else:
		self.position -= Vector2(0, 0.75)

	if framesTilReset == 0:
		if cycleDir == -1:
			framesTilReset = 75
		else:
			framesTilReset = 100
		cycleDir *= -1
	else:
		framesTilReset -= 1
