extends AudioStreamPlayer

var pitchscale = 1.0

func _physics_process(delta):
	pitchscale += 0.00008
	self.set_pitch_scale(pitchscale)
