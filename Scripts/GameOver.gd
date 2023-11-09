extends Control

onready var Resume_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer/Selector
onready var quit_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer3/Selector

var current_pause_selector = 0

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
    self.hide()
    pass
  elif _current_selector == 1:
    pass

func set_current_selection(_current_selection):
  Resume_selector.text = ""
  quit_selector.text = ""
  if _current_selection == 0:
    Resume_selector.text = ">"
  elif _current_selection == 1:
    quit_selector.text = ">"

func _on_GameManager_GameOver():
    self.show()
    get_tree().paused = true
