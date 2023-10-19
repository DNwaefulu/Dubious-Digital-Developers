extends Camera2D

onready var p1 = get_parent().get_node("Player1")
onready var p2 = get_parent().get_node("Player2")

var zoomMin = 0.8
var zoomMax = 2

func _physics_process(delta: float) -> void:
  position = (p1.position + p2.position) / Vector2(2,2)
  
  zoom.x = max (zoomMin, abs((p1.position.x-p2.position.x)/300))
  zoom.y = max (zoomMin, abs((p1.position.x-p2.position.x)/300))
  
  if zoom.x > zoomMax:
    zoom.y = zoomMax
    zoom.x = zoomMax
