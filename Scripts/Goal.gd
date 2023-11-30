extends Area2D

const LevelSelect = preload("res://Scenes/Levelselect.tscn")


var playerinGoal = 0
var gemCount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Play firework after level ends
func _on_GameManager_LevelOver():
	$Fireworks/Explosionm.show()
	$Fireworks/Explosionm.play("default")
	$Fireworks/FireworkPlayer.play()

# Firework done -> back to level select
func _on_Explosionm_animation_finished():
	
	# warning-ignore:return_value_discarded
	var LevelID = get_parent().to_string()[5].to_int() + 1
	if LevelVariables.currLevel < LevelID:
		LevelVariables.currLevel = LevelID
	get_tree().change_scene_to(LevelSelect)


func _on_Goal_body_entered(body):
	if body.is_in_group("Climber"):
		playerinGoal += 1
		print("P")
		print(playerinGoal)
	if playerinGoal == 2:
		print("TPIG")
		if gemCount == 3:
			print("TGC")
			$Fireworks/Explosionm.show()
			$Fireworks/Explosionm.play("default")
			$Fireworks/FireworkPlayer.play()


func _on_GUI_GemCount():
	gemCount += 1


func _on_Goal_body_exited(body):
	if body.is_in_group("Climber"):
		playerinGoal -= 1
