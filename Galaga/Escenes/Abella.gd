extends Area2D

var vides = 1
onready var morrio = $morrio
var velocitat = -300

signal generar_proj_enemic(location)

func _process(delta):
	global_position.y -= velocitat * delta

func rebre_mal(mal):
	vides -= mal
	if vides <= 0:
		queue_free()

func disparar():
	emit_signal('generar_proj_enemic', morrio.global_position)

func _on_Abella_area_entered(area):
	if area is jugador:
		area.rebre_mal(1)
