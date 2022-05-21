extends Area2D

var vides = 1
var velocitat = -400

func rebre_mal(mal):
	vides -= mal
	if vides <= 0: 
		queue_free()

func _process(delta):
	global_position.y -= velocitat * delta


func _on_Papallona_area_entered(area):
	if area is jugador:
		area.rebre_mal(1)
