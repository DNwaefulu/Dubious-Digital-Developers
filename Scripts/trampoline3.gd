extends Area2D


func _on_tramopline_body_entered(body):
	if body.is_in_group("Climber"):
		print("Body entered the trampoline")
		body.velocity.y = -600
		body.move_and_slide(body.velocity)

