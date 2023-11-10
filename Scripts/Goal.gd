extends Area2D

const LevelSelect = preload("res://Scenes/Levelselect.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

# Play firework after level ends
func _on_GameManager_LevelOver():
    $Fireworks/Explosionm.show()
    $Fireworks/Explosionm.play("default")
    $Fireworks/FireworkPlayer.play()

# Firework done -> back to level select
func _on_Explosionm_animation_finished():
    # warning-ignore:return_value_discarded
    get_tree().change_scene_to(LevelSelect)
