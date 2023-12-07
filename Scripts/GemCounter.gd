extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
    $GemSprite1/AnimationPlayer.play("rotate")
    $GemSprite2/AnimationPlayer.play("rotate")
    $GemSprite3/AnimationPlayer.play("rotate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_GameManager_GemCount(globalGemCount):
    print(globalGemCount)
    if globalGemCount == 1:
        $GemSprite1.show()
    if globalGemCount == 2:
        $GemSprite2.show()
    if globalGemCount == 3:
        $GemSprite3.show()
