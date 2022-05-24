extends KinematicBody2D


var velocitat_base = 100
var velocitat = Vector2.ZERO

var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980
var velocitat_salt = -270
var contador_absurd = 0
var escales = false
var animacio = false

func _physics_process(delta):
	if contador_absurd < 1:
		velocitat.x = 0
		velocitat += gravetat * delta
		if Input.is_action_pressed("Mov_dreta"):
			velocitat += Vector2.RIGHT * velocitat_base
		if Input.is_action_pressed("Mov_esq"):
			velocitat += Vector2.LEFT * velocitat_base
		if Input.is_action_just_pressed("Tecla_x") and is_on_floor():
			velocitat.y = velocitat_salt
			$SaltSFX.play()
		velocitat = move_and_slide(velocitat, Vector2.UP)
		anima(velocitat)
		if Input.is_action_pressed("Mov_esq") or Input.is_action_pressed("Mov_dreta"):
			if not $WalkSFX.is_playing():
				$WalkSFX.play()
		else:
			$WalkSFX.stop()
		if not $MusicSFX.is_playing():
			$MusicSFX.play()
	else:
		$MusicSFX.stop()
	
	if escales and Input.is_action_pressed("Mov_amunt") and contador_absurd < 2:
		gravetat = Vector2.ZERO
		velocitat.y = -30
		$Animacions.play("escalant")
	elif not animacio:
		gravetat = Vector2.DOWN * 980
		
	if contador_absurd == 1:
			$Animacions.play("mort1")
			$DeathSFX.play()
			contador_absurd += 1
			
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

func _on_Deteccions_body_entered(body):
	body.set_collision_mask_bit(12, false)

func _on_Deteccions_body_exited(body):
	body.set_collision_mask_bit(12, true)

func _on_MortDeteccio_body_entered(body):
	if body is KinematicBody2D:
		contador_absurd += 1

func _on_Animacions_animation_finished():
	if $Animacions.animation == "mort1":
		$Animacions.play("mort2")
	elif $Animacions.animation == "mort2":
		get_tree().change_scene("res://Donkey Kong/Escenes/PantallaInicialDK.tscn")

func _on_Escales_body_entered(body):
	if body is KinematicBody2D:
		escales = true

func _on_Escales_body_exited(body):
	if body is KinematicBody2D:
		escales = false

func _on_MortBuit_body_entered(body):
	if body.is_in_group("Jugador"):
		contador_absurd += 1
	else:
		body.queue_free()

func _on_Area2D_body_entered(body):
	contador_absurd += 1


func _on_Area3D_body_entered(body):
	get_tree().change_scene("res://Donkey Kong/Escenes/PantallaVictòria.tscn")
