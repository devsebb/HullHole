extends KinematicBody2D

onready var outer_hull = $frame3
onready var msg = $drivemsg
onready var hole = preload("res://Entities/Hole/Hole.tscn")
onready var water_level = $frame3/ocean_front
onready var world = get_node("/root/World")
onready var loss_screen = preload("res://Screens/Defeat.tscn")
#var framesTilReset = 100
#var cycleDir = -1

#var veloc = Vector2()

#var transparency_cycle_thresh = 24.0
#var transparency_cycle = 0.0
var ship_is_transparent = true
var msgcycle = 5
var dir = -1
var step = 15
var damage = 0
var starting_y = 0
var water_starting_y = 0
var position_diff_calc = 0

func _ready():
	starting_y = self.position.y
	water_starting_y = water_level.global_position.y

func _physics_process(delta):
	step -= 1
	if step == 0:
		step = 15
		cycle_msg()

	damage = 0
	for elem in self.get_children():
		if elem.get_filename() == hole.get_path():
			damage += 1

	self.position.y = starting_y + (damage * 10)
	position_diff_calc = self.position.y - starting_y
	water_level.global_position.y = water_starting_y

	if damage == 27:
		for n in world.get_children():
			world.remove_child(n)
			n.queue_free()
			
		world.add_child(loss_screen.instance())
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
