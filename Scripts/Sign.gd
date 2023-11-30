extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass
    
onready var player_on_sign = 0




func _on_S1_body_entered(_body):
    player_on_sign += 1
    $Text.show()
    
    
func _on_S1_body_exited(_body):
    player_on_sign -= 1
    if player_on_sign == 0:
        $Text.hide()
