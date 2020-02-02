extends Node2D

#onready var spawner1 = $Spawner1
#onready var spawner2 = $Spawner2
onready var ocean_unit = preload("res://Entities/Ocean/OceanUnit/OceanUnit.tscn")

var spawn_frames = 40

func _physics_process(delta):
	#if spawn_frames > 0:
	#	spawner1.add_child(ocean_unit.instance())
	#	spawner1.add_child(ocean_unit.instance())
	#	spawner1.add_child(ocean_unit.instance())
	#	spawner2.add_child(ocean_unit.instance())
	#	spawner2.add_child(ocean_unit.instance())
	#	spawner2.add_child(ocean_unit.instance())
	#	spawn_frames -= 1
	pass
