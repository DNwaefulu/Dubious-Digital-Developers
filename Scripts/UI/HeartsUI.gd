extends Control

# Get the Hearts
#onready var h1 = get_node("/root/Level1/Camera2D/HeartUI/Heart1")
#onready var h2 = get_node("/root/Level1/Camera2D/HeartUI/Heart2")
#onready var h3 = get_node("/root/Level1/Camera2D/HeartUI/Heart3")

onready var heart3 = $Heart3
onready var heart2 = $Heart2
onready var heart1 = $Heart1
onready var currentLives
#var is_paused = false setget set_is_paused
var levelNumber
onready var levelNode = get_tree().get_root().get_child(3)
# Called when the node enters the scene tree for the first time.
func _ready():
    print(levelNode)
#    for i in 3:
#        if (get_tree().get_root().get_node("Level"+str(i+1)) == get_tree().get_root().get_child(3)):
#            levelNumber = i
#            break
    pass # Replace with function body.
#function is changing the is_pause by the boolean and pausing the game
#func set_is_paused(value):
#    print(value)
#    is_paused = value
#    get_tree().paused = is_paused
#    visible = is_paused
#
##here the input from the controller will trigger to pause the game
#func _unhandled_input(event):
#    if event.is_action_pressed("pause"):
#        self.is_paused = !is_paused
#        visible = is_paused

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#    if(get_tree().paused):
#        heart1.visible = false
#        heart2.visible = false
#        heart3.visible = false
#        $EmptyHeart1.visible = false
#        $EmptyHeart2.visible = false
#        $EmptyHeart3.visible = false
#    elif(!get_tree().paused):
#        heart1.visible = true
#        heart2.visible = true
#        heart3.visible = true
#        $EmptyHeart1.visible = true
#        $EmptyHeart2.visible = true
#        $EmptyHeart3.visible = true
    #currentLives = get_tree().get_root().get_node("Level"+str(levelNumber+1)+"/GameManager").get("playerLives")
    currentLives = get_tree().get_root().get_child(2).get_node("GameManager").get("playerLives")
    print(currentLives)
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
