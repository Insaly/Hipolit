extends KinematicBody2D


var velocitat_base = 200
var velocitat = Vector2.ZERO

var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -400

func _process(delta):
	pass

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("Mov_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("Mov_esq"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("Mov_amunt") and is_on_floor():
		velocitat.y = velocitat_salt
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	
func anima(velocitat):
	if velocitat.x == 0:
		$Animacions.play("normal")
	if velocitat.x > 0:
		$Animacions.play("caminant")
		$Animacions.flip_h = false
	if velocitat.x < 0:
		$Animacions.play("caminant")
		$Animacions.flip_h = true
