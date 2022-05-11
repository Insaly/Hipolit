extends Area2D

var vides = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func rebre_mal(mal):
	vides -= mal
	if vides <= 0: 
		queue_free()


func _on_Abella_area_entered(area):
	if area is jugador:
		area.rebre_mal(1)
