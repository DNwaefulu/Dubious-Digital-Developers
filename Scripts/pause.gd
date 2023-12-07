extends Control


onready var Resume_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer/Selector
onready var quit_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer3/Selector
var current_pause_selector = 0
const main_menu = preload("res://Scenes/MainMenu.tscn")

var isGameOver = false
#creates a var and set the value false using the function
var is_paused = false setget set_is_paused

#function is changing the is_pause by the boolean and pausing the game
func set_is_paused(value):
    is_paused = value
    get_tree().paused = is_paused
    visible = is_paused
    
#here the input from the controller will trigger to pause the game
func _unhandled_input(event):
    if event.is_action_pressed("pause") and isGameOver == false:
        self.is_paused = !is_paused

func _ready():
    visible = false
    set_current_selection(0)

func _process(_delta):
    if isGameOver == false:
        if Input.is_action_just_pressed("ui_down") and current_pause_selector < 1:
            current_pause_selector +=1
            set_current_selection(current_pause_selector)
        elif Input.is_action_just_pressed("ui_up") and current_pause_selector > 0:
            current_pause_selector -=1
            set_current_selection(current_pause_selector)
        elif Input.is_action_just_pressed("ui_accept"):
            handle_selection(current_pause_selector)

func handle_selection(_current_selector):
  if _current_selector == 0:
    self.is_paused =  false
  elif _current_selector == 1:
    self.is_paused =  false
    Checkpoint.last_position_first = Vector2(80,50)
    Checkpoint.last_position_second = Vector2(40,50)
    # warning-ignore:return_value_discarded
    get_tree().change_scene_to(main_menu)

func set_current_selection(_current_selection):
  Resume_selector.text = ""
  quit_selector.text = ""
  if _current_selection == 0:
    Resume_selector.text = ">"
  elif _current_selection == 1:
    quit_selector.text = ">"


func _on_HeartsUI_heartsDepleted() -> void:
    isGameOver = true
