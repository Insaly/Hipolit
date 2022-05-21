extends Area2D

var vides = 1
var velocitat_y = -200
var velocitat_x = -200

func _process(delta):
	global_position.y -= velocitat_y * delta
	global_position.x -= velocitat_x * delta
	

func rebre_mal(mal):
	vides -= mal
	if vides <= 0:
		queue_free()


func _on_Tocacampanes_area_entered(area):
	if area is jugador:
		area.rebre_mal(1)
