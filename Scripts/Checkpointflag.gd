extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.





func _on_Area2D_body_entered(body):
    if body.is_in_group("1"):
        print("Player-1 entered the checkpoint")
        Checkpoint.last_position_first = global_position
        $AnimationPlayer.play("checkpointactive")
    elif body.is_in_group("2"):
        print("Player-2 entered the checkpoint")
        Checkpoint.last_position_second = global_position
        $AnimationPlayer.play("checkpointactive")
