extends Node2D
signal GemC()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    if Input.is_action_just_pressed("Debug"):
        print("DEBUG")
        var P1 = $Player1
        var P2 = $Player2
        P1.position = Vector2(2525, -100)
        P2.position = Vector2(2525, -100)
        emit_signal("GemC")
        
