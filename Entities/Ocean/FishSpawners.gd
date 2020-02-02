extends Node2D

var fish = preload("res://Entities/Fish/Fish.tscn")
onready var spawner1 = $Spawner1
onready var spawner2 = $Spawner2
onready var spawner3 = $Spawner3
onready var spawner4 = $Spawner4
onready var spawner5 = $Spawner5

var rng = RandomNumberGenerator.new()

var threshold = 250
var timer = 250

func _ready():
	rng.randomize()
func _physics_process(_delta):
	timer -= 1

	if timer <= 0:
		var chosen_spawner = rng.randi_range(1, 5)

		if chosen_spawner == 1:
			spawner1.add_child(fish.instance())
		elif chosen_spawner == 2:
			spawner2.add_child(fish.instance())
		elif chosen_spawner == 3:
			spawner3.add_child(fish.instance())
		elif chosen_spawner == 4:
			spawner4.add_child(fish.instance())
		elif chosen_spawner == 5:
			spawner5.add_child(fish.instance())

		if threshold > 75:
			threshold -= 5
			
		timer = threshold
