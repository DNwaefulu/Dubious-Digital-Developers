extends ColorRect


func _process(_delta):
    if Input.is_action_just_pressed("ui_cancel"):
        get_tree().change_scene("res://Scenes/MainMenu.tscn")
        queue_free()


func _on_TextureButton_pressed():
    get_tree().change_scene("res://Scenes/MainMenu.tscn")
    queue_free()
