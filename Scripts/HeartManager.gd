extends Node2D

# Declare livecount
var liveCount = 3

# Get the Hearts
onready var h1 = get_node("/root/Level1/Camera2D/HeartUI/Heart1")
onready var h2 = get_node("/root/Level1/Camera2D/HeartUI/Heart2")
onready var h3 = get_node("/root/Level1/Camera2D/HeartUI/Heart3")

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass


# Once a player loses a life
func _on_GameManager_LiveCount():
  liveCount -= 1
  
  # Remove the third heart
  if (liveCount == 2):
    h3.texture = load("res://Assets/empty_heart.png")
  # Remove the second heart
  if (liveCount == 1):
    h2.texture = load("res://Assets/empty_heart.png")
  # Remove the first heart
  if (liveCount == 0):
    h1.texture = load("res://Assets/empty_heart.png")
