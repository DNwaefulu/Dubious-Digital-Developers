extends Node


#const play_again = preload("res://LevelMaps/Level1Map.tscn")
#const main_scene = preload("res://Scenes/MainMenu.tscn")

var current_selector = 0

# Declare member variables here. Examples
# var a = 2
# var b = text

# Called when the node enters the scene tree for the first time.
func _ready():
    set_current_selection(0)

func _process(_delta):
    if Input.is_action_just_pressed("ui_down") and (current_selector == 4):
        current_selector +=1
        $SelectorNoisePlayer.play()
        set_current_selection(current_selector)
    elif Input.is_action_just_pressed("ui_up") and (current_selector == 0):
        current_selector -=1
        $SelectorNoisePlayer.play()
        set_current_selection(current_selector)
    elif Input.is_action_just_pressed("ui_accept"):
        $SelectorNoisePlayer.play()
        handle_selection(current_selector)

func handle_selection(_current_selector):
    if _current_selector == 0:
        get_tree().change_scene("res://Scenes/MainMenu.tscn")
        queue_free()
    elif _current_selector == 1:
        get_tree().change_scene("res://Scenes/MainMenu.tscn")
        queue_free()


func set_current_selection(_current_selection):
    #playAgain_selector.text = ""
    #return_selector.text = ""
    if _current_selection == 0:
     #   playAgain_selector.text = ">"
     print("")
    elif _current_selection == 1:
      #  return_selector.text = ">"
      pass
