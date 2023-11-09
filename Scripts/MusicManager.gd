extends Node


func _ready():
    $Level1Music.play()

func _input(event):
    if event.is_action_pressed("player_jump1") or event.is_action_pressed("player_jump2"):
        $JumpSFX.play()
        print("JUMP")


func _on_GameManager_SFXPlayer(sfx):
    if sfx == "GemGet":
        $GemGrab.play()
        print("GemGet")
    if sfx == "LifeLost":
        $LifeLost.play()
        print("LifeLost")
