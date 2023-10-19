extends Area2D

# Get nodes of both players and the livecounter
onready var player1 = get_node("/root/Level1/Player1")
onready var player2 = get_node("/root/Level1/Player2")
onready var LiveCount = get_node("/root/Level1/LiveCount")
var totalLivesCount = 3

# Checks if climber enters a death plane
func _on_DP_body_entered(body):
	if body.is_in_group("Climber"):
		print("Body entered DP")
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
