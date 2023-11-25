extends Control

onready var firstGemAnim = $GemSprite1/AnimationPlayer
onready var secondGemAnim = $GemSprite2/AnimationPlayer
onready var thirdGemAnim = $GemSprite3/AnimationPlayer
# Called when the node enters the scene tree for the first time.
var globalGemCount
var levelNumber
func _ready():
#    for i in 3:
#        if (get_tree().get_root().get_node("Level"+str(i+1)) == get_tree().get_root().get_child(3)):
#            levelNumber = i
#            break
    $GemSprite1.hide()
    $GemSprite2.hide()
    $GemSprite3.hide()
    firstGemAnim.play("rotate")
    secondGemAnim.play("rotate")
    thirdGemAnim.play("rotate")
#    $GemSprite1/AnimataionPlayer.play("rotate")
#    $GemSprite2/AnimationPlayer.play("rotate")
#    $GemSprite3/AnimationPlayer.play("rotate")


 #Called every frame. 'delta' is the elapsed time since the previous frame.
#in case you really forget
#right now its just getting the raw value 

func _process(_delta):
    globalGemCount = get_tree().get_root().get_child(2).get_node("GameManager").get("globalGemCount")
    if globalGemCount == 1:
        $GemSprite1.show()
    if globalGemCount == 2:
        $GemSprite2.show()
    if globalGemCount == 3:
        $GemSprite3.show()


#func _on_GameManager_GemCount(globalGemCount):
#    print(globalGemCount)
#    if globalGemCount == 1:
#        $GemSprite1.show()
#    if globalGemCount == 2:
#        $GemSprite2.show()
#    if globalGemCount == 3:
#        $GemSprite3.show()
