extends Node2D

signal GemC


func _on_TextureButton_pressed():
    if get_tree().change_scene("res://Scenes/MainMenu.tscn") != OK:
        print("Error!")
    queue_free()
    
#func _enter_tree():
 #   if Checkpoint.last_position_first:
  #      $Player1.global_position = Checkpoint.last_position_first
   # if Checkpoint.last_position_first:
    #    $Player1.global_position = Checkpoint.last_position_first   

func _process(_delta):
    if Input.is_action_just_pressed("Debug"):
        print("DEBUG")
        var P1 = $Player1
        var P2 = $Player2
        P1.position = Vector2(4500, -200)
        P2.position = Vector2(4500, -200)
        print("emitC")
        emit_signal("GemC")



func _on_Gem_body_entered(_body):
    pass # Replace with function body.
    
    
