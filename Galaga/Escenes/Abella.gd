extends Area2D

var vides = 1
onready var morrio = $morrio

signal generar_proj_enemic(location)

func _process(delta):
	if Input.is_action_just_pressed("Tecla_z"):
		disparar()

func rebre_mal(mal):
	vides -= mal
	if vides <= 0:
		queue_free()

func disparar():
	emit_signal('generar_proj_enemic', morrio.global_position)

func _on_Abella_area_entered(area):
	if area is jugador:
		area.rebre_mal(1)
