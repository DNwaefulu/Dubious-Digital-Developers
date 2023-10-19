extends KinematicBody2D

#movement speed
export var move_speed = 200.0
export var climb_speed = 200.0

#start position for when they die
var player1_start_position = Vector2(44,480)

#setting initial values for the velocity
var velocity := Vector2.ZERO

#setting the controller index for the player which for player 1 is zero
export var controller_index = 0

#all of this code has to do with jumping
export var jump_height : float
export var jump_time_to_peak : float
export var jump_time_to_descent : float
onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

#exporting variables for movement
export var move_right := "move_right"
export var move_left := "move_left"
export var jump := "jump"
export var climbing = false

#this variable will be used to see if the player can move
#mainly used for when the player decides to help the other player get up a ledge 
var canMove = true

#this will be used to tell the player sprite and the raycast to flip when the character moves
onready var playerRaycast = $RayCast2D

onready var playerArea2D = $ColorRect/Area2D

func _physics_process(delta):
	if climbing == false:
		velocity.y += get_gravity() * delta
	elif climbing == true:
		velocity.y = 0
		if Input.is_action_pressed("player_climb1"):
			velocity.y = -climb_speed
		elif Input.is_action_pressed("player_down1"):
			velocity.y = climb_speed
	
	if canMove == true:
		velocity.x = get_input_velocity() * move_speed
	
	if Input.is_action_just_pressed(jump) and is_on_floor() and climbing == false and canMove == true:
		jump()
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#if the player is on the ledge and they are holding down right trigger and they are on the floor 
	#then they can't move and we will call another function later which 
	#will allow the player jumping to them to grab on and launch themselves
	if not playerRaycast.is_colliding() and Input.is_action_pressed("player_lending1") and is_on_floor():
		canMove = false
		velocity.x = 0
	else:
		canMove = true
		
		#OKAY SO WE ARE HARD CODING VALUES HERE
		#I COULDN'T FIGURE OUT ANOTHER WAY TO SOLVE THIS 
		#WHATS HAPPENING IS THE PLAYERS RAYCAST IS NOT FLIPPING 
		#AND WHEN I TRY TO IMPLEMENT A POSITION2D IT DOESNT WORK
		#SO INSTEAD OF FLIPPING RELATIVE TO OTHER SHIT
		#WE ARE JUST HARD CODING WHERE THE THE RAYCAST SHOULD BE DEPENDING ON IF THE PLAYER LAST MOVED LEFT OR RIGHT
	if velocity.x > 0:
		playerRaycast.position.x =40
	elif velocity.x < 0:
		playerRaycast.position.x =0
		
	#THIS WORKS OH MY GOD
	#okay so what this does basically is
	#if the player is holding down R2 and they are jumping in the air
	#and Player 2 is also next to a ledge and holding down R2 then the player jumping will basically get another jump
	#because the other player is launching them
	#IT WORKS!!!
	if Input.is_action_pressed("player_lending1") and not is_on_floor() and get_tree().get_root().get_node("Level1/Player2").get("canMove") == false:
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.name == "Player2":
				velocity.y = jump_velocity

#honestly i stole most of this code, this just works
func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

#jump function, pretty self explanatory i think
func jump():
	velocity.y = jump_velocity

#movement stuff, again, borrowed this code so it just works for the movement 
func get_input_velocity() -> float:
	var horizontal := 0.0
	
	if Input.get_action_strength(move_left):
		horizontal -= 1.0

	if Input.get_action_strength(move_right):
		horizontal += 1.0

	return horizontal

#func reach_for_player():
	
#whenever the player reaches the death zone then it will just reset them to the position 
#that's set earlier in this script
func _on_Death_zone_body_entered(body: Node) -> void:
	position = player1_start_position

