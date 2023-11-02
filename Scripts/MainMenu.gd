extends MarginContainer

signal update_settings()

const play_scene = preload("res://Levels/Level1.tscn")
const controls_scene = preload("res://Scripts/Controls.tscn")
const settings_scene = preload("res://Scenes/settingsmenu.tscn")
const credits_scene = preload("res://Names.tscn")

onready var play_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/PlayContainer/HBoxContainer/Selector
onready var controls_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/ControlsContainer/HBoxContainer/Selector
onready var settings_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SettingsContainer/HBoxContainer/Selector
onready var credits_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CreditsContainer/HBoxContainer/Selector
onready var exit_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/ExitContainer/HBoxContainer/Selector

var current_selector = 0

func _ready():
  $MainMenuNoisePlayer.play()
  set_current_selection(0)
  emit_signal("update_settings")
  

func _process(_delta):
  if Input.is_action_just_pressed("ui_down") and current_selector < 4:
    current_selector +=1
    $SelectorNoisePlayer.play()
    set_current_selection(current_selector)
  elif Input.is_action_just_pressed("ui_up") and current_selector > 0:
    current_selector -=1
    $SelectorNoisePlayer.play()
    set_current_selection(current_selector)
  elif Input.is_action_just_pressed("ui_accept"):
    $SelectorNoisePlayer.play()
    handle_selection(current_selector)

func handle_selection(_current_selector):
  if _current_selector == 0:
    get_parent().add_child(play_scene.instance())
    queue_free()
  elif _current_selector == 1:
    get_parent().add_child(controls_scene.instance())
    queue_free()
  elif _current_selector == 2:
    var popup_instance = load("res://Scenes/settingsmenu.tscn").instance()
    add_child(popup_instance)
    popup_instance.popup_centered()
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
