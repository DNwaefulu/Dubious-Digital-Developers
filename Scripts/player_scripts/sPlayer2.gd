#ANYTHING NOT COMMENTED HERE JUST LOOK AT PLAYER1 SCRIPT BECAUSE ITS ALMOST ALL THE SAME

extends KinematicBody2D

export var move_speed = 200.0
export var climb_speed = 200.0

var velocity := Vector2.ZERO

export var controller_index2 = 1

var player2_start_position = Vector2(40,50)

export var jump_height : float
export var jump_time_to_peak : float
export var jump_time_to_descent : float

export var move_right := "move_right"
export var move_left := "move_left"
export var player_jump := "player_jump2"

export var platform = false

export var climbing = false

onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

#this variable will be used to see if the player can move
#mainly used for when the player decides to help the other player get up a ledge 
export var canMove = true

#this will be used to tell the player sprite and the raycast to flip when the character moves
onready var playerRaycast = $downRaycast

onready var anim = $AnimatedSprite

onready var collisionShape = $CollisionShape2D

onready var lendingArea = $LendingArea
#these are the raycasts that are going to be used for throwing and stuffffffff
#i could HONESTLY fix some code so its a lot cleaner 
#now that i think about it but damn i just need this to work 
onready var forwardRaycast = $forwardRaycast
onready var backRaycast = $backwardRaycast
#okay so, since we don't have state machines, we have to put everything here
#I have to make this boolean variable to see if the player is in the middle of throwing
#if they are not throwing, then we will be doing the prepare throw animation
#if we are throwing then we will wait until the animation is done, and then we will go back to the
#prepare throw animation
var throwing = false

var thrown = false

#variable for reference to player1
onready var player1Ref = self.owner.get_node("Player1")

func _physics_process(delta):
    if is_on_floor():
        thrown = false
    if velocity.x < 1 and is_on_floor() and velocity.x > -1:
        anim.play("a_p2_idle")
    #velocity.y += get_gravity() * delta
    if thrown == false:
        velocity.x = get_input_velocity() * move_speed
    if climbing == false:
        velocity.y += get_gravity() * delta
    elif climbing == true:
        velocity.y = 0
        if Input.is_action_pressed("player_climb2"):
            velocity.y = -climb_speed
            anim.play("a_p2_climbing")
        elif Input.is_action_pressed("player_down2"):
            velocity.y = climb_speed    
            anim.play("a_p2_climbing")
        if (velocity.y == 0):
            anim.play("a_p2_climbingPause")

    
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
    if Input.is_action_pressed("player_left2"):
        playerRaycast.position.x =-16
        lendingArea.position.x = -20
    if Input.is_action_pressed("player_right2"):
        playerRaycast.position.x = 18
        lendingArea.position.x = 20
    
    if playerRaycast.is_colliding() and Input.is_action_pressed("player_lending2") and is_on_floor():
        canMove = false
        velocity.x = 0
        if throwing == false:
            anim.play("a_p2_prepareThrow")
        if backRaycast.is_colliding():
            if backRaycast.get_collider() == player1Ref:
                throwing = true
                anim.play("a_p2_throw")
                yield(anim,"animation_finished")
                throwing = false
    
    #OKAY so this ccode is working,BUT since the characters are able to collide with one another
    #they don't go nowhere :/
    #so what i need to do is either
    #A) make it to where if they get launched then they can't collide with each other for a second
    #B) remmove their collision entirely 
    #i'll try that and see how it plays
    if forwardRaycast.is_colliding() and forwardRaycast.get_collider() == player1Ref and player1Ref.get("throwing") == true:
        thrown = true
        velocity.y = jump_velocity * 1.25
        velocity.x = get_input_velocity() * 250
            
func get_gravity() -> float:
    return jump_gravity if velocity.y < 0.0 else fall_gravity

func jump():
    velocity.y = jump_velocity
    anim.play("a_p2_jumping")
    $JumpSound.play()

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

func _on_Death_zone_body_entered(body: Node) -> void:
    if (body == self):
        position = player2_start_position

func _on_LendingArea_body_entered(body):
    if Input.is_action_pressed("player_lending2") and not is_on_floor() and player1Ref.get("canMove") == false and body.name == "Player1":
        velocity.y = jump_velocity


func _on_Goal_PlayerMovement():
    set_physics_process(false)
    anim.play("a_idle")
func _on_tramopline_body_entered(body: Node) -> void:
    anim.play("a_p2_jumping")
