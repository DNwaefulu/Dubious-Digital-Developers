extends Area2D


onready var anim = $AnimatedSprite
onready var audio = $AudioStreamPlayer

func _on_tramopline_body_entered(body):
    if body.is_in_group("Climber"):
        print("Body entered the trampoline")
        body.velocity.y = -700
        body.move_and_slide(body.velocity)
        anim.play("default")
        audio.play()


func _on_AnimatedSprite_animation_finished() -> void:
    anim.stop()
    anim.frame = 0;
    audio.stop()
