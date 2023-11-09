extends Node2D

func _process(_delta):
    if Input.is_action_just_pressed("ui_cancel"):
    # warning-ignore:return_value_discarded
        if get_tree().change_scene("res://Scenes/MainMenu.tscn") != OK:
            print("Error!")
        queue_free()

func _on_TextureButton_pressed():
    # warning-ignore:return_value_discarded
    if get_tree().change_scene("res://Scenes/MainMenu.tscn") != OK:
        print("Error!")
    queue_free()
