extends KinematicBody2D

#onready var targetArea = get_node("/root/Ship/FishAreaContainer")
#onready var targetShape = get_node("/root/Ship/FishAreaContainer/FishArea")

onready var ship = get_node("/root/World/Ship")
onready var hole = preload("res://Entities/Hole/Hole.tscn")

#var positionInArea = Vector2(0, 0)

onready var sprite = $AnimatedSprite

var rng = RandomNumberGenerator.new()

var dest = Vector2(0, 0)
var destType = 1

var time_to_bite = 60
var bite_activated = false

var flip_time = 60

func _ready():
	rng.randomize()
	var pos = rng.randi_range(1, 5)	
	
	if(pos == 1):
		dest = Vector2(19, 275)
	elif(pos == 2):
		dest = Vector2(-260, 250)
	elif(pos == 3):
		dest = Vector2(430, 300)
	elif(pos == 4):
		dest = Vector2(-35, 470)
	elif(pos == 5):
		dest = Vector2(-25, 450)
		
	dest += Vector2(rng.randi_range(-100, 100), rng.randi_range(-100, 100))
	#	var centerpos = Vector2(0,0)#targetShape.position #+ targetArea.position

#	var size = targetArea.shape.extents

#	positionInArea.x = (randi() % size.x) - (size.x/2) + centerpos.x
#	positionInArea.y = (randi() % size.y) - (size.y/2) + centerpos.y

func _physics_process(delta):
	#var vector = (positionInArea - self.global_position).normalized()
	var diffVec = Vector2(dest.x + rng.randi_range(-250, 250), dest.y + rng.randi_range(-250, 250))
	move_and_slide(diffVec - self.global_position)
	
	flip_time -= 1
	if flip_time <= 0:
		sprite.flip_h = true if diffVec.x - self.global_position.x > 0 else false
		flip_time = rng.randi_range(20, 60)

	if abs(self.global_position.x - dest.x) < 50 and abs(self.global_position.y - dest.y) < 50:
		if destType == 1 and time_to_bite <= 0:
			dest = Vector2(rng.randi_range(-1000, 1000), rng.randi_range(700, 1000))
			flip_time = 0
			destType = 2
		elif destType == 2:
			get_parent().remove_child(self)

	if bite_activated:
		manage_biting()

func manage_biting():
	if time_to_bite == 0:
		bite()
		time_to_bite -= 1
	else:
		time_to_bite -= 1

func bite():
	var child = hole.instance()
	child.global_position = self.global_position
	ship.add_child(child)
