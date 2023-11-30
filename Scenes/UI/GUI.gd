extends CanvasLayer

signal GemCount()
signal Death()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Gem_body_entered(_body):
	emit_signal("GemCount")

func _on_Death_zone_body_entered(body):
	if body.is_in_group("Climber"):
		emit_signal("Death")


func _on_Fireball_body_entered(body):
	emit_signal("Death")
