extends KinematicBody2D

export var move_speed = 200.0

var velocity := Vector2.ZERO

export var controller_index2 = 1


export var jump_height : float
export var jump_time_to_peak : float
export var jump_time_to_descent : float

export var move_right := "move_right"
export var move_left := "move_left"
export var jump := "jump"

onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

func _physics_process(delta):
	velocity.y += get_gravity() * delta
	velocity.x = get_input_velocity() * move_speed
	
	if Input.is_action_just_pressed(jump) and is_on_floor():
		jump()
	
	velocity = move_and_slide(velocity, Vector2.UP)

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
	velocity.y = jump_velocity
	print(Input.get_joy_name(2))

func get_input_velocity() -> float:
	var horizontal := 0.0
	
	if Input.get_action_strength(move_left):
		horizontal -= 1.0
	if Input.get_action_strength(move_right):
		horizontal += 1.0
	
	return horizontal
