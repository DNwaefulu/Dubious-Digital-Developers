extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var anim = $GemSprite/AnimationPlayer
onready var stream = $AudioStreamPlayer
onready var gemGetAnim = $gemGet/gemGetAnimationPlayer
onready var gemGetSprite = $gemGet
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    anim.play("rotate")


func _on_Area2D_body_entered(_body: Node) -> void:
    stream.play()
    #$CollisionShape2D.disabled = true
    print("disabled")
    $GemSprite.visible = false
    gemGetSprite.visible = true
    gemGetAnim.play("GemGet")
    yield(gemGetAnim,"animation_finished")
    queue_free()
