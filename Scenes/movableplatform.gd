extends Node2D

var num = 0

func _on_Button_body_entered(body):
    if body.is_in_group("Climber"):
        if body.platform == false:
            body.platform = true
            if num == 0:
                num+=1
                $KinematicBody2D.show()
                $Platform.play("platform")
                print("the body has pressed the button")


func _on_Area2D_body_exited(body):
    if body.is_in_group("Climber"):
        if body.platform == true:
            body.platform = false
