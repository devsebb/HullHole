extends Area2D

var holes = []

func _on_RepairCollide_body_entered(body):
	holes.append(body)

func _on_RepairCollide_body_exited(body):
	holes.erase(body)
