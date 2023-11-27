extends CanvasLayer

onready var player1_ani = $AnimatedSprite
onready var player2_ani = $AnimatedSprite2

func _ready():
    $ControlsStreamPlayer.play()
    player1_ani.play("a_walking")
    player2_ani.play("a_p2_walking")

func _process(_delta):
    if Input.is_action_just_pressed("ui_cancel"):
        # warning-ignore:return_value_discarded
        get_tree().change_scene("res://Scenes/MainMenu.tscn")
        queue_free()


func _on_TextureButton_pressed():
    # warning-ignore:return_value_discarded
    get_tree().change_scene("res://Scenes/MainMenu.tscn")
    queue_free()

