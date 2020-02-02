extends Node2D

#var water = preload("res://Entities/Ocean/OceanUnit/OceanUnit.tscn")

#const water_spawn_thresh = 600
#var spawn_water_timer = water_spawn_thresh

#func _physics_process(delta):
#	spawn_water_timer -= 1

#	if spawn_water_timer == 0:
#		self.add_child(water.instance())
#		spawn_water_timer = water_spawn_thresh
