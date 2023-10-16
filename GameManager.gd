extends Node2D

#this is where the players will spawn back after they die
var player1_start_position = Vector2(44,480)
var player2_start_position = Vector2(262,462)

#this keeps track of the total amount of gems that are collected throughout the game
var globalGemCount = 0 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


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

