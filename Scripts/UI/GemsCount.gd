extends Control
#signal gem_init(count)

onready var firstGemAnim = $GemSprite1/AnimationPlayer
onready var secondGemAnim = $GemSprite2/AnimationPlayer
onready var thirdGemAnim = $GemSprite3/AnimationPlayer
# Called when the node enters the scene tree for the first time.
var globalGemCount = 0
var levelNumber
func _ready():
	firstGemAnim.play("rotate")
	secondGemAnim.play("rotate")
	thirdGemAnim.play("rotate")


func _on_PlayerUI_GemCount():
	globalGemCount += 1
	if globalGemCount == 1:
		$GemSprite1.show()
#		emit_signal("gem_init", 1)
	if globalGemCount == 2:
		$GemSprite2.show()
#		emit_signal("gem_init", 2)
	if globalGemCount == 3:
		$GemSprite3.show()
#		emit_signal("gem_init", 3)
