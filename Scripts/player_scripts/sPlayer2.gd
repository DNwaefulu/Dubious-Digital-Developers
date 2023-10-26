#ANYTHING NOT COMMENTED HERE JUST LOOK AT PLAYER1 SCRIPT BECAUSE ITS ALMOST ALL THE SAME

extends KinematicBody2D

export var move_speed = 200.0
export var climb_speed = 200.0

var velocity := Vector2.ZERO

export var controller_index2 = 1

var player2_start_position = Vector2(262,462)

export var jump_height : float
export var jump_time_to_peak : float
export var jump_time_to_descent : float

export var move_right := "move_right"
export var move_left := "move_left"
export var jump2 := "player_jump2"
export var climbing = false

onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

#this variable will be used to see if the player can move
#mainly used for when the player decides to help the other player get up a ledge 
export var canMove = true

#this will be used to tell the player sprite and the raycast to flip when the character moves
onready var playerRaycast = $RayCast2D

func _physics_process(delta):
# Here is the implimantation for ladder which returns true if the body entered in 
# the ladder changing the gravity to 0 and false if the body exited the ladder and 
# changing the gravity back to normal.
    if climbing == false:
        velocity.y += get_gravity() * delta
    elif climbing == true:
        velocity.y = 0
        if Input.is_action_pressed("player_climb1"):
            velocity.y = -climb_speed
        elif Input.is_action_pressed("player_down1"):
            velocity.y = climb_speed
    velocity.x = get_input_velocity() * move_speed
  
    if Input.is_action_just_pressed(jump2) and is_on_floor():
        jump()
  
    if canMove == true:
        velocity = move_and_slide(velocity, Vector2.UP)
  
  #if the player is on the ledge and they are holding down right trigger and they are on the floor 
  #then they can't move and we will call another function later which 
  #will allow the player jumping to them to grab on and launch themselves
  if not playerRaycast.is_colliding() and Input.is_action_pressed("player_lending2") and is_on_floor():
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



func _on_Death_zone_body_entered(_body):
  position = player2_start_position
