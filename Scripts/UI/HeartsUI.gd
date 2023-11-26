extends Control

# Get the Hearts
#onready var h1 = get_node("/root/Level1/Camera2D/HeartUI/Heart1")
#onready var h2 = get_node("/root/Level1/Camera2D/HeartUI/Heart2")
#onready var h3 = get_node("/root/Level1/Camera2D/HeartUI/Heart3")

onready var heart3 = $Heart3
onready var heart2 = $Heart2
onready var heart1 = $Heart1
onready var currentLives = 3

signal heartsDepleted


func _on_PlayerUI_Death():
    currentLives -= 1
    if currentLives == 2:
        heart3.visible = false
    if currentLives == 1:
        heart2.visible = false
    if currentLives == 0:
        heart1.visible = false
    if currentLives < 0:
        emit_signal("heartsDepleted")
