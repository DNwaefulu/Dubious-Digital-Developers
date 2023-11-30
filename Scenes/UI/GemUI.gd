extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gemCount = 0


# Called when the node enters the scene tree for the first time.
func _ready():
    $GemSprite/AnimationPlayer.play("rotate")
    $GemSprite2/AnimationPlayer.play("rotate")
    $GemSprite3/AnimationPlayer.play("rotate")

# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_GUI_GemCount():
    gemCount += 1
    if gemCount == 1:
        $GemSprite.show()
    if gemCount == 2:
        $GemSprite2.show()
    if gemCount == 3:
        $GemSprite3.show()
