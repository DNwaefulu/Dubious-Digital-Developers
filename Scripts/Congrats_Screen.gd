extends Node2D

const Credits = preload("res://Scenes/End_Credits_Updated.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
   if Input.is_action_just_pressed("ui_cancel"):
        # warning-ignore:return_value_discarded
        get_tree().change_scene_to(Credits)
        queue_free()


func _on_Leave_Button_pressed():
    # warning-ignore:return_value_discarded
    get_tree().change_scene_to(Credits)
