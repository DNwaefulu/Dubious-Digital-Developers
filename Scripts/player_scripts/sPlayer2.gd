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
export var player_jump := "player_jump2"

onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

#this variable will be used to see if the player can move
#mainly used for when the player decides to help the other player get up a ledge 
export var canMove = true

#this will be used to tell the player sprite and the raycast to flip when the character moves
onready var playerRaycast = $RayCast2D

onready var anim = $AnimatedSprite

onready var collisionShape = $CollisionShape2D

func _physics_process(delta):
    if velocity.x < 1 and is_on_floor() and velocity.x > -1:
        anim.play("a_p2_idle")
    velocity.y += get_gravity() * delta
    velocity.x = get_input_velocity() * move_speed
    
    if Input.is_action_just_pressed(player_jump) and is_on_floor():
        jump()
    
    if canMove == true:
        velocity = move_and_slide(velocity, Vector2.UP)
    
    #if the player is on the ledge and they are holding down right trigger and they are on the floor 
    #then they can't move and we will call another function later which 
    #will allow the player jumping to them to grab on and launch themselves
    if not playerRaycast.is_colliding() and Input.is_action_pressed("player_lending2") and is_on_floor():
        canMove = false
        velocity.x = 0
        anim.play("a_p2_lending")
    else:
        canMove = true
        
        #OKAY SO WE ARE HARD CODING VALUES HERE
        #I COULDN'T FIGURE OUT ANOTHER WAY TO SOLVE THIS 
        #WHATS HAPPENING IS THE PLAYERS RAYCAST IS NOT FLIPPING 
        #AND WHEN I TRY TO IMPLEMENT A POSITION2D IT DOESNT WORK
        #SO INSTEAD OF FLIPPING RELATIVE TO OTHER SHIT
        #WE ARE JUST HARD CODING WHERE THE THE RAYCAST SHOULD BE DEPENDING ON IF THE PLAYER LAST MOVED LEFT OR RIGHT
    if velocity.x > 0:
        playerRaycast.position.x =18
    elif velocity.x < 0:
        playerRaycast.position.x =-16
        
    if Input.is_action_pressed("player_lending2") and not is_on_floor() and get_tree().get_root().get_node("Level1/Player1").get("canMove") == false:
        for i in get_slide_count():
            var collision = get_slide_collision(i)
            if collision.collider.name == "Player1":
                velocity.y = jump_velocity
    
    if playerRaycast.is_colliding() and Input.is_action_pressed("player_lending2") and is_on_floor():
        canMove = false
        velocity.x = 0
        anim.play("a_p2_prepareThrow")
        for i in get_slide_count():
            var collision = get_slide_collision(i)
            print(collision.collider.name)
            if collision.collider.name == "Player1":
                anim.play("a_p2_throw")
        
        

func get_gravity() -> float:
    return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
    velocity.y = jump_velocity
    anim.play("a_p2_jumping")

func get_input_velocity() -> float:
    var horizontal := 0.0
    
    if Input.get_action_strength(move_left):
        horizontal -= 1.0
        anim.flip_h = true
        if is_on_floor():
            anim.play("a_p2_walking")
    if Input.get_action_strength(move_right):
        horizontal += 1.0
        anim.flip_h = false
        if is_on_floor():
            anim.play("a_p2_walking")
    
    return horizontal



func _on_Death_zone_body_entered(_body):
  position = player2_start_position
