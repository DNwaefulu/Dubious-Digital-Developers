extends Control

# Get the Hearts
#onready var h1 = get_node("/root/Level1/Camera2D/HeartUI/Heart1")
#onready var h2 = get_node("/root/Level1/Camera2D/HeartUI/Heart2")
#onready var h3 = get_node("/root/Level1/Camera2D/HeartUI/Heart3")

onready var heart3 = $Heart3
onready var heart2 = $Heart2
onready var heart1 = $Heart1
# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var currentLives = get_tree().get_root().get_node("Level1/GameManager").get("playerLives")
    if currentLives == 2:
        heart3.visible = false
    if currentLives == 1:
        heart2.visible = false
    if currentLives == 0:
        heart1.visible = false
        
        




# Once a player loses a life
#func _on_GameManager_LiveCount(playerLives):
  
  # Remove the third heart
 # if (playerLives == 2):
 #   h3.texture = load("res://Assets/objects/empty_heart.png")
  # Remove the second heart
  #if (playerLives == 1):
   # h2.texture = load("res://Assets/objects/empty_heart.png")
  # Remove the first heart
  #if (playerLives == 0):
   # h1.texture = load("res://Assets//objects/empty_heart.png")
