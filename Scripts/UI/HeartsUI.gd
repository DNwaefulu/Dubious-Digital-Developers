extends Control

var currentLives = 3

onready var heart3 = $Heart3
onready var heart2 = $Heart2
onready var heart1 = $Heart1

signal GameOver()

func _on_GUI_Death():
    currentLives -= 1
    if currentLives == 2:
        heart3.visible = false
    if currentLives == 1:
        heart2.visible = false
    if currentLives == 0:
        heart1.visible = false
    if currentLives == -1:
        emit_signal("GameOver")
