extends Area2D
class_name jugador

onready var morrio = $morrio

signal generar_proj(location)

export var velocitat = 200
var direccio = Vector2(0,0)
var vides = 3


func _process(delta):
	direccio = Vector2.ZERO
	
	if Input.is_action_pressed("Mov_dreta") and vides != 0:
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("Mov_esq") and vides != 0:
		direccio += Vector2.LEFT
		
	position += direccio.normalized() * velocitat * delta
	
	if Input.is_action_pressed("Tecla_x"):
		disparar()

func _on_Player_area_entered(area):
	if area.is_in_group('enemics'):
		area.rebre_mal(1)


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop()
	$AnimatedSprite.set_visible(false)
	
func rebre_mal(mal):
	vides -= mal
	if vides <= 0: 
		$AnimatedSprite.play("Detonació")
		
func disparar():
	emit_signal('generar_proj', morrio.global_position)
