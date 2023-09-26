extends ColorRect


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Input.get_connected_joypads())
	print(Input.get_joy_name(0))
	print(Input.get_joy_name(1))
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass





