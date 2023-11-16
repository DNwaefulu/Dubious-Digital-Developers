extends Control

onready var Resume_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer/Selector
onready var quit_selector = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer3/Selector

var current_pause_selector = 0
var visibility_timer: Timer
var target_node: Label
var target_node1: HBoxContainer

func _ready():
	set_current_selection(0)
	visibility_timer = $Timer
	visibility_timer.connect("timeout", self, "_on_visibility_timeout")

## Assume you've set up the node you want to toggle visibility for
#	target_node = $"ColorRect/CenterContainer/VBoxContainer/Game Over"
#	target_node1 = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer
#	target_node1 = $ColorRect/CenterContainer/VBoxContainer/HBoxContainer3
#
#	# Set the initial visibility state
#	target_node.visible = true
#	target_node1.visible = true
#
#	# Set the timer duration (in seconds)
#	visibility_timer.wait_time = 3  # Adjust as needed
#	visibility_timer.start()
	
func _on_visibility_timeout():
	# Toggle visibility when the timer times out
	target_node.visible = !target_node.visible
	target_node.visible = !target_node.visible
	visibility_timer.start()

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
		print("hide")
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
