extends KinematicBody2D

var vel = Vector2()
var speed = 0
var dir := Vector2.RIGHT
var angle = 0
var mouse_in = false
var cached = false
var caient = false
var go = false
var mort = false

func _ready():
	randomize()
	speed = rand_range(200, 500)
	angle = rand_range(0, -PI/4)
	dir = dir.rotated(angle)
	dir.x *= (randi()%2)*2 - 1
	$moviment.wait_time = rand_range(0.6, 1.5)
	$moviment.start()
	$Anima.wait_time = rand_range(0.6, 1.5)
	$Anima.start()
	
func _process(delta):
	if cached:
		dir = Vector2.ZERO
		$Anima.stop()
		$AnimatedSprite.play("Impacte")
		$Mort.start()
		cached = false
		caient = true
	elif caient:
		speed = 0
		dir = Vector2.DOWN
		if go:
			speed = 100
			dir = Vector2.DOWN
			$AnimatedSprite.play("Mort")
			$Mort2.start()
			caient = false
			mort = true
	elif mort:
		pass
	else:
		if mouse_in and Input.is_action_just_pressed("Clic"):
			cached = true
		if is_on_wall():
			dir.x *= -1
		if is_on_ceiling() or is_on_floor():
			dir.y *= -1
	
	vel = move_and_slide(dir * speed, Vector2.UP)
	if vel.x > 0.1:
		$AnimatedSprite.flip_h = false
	elif vel.x < 0.1:
		$AnimatedSprite.flip_h = true


func change_dir():
	if mort == false:
		angle = rand_range(0, -PI/4)
		dir = Vector2.RIGHT
		dir = dir.rotated(angle)
		dir.x *= (randi()%2)*2 - 1
		speed = rand_range(200, 500)
		$moviment.wait_time = rand_range(0.6, 1.5)


func _on_KinematicBody2D_mouse_entered():
	mouse_in = true
	print ("in")

func _on_KinematicBody2D_mouse_exited():
	mouse_in = false
	print ("out")


func _on_Anima_timeout():
	if $AnimatedSprite.animation == "Vol horitzontal":
		$AnimatedSprite.play("Vol amunt")
	else:
		$AnimatedSprite.play("Vol horitzontal")
	
	$Anima.wait_time = rand_range(0.6, 1.5)


func _on_moviment_timeout():
	change_dir()



func _on_Mort_timeout():
	go = true


func _on_Mort2_timeout():
	queue_free()
