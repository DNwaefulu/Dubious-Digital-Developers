extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move_speed = 50  # Adjust the movement speed as needed
var move_distance = 100  # Adjust the movement distance as needed
var direction = Vector2(1, 0)  # Initial movement direction
var original_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
    original_position = position
    #$Timer1.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var movement = direction * move_speed * delta
    # warning-ignore:return_value_discarded
    move_and_slide(movement)
    
    if position.distance_to(original_position) > move_distance:
        direction = -direction  # Reverse direction after reaching the move distance

func _on_Timer_timeout():
    direction = -direction  # Reverse direction when the timer triggers
