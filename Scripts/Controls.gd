extends ColorRect

func _ready():
    $ControlsStreamPlayer.play()

func _process(_delta):
    if Input.is_action_just_pressed("ui_cancel"):
        # warning-ignore:return_value_discarded
        get_tree().change_scene("res://Scenes/MainMenu.tscn")
        queue_free()


func _on_TextureButton_pressed():
    # warning-ignore:return_value_discarded
    get_tree().change_scene("res://Scenes/MainMenu.tscn")
    queue_free()
