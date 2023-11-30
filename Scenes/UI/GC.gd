extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gem_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect to the gem_init signal from the other script
	$GemCounter.connect("gem_init", self, "_on_gem_init")

func _on_gem_init(count):
	# Update the gem count
	gem_count = count
	print("Gem count:", gem_count)

	# You can perform any other actions based on the gem count here
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
