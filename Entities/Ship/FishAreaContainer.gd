extends Area2D

onready var fish = preload("res://Entities/Fish/Fish.tscn")

func _on_FishAreaContainer_body_entered(body):
	if body.get_filename() == fish.get_path():
		body.bite_activated = true
