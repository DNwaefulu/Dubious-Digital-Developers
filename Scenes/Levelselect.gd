extends Node2D

var body1enteredforest = 0
var body1entereddesert = 0
var body1enteredlava = 0
var body2enteredforest = 0
var body2entereddesert = 0
var body2enteredlava = 0

var body1forest = false
var body2forest = false
var body1desert = false
var body2desert = false
var body1lava = false
var body2lava = false



func _on_Area2D_body_entered(body):
    if body.is_in_group("1"):
        if body1forest == false:
            body1forest = true
            print("the body has entered the forest level area")
    elif body.is_in_group("2"):
        if body2forest == false:
            body2forest = true
            print("the body has entered the forest level area")


func _process(_delta):
    if Input.is_action_just_pressed("ui_accept"):
        if body1forest == true:
            print("enter the level -1")
            body1enteredforest = 1
            body1entereddesert = 0
            body1enteredlava = 0
        if body1desert == true:
            print("enter the level -2")
            body1entereddesert = 1
            body1enteredlava = 0
            body1enteredforest = 0
        if body1lava == true:
            print("enter the level -3")
            body1enteredlava = 1
            body1enteredforest = 0
            body1entereddesert = 0
        if body1enteredforest+body2enteredforest == 2:
            if get_tree().change_scene("res://LevelMaps/Level1Map.tscn") != OK:
                print("Error!")
            queue_free()
        if body1entereddesert+body2entereddesert == 2:
            if get_tree().change_scene("res://LevelMaps/Level2Map.tscn") != OK:
                print("Error!")
            queue_free()
        if body1enteredlava+body2enteredlava == 2:
            if get_tree().change_scene("res://LevelMaps/Level3Map.tscn") != OK:
                print("Error!")
            queue_free()
    if Input.is_action_just_pressed("ui_accept"):
        if body2forest == true:
            print("enter the level -1")
            body2enteredforest = 1
            body2entereddesert = 0
            body2enteredlava = 0
        if body2desert == true:
            print("enter the level -2")
            body2entereddesert = 1
            body2enteredlava = 0
            body2enteredforest = 0
        if body2lava == true:
            print("enter the level -3")
            body2enteredlava = 1
            body2enteredforest = 0
            body2entereddesert = 0
        if body1enteredforest+body2enteredforest == 2:
            if get_tree().change_scene("res://LevelMaps/Level1Map.tscn") != OK:
                print("Error!")
            queue_free()
        if body1entereddesert+body2entereddesert == 2:
            if get_tree().change_scene("res://LevelMaps/Level2Map.tscn") != OK:
                print("Error!")
            queue_free()
        if body1enteredlava+body2enteredlava == 2:
            if get_tree().change_scene("res://LevelMaps/Level3Map.tscn") != OK:
                print("Error!")
            queue_free()
    if Input.is_action_just_pressed("ui_cancel"):
        # warning-ignore:return_value_discarded
        if get_tree().change_scene("res://Scenes/MainMenu.tscn") != OK:
            print("Error!")
        queue_free()

func _on_Area2D_body_exited(body):
    if body.is_in_group("1"):
        if body1forest == true:
            body1forest = false
            print("the body has exited the forest level area")
    elif body.is_in_group("2"):
        if body2forest == true:
            body2forest = false
            print("the body has exited the forest level area")


func _on_desertarea_body_entered(body):
    if body.is_in_group("1"):
        if body1desert == false:
            body1desert = true
            print("the body 1  has entered the desert level area")
    elif body.is_in_group("2"):
        if body2desert == false:
            body2desert = true
            print("the body 2 has entered the desert level area")


func _on_desertarea_body_exited(body):
    if body.is_in_group("1"):
        if body1desert == true:
            body1desert = false
            print("the body 1 has exited the desert level area")
    elif body.is_in_group("2"):
        if  body2desert== true:
            body2desert = false
            print("the body 2 has exited the desert level area")


func _on_lavaarea_body_entered(body):
    if body.is_in_group("1"):
        if body1lava == false:
            body1lava = true
            print("the body 1  has entered the lava level area")
    elif body.is_in_group("2"):
        if body2lava == false:
            body2lava = true
            print("the body 2 has entered the lava level area")


func _on_lavaarea_body_exited(body):
    if body.is_in_group("1"):
        if body1lava == true:
            body1lava = false
            print("the body 1 has exited the desert level area")
    elif body.is_in_group("2"):
        if  body2lava== true:
            body2lava = false
            print("the body 2 has exited the desert level area")


func _on_TextureButton_pressed():
    if get_tree().change_scene("res://Scenes/MainMenu.tscn") != OK:
        print("Error!")
    queue_free()
