extends KinematicBody2D

var veloc = Vector2(0, 0)
var input_vec = Vector2(0, 0)
var on_ground = true
onready var sprite = $AnimatedSprite

func _physics_process(delta):
	handle_movement(delta)
	handle_input(delta)

	veloc.x = input_vec.x * 350

	if veloc.y + input_vec.y < -500:
		veloc.y = -500
	else:
		veloc.y += input_vec.y

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

func handle_movement(_delta):
	if !is_on_floor():
		veloc += Vector2(0, 25)
	else:
		veloc.y = 0
