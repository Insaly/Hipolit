extends KinematicBody2D


var velocitat_base = 200
var velocitat = Vector2.ZERO

var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -270

var escales = false
var animacio = false

func _process(delta):
	pass

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("Mov_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("Mov_esq"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("Tecla_x") and is_on_floor():
		velocitat.y = velocitat_salt
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	
	if escales and Input.is_action_pressed("Mov_amunt"):
		gravetat = Vector2.ZERO
		velocitat.y = -30
		$Animacions.play("escalant")
	elif not animacio:
		gravetat = Vector2.DOWN * 980
		
func anima(velocitat):
	if animacio == false:
		if velocitat.x == 0 and velocitat.y == 0:
			$Animacions.play("normal")
		if velocitat.x > 0:
			$Animacions.flip_h = false
			if is_on_floor():
				$Animacions.play("caminant")
		if velocitat.x < 0:
			$Animacions.flip_h = true
			if is_on_floor():
				$Animacions.play("caminant")
		if Input.is_action_just_pressed("Tecla_x"):
			$Animacions.play("salt")

func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		escales = true
		
func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		escales = false
