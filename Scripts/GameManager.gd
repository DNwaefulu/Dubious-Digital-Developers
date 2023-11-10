extends Node

signal LiveCount(playerLives)
signal GemCount(globalGemCount)
signal LevelOver()
signal GameOver()

#this is where the players will spawn back after they die
var player1_start_position = Vector2(44,480)

#this variable just keeps track of player lives 
var playerLives = 3
var playerinGoal = -1

# actual text for lives
#onready var LiveCount = get_node("/root/Level1/LiveCount")

#this keeps track of the total amount of gems that are collected throughout the game
var globalGemCount = 0 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  pass # Replace with function body.

#this is here just to make things simpler for sound effects sake, i'm sure there is a better way to 
#do it but this is the easiest way for me

#I don't know godot well enough to make a better version of this but if you come up with something let me know !
#Each of these are called when a certain gem is collided with
#so this one gets called when the gem called gem1 gets collected, and it increases the gemCount by 1
func _on_Gem1_body_entered(_body: Node) -> void:
  globalGemCount += 1
  emit_signal("GemCount", globalGemCount)

#same situation here, when gem2 gets colllected then we increase gemcount by 1 again 
func _on_Gem2_body_entered(_body: Node) -> void:
  globalGemCount += 1
  emit_signal("GemCount", globalGemCount)

func _on_Gem_body_entered(_body: Node) -> void:
  globalGemCount += 1
  emit_signal("GemCount", globalGemCount)

#Whenever the goalsbody is intersected with a KinematicBody2D (a player) then it will check if enough gems have been collected, 
#if < 3 gems are collected then they won't move on, if they do then they will go to the next level
func _on_Goal_body_entered(_body: Node) -> void:
  playerinGoal += 1
  print(playerinGoal)
  if playerinGoal == 2:
    if globalGemCount == 3:
        emit_signal("LevelOver")

func _on_Goal_body_exited(_body):
    playerinGoal -= 1


#This is what takes care of player death regarding lives
#whenever the death zone gets entered then it will reduce the number of lives the players
#have, and if it's less than or equal to 0 then it will just quit the game because we don't have a 
#game over screen right now
func _on_Death_zone_body_entered(_body: Node) -> void:
  if playerLives <= 0:
    emit_signal("GameOver")
  playerLives-=1
  # Send a signal to the heart manager to update heart UI
  emit_signal("LiveCount", playerLives)
  # Update live counter
  #LiveCount.text = "Lives Left: " + str(playerLives)
