extends Node2D

# Variables
var scroll_speed = 30
var credits_labels = [
	[
		"End Credits"
	],[
		"Gavin George",
		"Siddharth Bhagvagar",
		"Alejandro Ojeda-Celis",
		"Deion Nwaefulu"
	]
]

func _ready():
	add_credits_labels()
	start_scrolling()
	

func add_credits_labels():
	add_credit_label("End Credits")
	add_credit_label("Gavin George")
	add_credit_label("Siddharth Bhagvagar")
	add_credit_label("Alejandro Ojeda-Celis")
	add_credit_label("Deion Nwaefulu")

func add_credit_label(text):
	var label = Label.new()
	label.text = text
	add_child(label)

func start_scrolling():
	var total_height = 0
	for child in get_children():
		if child is Label:
			total_height += child.rect_min_size.y
	
	total_height += get_children().size() * 10  # Add spacing between labels

	var scroll_duration = total_height / scroll_speed
	var target_position = Vector2(0, -total_height + self.rect_min_size.y)
	
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(self, "rect_position", self.rect_position, target_position, scroll_duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	tween.connect("tween_all_completed", self, "_on_scroll_complete")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	get_tree().change_scene("res://Names.tscn")
