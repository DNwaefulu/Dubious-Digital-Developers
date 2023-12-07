extends Node2D

signal GemC

#func _process(_delta):
    #if Input.is_action_just_pressed("ui_cancel"):
    # warning-ignore:return_value_discarded
        #if get_tree().change_scene("res://Scenes/MainMenu.tscn") != OK:
            #print("Error!")
        #queue_free()

func _process(_delta):
    if Input.is_action_just_pressed("Debug"):
        print("DEBUG")
        var P1 = $Player1
        var P2 = $Player2
        P1.position = Vector2(5900, -100)
        P2.position = Vector2(5900, -100)
        emit_signal("GemC")
