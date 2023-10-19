extends Popup

onready var display_options = $SettingTab/Display/MarginContainer2/Displaysetting/VBoxContainer/HBoxContainer/Option
onready var vsync_btn = $SettingTab/Display/MarginContainer2/Displaysetting/VBoxContainer/HBoxContainer2/Vsyncbtn
onready var brightness_slider = $SettingTab/Display/MarginContainer2/Displaysetting/VBoxContainer/HBoxContainer3/Brightnesslevel

onready var sfx_slider = $SettingTab/Audio/MarginContainer/Audiosettings/VBoxContainer/HBoxContainer2/SFXslider
onready var music_slider = $SettingTab/Audio/MarginContainer/Audiosettings/VBoxContainer/HBoxContainer3/Musicslider
onready var master_slider = $SettingTab/Audio/MarginContainer/Audiosettings/VBoxContainer/HBoxContainer/Masterslider

func _ready():
	
	#display_options.select(1 if Save.game_data.fullscreen_on else 0)
	#GlobalSettings.toggle_fullscreen(Save.game_data.fullscreen_on)
	#vsync_btn.pressed = Save.game_data.vsync_on
	#brightness_slider.value = Save.game_data.brightness
	#master_slider.value = Save.game_data.master_vol
	pass


func _on_Brightnesslevel_value_changed(value):
	#GlobalSettings.update_brightness(value)
	pass


func _on_Vsyncbtn_toggled(button_pressed):
	#GlobalSettings.toggle_vsync(button_pressed)
	pass


func _on_Option_item_selected(index):
	#GlobalSettings.toggle_fullscreen(true if index == 1 else false)
	pass


func _on_Masterslider_value_changed(value):
	#GlobalSettings.update_master_vol(value)
	pass


