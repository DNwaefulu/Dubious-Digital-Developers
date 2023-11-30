extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_count = 0
var move_speed = 50
var original_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
    original_position = position
    $KinematicBody2D.connect("player_entered", self, "_on_platform_entered")
    $KinematicBody2D2.connect("player_entered", self, "_on_platform_entered")
    $KinematicBody2D3.connect("player_entered", self, "_on_platform_entered")
    $KinematicBody2D4.connect("player_entered", self, "_on_platform_entered")
    $KinematicBody2D5.connect("player_entered", self, "_on_platform_entered")
    
    $KinematicBody2D.connect("player_exited", self, "_on_platform_exited")
    $KinematicBody2D2.connect("player_exited", self, "_on_platform_exited")
    $KinematicBody2D3.connect("player_exited", self, "_on_platform_exited")
    $KinematicBody2D4.connect("player_exited", self, "_on_platform_exited")
    $KinematicBody2D5.connect("player_exited", self, "_on_platform_exited")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if player_count >= 2:
        position.y += delta * move_speed

signal player_entered()
signal player_exited()

func _on_Platform_body_entered(body):
    if body.is_in_group("player"):
        player_count += 1
        emit_signal("player_entered")

func _on_Platform_body_exited(body):
    if body.is_in_group("player"):
        player_count -= 1
        emit_signal("player_exited")

func _on_player_entered():
    if player_count == 2:
        move_platform_down()

func _on_player_exited():
    if player_count < 2:
        reset_platform_position()

func move_platform_down():
    position.y += move_speed

func reset_platform_position():
    position = original_position

