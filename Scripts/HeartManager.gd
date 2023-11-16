extends Node
# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass


# Once a player loses a life
func _on_GameManager_LiveCount(playerLives):
  # Remove the third heart
  if (playerLives == 2):
    $HeartUI/Heart3.texture = load("res://Assets/objects/empty_heart.png")
    print("test-heart")
  # Remove the second heart
  if (playerLives == 1):
    $HeartUI/Heart2.texture = load("res://Assets/objects/empty_heart.png")
  # Remove the first heart
  if (playerLives == 0):
    $HeartUI/Heart1.texture = load("res://Assets/objects/empty_heart.png")
