extends Area2D

var vides = 1
# Called when the node enters the scene tree for the first time.
func rebre_mal(mal):
	vides -= mal
	if vides <= 0: 
		queue_free()


