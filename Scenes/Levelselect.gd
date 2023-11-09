extends Node2D

var bodyenteredforest = 0
var bodyentereddesert = 0
var bodyenteredlava = 0

func _on_forestarea_body_entered(body):
    if body.is_in_group("traveller") and Input.is_action_just_pressed("ui_up"):
        body.hide()
        bodyenteredforest = bodyenteredforest + 1
        if bodyenteredforest == 2:
            get_tree().change_scene("res://LevelMaps/Level1Map.tscn")
