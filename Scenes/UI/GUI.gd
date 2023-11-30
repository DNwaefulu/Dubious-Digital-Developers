extends CanvasLayer

signal GemCount()
signal Death()
signal GemC()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Gem_body_entered(_body):
    print("COLLECTED")
    emit_signal("GemCount")

func _on_Death_zone_body_entered(body):
    if body.is_in_group("Climber"):
        emit_signal("Death")


func _on_GemCounter_GemsC():
    emit_signal("GemC")
