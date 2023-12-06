extends Node2D

func _enter_tree():
    if Checkpoint.last_position_first:
        $Player1.global_position = Checkpoint.last_position_first
    elif Checkpoint.last_position_second:
        $Player2.global_position = Checkpoint.last_position_second
