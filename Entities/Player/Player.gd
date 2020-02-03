extends KinematicBody2D

var veloc = Vector2(0, 0)
var input_vec = Vector2(0, 0)
var on_ground = true
onready var sprite = $AnimatedSprite
onready var ship = get_node("/root/World/Ship")
onready var repair_collider = $RepairCollide

onready var wheel = preload("res://Entities/Ship/Wheel.tscn")
onready var distance_bar = $UI/Sprite
onready var world = get_node("/root/World")
onready var victory_screen = preload("res://Screens/Victory.tscn")

var drive_distance = 0.0
var drive_goal = 3100.0

func _physics_process(delta):
	handle_movement(delta)
	handle_input(delta)
	
	distance_bar.position.x = floor(drive_distance / drive_goal * get_viewport().size.x - get_viewport().size.x)

	veloc.x = input_vec.x * 350

	if veloc.y + input_vec.y < -500:
		veloc.y = -500
	else:
		veloc.y += input_vec.y

	if drive_distance / drive_goal >= 1:
		for n in world.get_children():
			world.remove_child(n)
			n.queue_free()
			
		world.add_child(victory_screen.instance())
		
	move_and_slide(veloc , Vector2(0, -1))

func handle_input(_delta):
	input_vec = Vector2(0, 0)

	if Input.is_action_pressed("player_right"):
		input_vec += Vector2(1, 0)
		sprite.flip_h = false
	if Input.is_action_pressed("player_left"):
		input_vec += Vector2(-1, 0)
		sprite.flip_h = true
	if Input.is_action_pressed("player_jump"):
		if is_on_floor():
			input_vec += Vector2(0, -1000)
	if Input.is_action_pressed("player_down"):
		if is_on_floor():
			input_vec += Vector2(0, 1)
	if Input.is_action_pressed("player_patch_hole"):
		for elem in repair_collider.holes:
			if elem.get_filename() == wheel.get_path():
				drive()
			else:
				ship.remove_child(elem)

func handle_movement(_delta):
	if !is_on_floor():
		veloc += Vector2(0, 25)
	else:
		veloc.y = 0

	if self.global_position.y >= (250 + ship.position_diff_calc):
		ship.trigger_transparent_transition(true)
	else:
		ship.trigger_transparent_transition(false)
		
		
func drive():
	drive_distance += 1
