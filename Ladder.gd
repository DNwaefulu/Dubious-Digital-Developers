extends Area2D


func _on_Ladder_body_entered(body):
	if body.is_in_group("Climber"):
		if body.climbing == false:
			body.climbing = true
			print("the body has entered the ladder")






func _on_Ladder_body_exited(body):
	if body.is_in_group("Climber"):
		if body.climbing == true:
			body.climbing = false
	pass # Replace with function body.
