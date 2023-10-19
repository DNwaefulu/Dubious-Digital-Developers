extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

var globalGemCount = 0 
var totalLivesCount = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.

# Get nodes of both players and the livecounter
onready var player1 = get_node("/root/Level1/Player1")
onready var player2 = get_node("/root/Level1/Player2")
onready var LiveCount = get_node("/root/Level1/LiveCount")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  
  #print(player2.position)
  # used to find if either player has passed the bottom of the screen 
  if (player1.position.y >= 600) or (player2.position.y >= 600):
    # (44, 514) is the starting spot of player1
    player1.position = Vector2(44, 514)
    player2.position = Vector2(262, 513)
    
    # Decrease live count due to player death
    totalLivesCount = totalLivesCount - 1
    LiveCount.text = "Lives: " + str(totalLivesCount)
    
  if totalLivesCount == 0:
    # For debug purposes, print out "You Lose"
    print("You Lose")
    totalLivesCount = 3
    LiveCount.text = "Lives: " + str(totalLivesCount)
  


#I don't know godot well enough to make a better version of this but if you come up with something let me know !
#Each of these are called when a certain gem is collided with
#so this one gets called when the gem called gem1 gets collected, and it increases the gemCount by 1
func _on_Gem1_body_entered(body: Node) -> void:
  globalGemCount += 1
  print(globalGemCount)

#same situation here, when gem2 gets colllected then we increase gemcount by 1 again 
func _on_Gem2_body_entered(body: Node) -> void:
  globalGemCount += 1
  print(globalGemCount)


func _on_BlueGem_body_entered(body: Node) -> void:
  globalGemCount += 1
  print(globalGemCount)
  
#Whenever the goalsbody is intersected with a KinematicBody2D (a player) then it will check if enough gems have been collected, 
#if < 3 gems are collected then they won't move on, if they do then they will go to the next level
func _on_Goal_body_entered(body: Node) -> void:
  if(globalGemCount < 3 && body.is_class("KinematicBody2D")):
    print("You don't have enough gems")
  elif(globalGemCount == 3 && body.is_class("KinematicBody2D")):
    print("MOVE ONTO THE NEXT LEVEL")
