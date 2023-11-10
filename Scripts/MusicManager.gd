extends Node

# Play level1 Music
func _ready():
    $Level1Music.play()

# Handles player sound effects on events
func _input(event):
    if event.is_action_pressed("player_jump1") or event.is_action_pressed("player_jump2"):
        $JumpSFX.play()

# Handles all the SFX
func _on_GameManager_SFXPlayer(sfx):
    if sfx == "GemGet":
        $GemGrab.play()
    if sfx == "LifeLost":
        $LifeLost.play()
