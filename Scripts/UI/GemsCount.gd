extends Control

onready var firstGemAnim = $GemSprite1/AnimationPlayer
onready var secondGemAnim = $GemSprite2/AnimationPlayer
onready var thirdGemAnim = $GemSprite3/AnimationPlayer
# Called when the node enters the scene tree for the first time.
var globalGemCount
var levelNumber
func _ready():
    $GemSprite1.hide()
    $GemSprite2.hide()
    $GemSprite3.hide()
    firstGemAnim.play("rotate")
    secondGemAnim.play("rotate")
    thirdGemAnim.play("rotate")
 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    globalGemCount = get_tree().get_current_scene().get_node("GameManager").get("globalGemCount")
    if globalGemCount == 1:
        $GemSprite1.show()
    if globalGemCount == 2:
        $GemSprite2.show()
    if globalGemCount == 3:
        $GemSprite3.show()
