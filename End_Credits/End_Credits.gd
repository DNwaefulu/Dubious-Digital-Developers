extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 50  # Adjust the scrolling speed as needed
onready var labels = []  # Array to store Label nodes
var delay_timer: Timer


#onready var credit = $Label

# Called when the node enters the scene tree for the first time.

#func _ready():
#	# Populate the labels array with Label nodes
#	for child in get_children():
#		if child is Label:
#			labels.append(child)
#			child.rect_scale = Vector2(0.5, 0.5)  # Set initial scale
#			
#	# Initialize and connect the timeout signal of the timer
#	delay_timer = Timer.new()
#	add_child(delay_timer)
#	delay_timer.connect("timeout", self, "_on_timer_timeout")
#	delay_timer.wait_time = 2  # Adjust the delay time in seconds
#	delay_timer.start()


func _ready():
	 # Call the function to find Label nodes
	find_credit_labels($"/root/End_Credits")

func find_credit_labels(node):
	# Traverse the scene tree to find Label nodes
	for child in node.get_children():
		if child is Label:
			labels.append(child)
			child.rect_scale = Vector2(0.5, 0.5)  # Set initial scale
		# Recursive call for nested nodes
		find_credit_labels(child)
		
	# Initialize and connect the timeout signal of the timer
	delay_timer = Timer.new()
	add_child(delay_timer)
	delay_timer.connect("timeout", self, "_on_timer_timeout")
	delay_timer.wait_time = 2  # Adjust the delay time in seconds
	delay_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Move the entire Control node upwards only after the delay
	if not delay_timer.is_stopped():
		return
		
	# Move the Label upwards
	for stats in labels:
		stats.rect_position.y -= speed * delta
	
	# Iterate over labels and move them
	for label in labels:
		if label is Label:
			label.rect_position.y -= speed * delta
		
			# Check if the Label is out of the screen
			if label.rect_position.y < -get_viewport_rect().size.y / 2:
				# Reset the position for continuous scrolling
				label.rect_position.y = get_viewport_rect().size.y / 2
			
			# Scaling effect
			if label.rect_scale.x < 1:
				label.rect_scale += Vector2(0.02, 0.02) * delta
				label.rect_scale.x = min(1, label.rect_scale.x + 0.02 * delta)
				label.rect_scale.y = label.rect_scale.x  # Assuming you want to maintain aspect ratio
				
			
	
		

func _on_timer_timeout():
	# This function is called when the timer expires
	delay_timer.stop()  # Stop the timer to allow scrolling to begin
