extends Control

onready var Resume_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer/Selector
onready var quit_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer3/Selector

const main_menu = preload("res://Scenes/MainMenu.tscn")


var current_pause_selector = 0

var isGameOver = false

var is_paused = false setget set_is_paused

#function is changing the is_pause by the boolean and pausing the game
func set_is_paused(value):
    is_paused = value
    get_tree().paused = is_paused
    visible = is_paused

func _ready():
   self.hide() 
   set_current_selection(0)

func _process(_delta):
    if isGameOver == true:
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
    self.hide()
    # warning-ignore:return_value_discarded
    var currentlvl = load("res://LevelMaps/"+ str(get_tree().get_current_scene().get_name()) + "Map.tscn")
    get_tree().change_scene_to(currentlvl)
    Checkpoint.last_position_first = Vector2(80,50)
    Checkpoint.last_position_second = Vector2(40,50)
    get_tree().paused = false
  elif _current_selector == 1:
    # warning-ignore:return_value_discarded
    Checkpoint.last_position_first = Checkpoint.Start1
    Checkpoint.last_position_second = Checkpoint.Start2
    get_tree().change_scene_to(main_menu)
    get_tree().paused = false

func set_current_selection(_current_selection):
  Resume_selector.text = ""
  quit_selector.text = ""
  if _current_selection == 0:
    Resume_selector.text = ">"
  elif _current_selection == 1:
    quit_selector.text = ">"
    

func _on_HeartsUI_heartsDepleted() -> void:
    visible = true
    isGameOver = true
    #get_tree().paused = !is_paused
    self.is_paused = !is_paused
