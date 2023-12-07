extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    $AnimationPlayer2.play("LevelMapsjumpinspike")



func _on_AnimatedSprite_animation_finished():
    $AnimationPlayer.play("shoot")
