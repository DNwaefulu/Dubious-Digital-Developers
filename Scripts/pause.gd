extends Control


onready var Resume_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer/Selector
onready var quit_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer3/Selector

var current_pause_selector = 0
#creates a var and set the value false using the function
var is_paused = false setget set_is_paused

#function is changing the is_pause by the boolean and pausing the game
func set_is_paused(value):
    is_paused = value
    get_tree().paused = is_paused
    visible = is_paused
    
#here the input from the controller will trigger to pause the game
func _unhandled_input(event):
    if event.is_action_pressed("pause"):
        self.is_paused = !is_paused

func _ready():
  set_current_selection(0)

func _process(_delta):
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
    get_tree().quit()

func set_current_selection(_current_selection):
  Resume_selector.text = ""
  quit_selector.text = ""
  if _current_selection == 0:
    Resume_selector.text = ">"
  elif _current_selection == 1:
    quit_selector.text = ">"
