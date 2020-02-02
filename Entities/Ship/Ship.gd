extends KinematicBody2D

onready var outer_hull = $frame3
onready var msg = $drivemsg
#var framesTilReset = 100
#var cycleDir = -1

#var veloc = Vector2()

#var transparency_cycle_thresh = 24.0
#var transparency_cycle = 0.0
var ship_is_transparent = true
var msgcycle = 5
var dir = -1
var step = 15

func _physics_process(delta):
	step -= 1
	if step == 0:
		step = 15
		cycle_msg()

	#if cycleDir == 1:
		#veloc = Vector2(0, -20)
	#else:
		#veloc = Vector2(0, 15)

	#move_and_slide(veloc)

#	if framesTilReset == 0:
	#	if cycleDir == -1:
		#	framesTilReset = 75
	#	else:
		#	framesTilReset = 100
	#	cycleDir *= -1
	#else:
	#framesTilReset -= 1

	#if transparency_cycle >= 0:
	if ship_is_transparent:
		outer_hull.modulate = Color(1, 1, 1, 0.2)#transparency_cycle/transparency_cycle_thresh)
	else:
		outer_hull.modulate = Color(1, 1, 1, 1)#1/transparency_cycle)

	#transparency_cycle -= 1.0

func trigger_transparent_transition(is_transparent):
	ship_is_transparent = is_transparent
	#transparency_cycle = transparency_cycle_thresh

func cycle_msg():
	if msgcycle > 0:
		msgcycle -= 1
		msg.position.y += 1 * dir
	else:
		msgcycle = 5
		dir *= -1
