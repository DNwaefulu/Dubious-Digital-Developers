extends CanvasLayer

signal GemCount()
signal Death()


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Gem_body_entered(_body):
    emit_signal("GemCount")

func _on_Death_zone_body_entered(body):
    if body.is_in_group("climber"):
        emit_signal("Death")
