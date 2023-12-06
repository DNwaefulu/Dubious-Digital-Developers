extends Node2D

onready var P1 = $Player1
onready var multiplier = 1


func _on_TextureButton_pressed():
    if get_tree().change_scene("res://Scenes/MainMenu.tscn") != OK:
        print("Error!")
    queue_free()

func _process(_delta):
    P1.velocity = P1.velocity * multiplier  
    print(P1.velocity)



func _on_Goal_PlayerMovement():
    multiplier = 0
