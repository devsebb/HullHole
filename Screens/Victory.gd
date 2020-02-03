extends Node2D

var wait_timer = 120

func _physics_process(delta):
	wait_timer -= 1
	
	if Input.is_action_pressed("player_patch_hole") && wait_timer <= 0:
		get_tree().reload_current_scene()
