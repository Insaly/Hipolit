extends Area2D

var vides = 1

# Called when the node enters the scene tree for the first time.
func rebre_mal(mal):
	vides -= mal
	if vides <= 0:
		queue_free()

func _on_Tocacampanes_area_entered(area):
	if area is jugador:
		area.rebre_mal(1)
