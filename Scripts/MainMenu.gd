extends MarginContainer

const play_scene = preload("res://Scenes/Levelselect.tscn")
const controls_scene = preload("res://Scenes/Controls.tscn")
const settings_scene = preload("res://Scenes/SettingsMenu.tscn")
const credits_scene = preload("res://Scenes/End_Credits_Updated.tscn")

onready var play_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/PlayContainer/HBoxContainer/Selector
onready var controls_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/ControlsContainer/HBoxContainer/Selector
onready var settings_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/SettingsContainer/HBoxContainer/Selector
onready var credits_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CreditsContainer/HBoxContainer/Selector
onready var exit_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/ExitContainer/HBoxContainer/Selector

var current_selector = 0


func _ready():
  $MainMenuNoisePlayer.play()
  $CenterContainer/AnimationPlayer.play("Mainmenu")
  var dbvol = linear2db(Save.game_data.master_vol)
  var bus_name = "Master"
  var bus_index = AudioServer.get_bus_index(bus_name)
  AudioServer.set_bus_volume_db(bus_index, dbvol)


  dbvol = linear2db(Save.game_data.sfx_vol)
  bus_name = "SFX"
  bus_index = AudioServer.get_bus_index(bus_name)
  AudioServer.set_bus_volume_db(bus_index, dbvol)

  dbvol = linear2db(Save.game_data.music_vol)
  bus_name = "Music"
  bus_index = AudioServer.get_bus_index(bus_name)
  AudioServer.set_bus_volume_db(bus_index, dbvol)

  set_current_selection(0)
  


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
        # warning-ignore:return_value_discarded
        get_tree().change_scene_to(play_scene)
        queue_free()
    elif _current_selector == 1:
        # warning-ignore:return_value_discarded
        get_tree().change_scene_to(controls_scene)
        queue_free()
    elif _current_selector == 2:
        # warning-ignore:return_value_discarded
        get_tree().change_scene_to(settings_scene)
        queue_free()
    elif _current_selector == 3:
        # warning-ignore:return_value_discarded
        get_tree().change_scene_to(credits_scene)
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

