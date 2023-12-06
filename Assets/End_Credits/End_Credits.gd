extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 50  # Adjust the scrolling speed as needed

onready var credit = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move the Label upwards
	credit.rect_position.y -= speed * delta

	# Check if the Label is out of the screen
	if credit.rect_position.y < -get_viewport_rect().size.y / 2:
		# Reset the position for continuous scrolling
		credit.rect_position.y = get_viewport_rect().size.y / 2
		

