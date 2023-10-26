extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var anim = $Sprite/AnimationPlayer
onready var collision = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  anim.play("rotate")


func _on_Area2D_body_entered(_body: Node) -> void:
  queue_free()
