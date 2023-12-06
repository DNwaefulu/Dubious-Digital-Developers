extends Area2D

const LevelSelect = preload("res://Scenes/Levelselect.tscn")
const Congrats = preload("res://Scenes/Congrats_Screen.tscn")


var playerinGoal = 0
var gemCount = 0
var rng1 = RandomNumberGenerator.new()
var rng = RandomNumberGenerator.new()

signal PlayerMovement

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.
    
func _process(delta):
    if Input.is_action_pressed("ui_accept"):
        # warning-ignore:return_value_discarded
        var LevelID = get_parent().to_string()[5].to_int()
        if (LevelVariables.currLevel) == LevelID:
            LevelVariables.currLevel = LevelID + 1
            
        print("LEVELIUD:")
        print(LevelID)
    
        
        if LevelID == 3:
            get_tree().change_scene_to(Congrats)
        else:
            # warning-ignore:return_value_discarded
            get_tree().change_scene_to(LevelSelect)
        

# Play firework after level ends
func _on_GameManager_LevelOver():
    $Fireworks/Explosionm.show()
    $Fireworks/Explosionm.play("default")
    $Fireworks/FireworkPlayer.play()


func _on_Goal_body_entered(body):
    if body.is_in_group("Climber"):
        playerinGoal += 1
        print(playerinGoal)
        print("G")
        print(gemCount)
    if playerinGoal == 2:
        if gemCount == 3:
            $ToLeave.show()
            emit_signal("PlayerMovement")
            $Fireworks/Explosionm.show()
            $Fireworks/Explosionm.play("default")
            $Fireworks/FireworkPlayer.play()
            
            $Fireworks/Explosionm2.show()
            $Fireworks/Explosionm2.play("default")
            


func _on_Goal_body_exited(body):
    if body.is_in_group("Climber"):
        playerinGoal -= 1


func _on_PlayerUI_GemCount():
    gemCount += 1


func _on_Level1_GemC():
    gemCount = 2


func _on_Explosionm_animation_finished():
    $Fireworks/FireworkPlayer.play()
    var F1 = $Fireworks/Explosionm
    F1.speed_scale = rng.randf_range(0.4, 1) 
    #F1.position = Vector2(rng.randf_range(-86, 86), rng.randf_range(-111, -186))
    rng.randomize()


func _on_Explosionm2_animation_finished():
    $Fireworks/FireworkPlayer.play()
    var F2 = $Fireworks/Explosionm2
    F2.speed_scale = rng.randf_range(0.4, 1)
    #F2.position = Vector2(rng.randf_range(-86, 86), rng.randf_range(-111, -186))
    rng.randomize() 
