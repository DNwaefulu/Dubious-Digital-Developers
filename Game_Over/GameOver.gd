extends MarginContainer

signal update_settings()

const play_again = preload("res://Levels/Level1.tscn")
const settings_scene = preload("res://Scenes/settingsmenu.tscn")

onready var playAgain_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/PlayAgainContainer/HBoxContainer/Selector
onready var return_selector = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/PlayAgainContainer2/HBoxContainer/Selector

var current_selector = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
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
		get_parent().add_child(play_again.instance())
		queue_free()
	elif _current_selector == 1:
		var popup_instance = load("res://Scenes/MainMenu.tscn").instance()
		add_child(popup_instance)
		popup_instance.popup_centered()


func set_current_selection(_current_selection):
	playAgain_selector.text = ""
	return_selector.text = ""
	if _current_selection == 0:
		playAgain_selector.text = ">"
	elif _current_selection == 1:
		return_selector.text = ">"


