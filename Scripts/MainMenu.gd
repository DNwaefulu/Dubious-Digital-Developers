extends MarginContainer

const play_scene = preload("res://Levels/Level1.tscn")
const controls_scene = preload("res://Scripts/Controls.tscn")
const settings_scene = preload("res://Scenes/SettingsMenu.tscn")
const credits_scene = preload("res://Scenes/End_Credits.tscn")

onready var play_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var controls_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var settings_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector
onready var credits_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/Selector
onready var exit_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/Selector

var current_selector = 0

func _ready():
  set_current_selection(0)

func _process(_delta):
  if Input.is_action_just_pressed("ui_down") and current_selector < 4:
    current_selector +=1
    set_current_selection(current_selector)
  elif Input.is_action_just_pressed("ui_up") and current_selector > 0:
    current_selector -=1
    set_current_selection(current_selector)
  elif Input.is_action_just_pressed("ui_accept"):
    handle_selection(current_selector)

func handle_selection(_current_selector):
  if _current_selector == 0:
    get_parent().add_child(play_scene.instance())
    queue_free()
  elif _current_selector == 1:
    get_parent().add_child(controls_scene.instance())
    queue_free()
  elif _current_selector == 2:
    get_parent().add_child(settings_scene.instance())
    queue_free()
  elif _current_selector == 3:
    get_parent().add_child(credits_scene.instance())
    queue_free()
  elif _current_selector == 4:
    get_tree().quit()
  

func set_current_selection(_current_selection):
  play_selector.text = ""
  controls_selector.text = ""
  settings_selector.text = ""
  credits_selector.text = ""
  exit_selector.text = ""
  if _current_selection == 0:
    play_selector.text = ">"
  elif _current_selection == 1:
    controls_selector.text = ">"
  elif _current_selection == 2:
    settings_selector.text = ">"
  elif _current_selection == 3:
    credits_selector.text = ">"
  elif _current_selection == 4:
    exit_selector.text = ">"
