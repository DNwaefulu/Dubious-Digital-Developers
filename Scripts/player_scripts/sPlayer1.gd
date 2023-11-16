extends KinematicBody2D

#movement speed
export var move_speed = 200.0
export var climb_speed = 200.0

#start position for when they die
var player1_start_position = Vector2(50,50)

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

export var player_jump := "player_jump1"


export var climbing = false

#this variable will be used to see if the player can move
#mainly used for when the player decides to help the other player get up a ledge 
var canMove = true

#this will be used to tell the player sprite and the raycast to flip when the character moves
onready var playerRaycast = $downRaycast

#getting a reference to the animation sprite
onready var anim = $AnimatedSprite

#testing forward raycast
onready var forwardRaycast = $forwardRaycast
onready var backRaycast = $backwardRaycast
#okay so, since we don't have state machines, we have to put everything here
#I have to make this boolean variable to see if the player is in the middle of throwing
#if they are not throwing, then we will be doing the prepare throw animation
#if we are throwing then we will wait until the animation is done, and then we will go back to the
#prepare throw animation
var throwing = false

func _physics_process(delta):
    if velocity.x < 1 and is_on_floor() and velocity.x > -1:
        anim.play("a_idle")
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
    

    if Input.is_action_just_pressed("player_jump1") and is_on_floor() and climbing == false and canMove == true:
        jump()
    
    velocity = move_and_slide(velocity, Vector2.UP)
    
    #if the player is on the ledge and they are holding down right trigger and they are on the floor 
    #then they can't move and we will call another function later which 
    #will allow the player jumping to them to grab on and launch themselves
    if not playerRaycast.is_colliding() and Input.is_action_pressed("player_lending1") and is_on_floor():
        canMove = false
        velocity.x = 0
        anim.play("a_lending")
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
                
    #okay so this is supposed to be the code for if the other player comes into contact
    #with this player while they are trying to throw them, then it will play an animation 
    #BUT ITS NOT WORKING HOW I WANT IT TO, 
    #its kinda working so it'll do for now
    if playerRaycast.is_colliding() and Input.is_action_pressed("player_lending1") and is_on_floor():
        canMove = false
        velocity.x = 0
        if throwing == false:
            anim.play("a_p1_prepareThrow")
        if backRaycast.is_colliding():
            print(backRaycast.get_collider())
            if backRaycast.get_collider() == get_tree().get_root().get_node("Level1/Player2"):
                throwing = true
                anim.play("a_p1_throw")
                yield(anim,"animation_finished")
                throwing = false
#honestly i stole most of this code, this just works
func get_gravity() -> float:
    return jump_gravity if velocity.y < 0.0 else fall_gravity

#jump function, pretty self explanatory i think
func jump():
    velocity.y = jump_velocity
    anim.play("a_jumping")
    $JumpSound.play()


#movement stuff, again, borrowed this code so it just works for the movement 
func get_input_velocity() -> float:
    var horizontal := 0.0
    
    if Input.get_action_strength(move_left):
        horizontal -= 1.0
        anim.flip_h = true
        if is_on_floor():
            anim.play("a_walking")
    if Input.get_action_strength(move_right):
        horizontal += 1.0
        anim.flip_h = false
        if is_on_floor():
            anim.play("a_walking")
    
    return horizontal
#whenever the player reaches the death zone then it will just reset them to the position 
#that's set earlier in this script
func _on_Death_zone_body_entered(body: Node) -> void:
    if (body == self):
        position = player1_start_position


func _on_LendingArea_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
    print(body,body_rid)
    if Input.is_action_pressed("player_lending1") and not is_on_floor() and get_tree().get_root().get_node("Level1/Player2").get("canMove") == false:
        velocity.y = jump_velocity
