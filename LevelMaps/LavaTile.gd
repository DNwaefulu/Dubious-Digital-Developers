extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rising_speed = 50  # Adjust the rising speed as needed
var max_height = 500   # Adjust the maximum height the lava should reach
var original_position: Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
    original_position = position
    $Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if position.y < max_height:
        position.y += delta * rising_speed

func _on_Timer_timeout():
    if position.y < max_height:
        position.y += rising_speed
