extends MarginContainer

onready var display_options = $CenterContainer/Audiosettings/VBoxContainer/HBoxContainer4/Option
onready var vsync_btn = $CenterContainer/Audiosettings/VBoxContainer/HBoxContainer5/Vsyncbtn

onready var sfx_slider = $CenterContainer/Audiosettings/VBoxContainer/HBoxContainer/Masterslider
onready var music_slider = $CenterContainer/Audiosettings/VBoxContainer/HBoxContainer2/SFXslider
onready var master_slider = $CenterContainer/Audiosettings/VBoxContainer/HBoxContainer3/Musicslider


func _ready():
  
  display_options.select(1 if Save.game_data.fullscreen_on else 0)
  GlobalSettings.toggle_fullscreen(Save.game_data.fullscreen_on)
  vsync_btn.pressed = Save.game_data.vsync_on
  $SettingsStreamPlayer.play()

  # Update all volume sliders to the proper value
  master_slider.value = Save.game_data.master_vol
  sfx_slider.value = Save.game_data.sfx_vol
  music_slider.value = Save.game_data.music_vol

  master_slider.grab_focus()

func _process(_delta):
    if Input.is_action_just_pressed("ui_cancel"):
# warning-ignore:return_value_discarded
        get_tree().change_scene("res://Scenes/MainMenu.tscn")
        queue_free()

func _on_Vsyncbtn_toggled(button_pressed):
  GlobalSettings.toggle_vsync(button_pressed)
  pass


func _on_Option_item_selected(index):
  GlobalSettings.toggle_fullscreen(true if index == 1 else false)
  pass

func _on_TextureButton_pressed():
    # warning-ignore:return_value_discarded
    get_tree().change_scene("res://Scenes/MainMenu.tscn")
    queue_free()

func _on_Masterslider_value_changed(value):
  GlobalSettings.update_master_vol(linear2db(value))

func _on_SFXslider_value_changed(value):
  if !$SFXStreamPlayer.playing:
    $SFXStreamPlayer.play()
  GlobalSettings.update_sfx_vol(linear2db(value))

func _on_Musicslider_value_changed(value):
    GlobalSettings.update_music_vol(linear2db(value))
