extends KinematicBody2D

var vel = Vector2()
var speed = 0
var dir := Vector2.RIGHT
var angle = 0
var mouse_in = false
var cacat = false
var caient = false


func _ready():
	randomize()
	speed = rand_range(200, 300)
	angle = rand_range((-1.0/3)*PI,(1.0/3)*PI) + ((randi() % 2) * 180)
	dir = Vector2.RIGHT
	dir = dir.rotated(angle)
	$moviment.wait_time = rand_range(1, 2)
	$moviment.start()

func _process(delta):
	if cacat:
		$Anec1SFX.play()
		dir = Vector2.ZERO
	if caient:
		$Anec2SFX.play()
		dir = Vector2.DOWN
		speed = 300
	else:
		if is_on_wall():
			dir.x *= -1
		if is_on_ceiling() or is_on_floor():
			dir.y *= -1
		
		if Input.is_action_just_pressed("Clic") and mouse_in == true:
			cacat = true
		
	vel = move_and_slide(dir * speed, Vector2.UP)
	anima(vel)

func anima(vel):
	if vel.x > 0:
		$AnimatedSprite.flip_h = false
	elif vel.x < 0:
		$AnimatedSprite.flip_h = true
	
	
	if rad2deg(angle) > 30 or rad2deg(angle) < -30 and (abs(vel.x) > 0 or abs(vel.y) > 0):
		$AnimatedSprite.play("Vol amunt")
	elif rad2deg(angle) <= 30 and rad2deg(angle) >= -30 and (abs(vel.x) > 0 or abs(vel.y) > 0):
		$AnimatedSprite.play("Vol horitzontal")
	
	if vel.x == 0 and vel.y == 0 and cacat:
		$AnimatedSprite.play("Impacte")
		$Mort.start()
	if vel.x == 0 and vel.y > 0:
		$AnimatedSprite.play("Mort")
		$Mort2.start()

func change_dir():
	angle = rand_range((-1.0/3)*PI,(1.0/3)*PI) + ((randi() % 2) * 180)
	dir = Vector2.RIGHT
	dir = dir.rotated(angle)
	$moviment.wait_time = rand_range(1, 2)

func _on_moviment_timeout():
	change_dir()





func _on_Duck_mouse_entered():
	mouse_in = true

func _on_Duck_mouse_exited():
	mouse_in = false



func _on_Mort_timeout():
	queue_free()


func _on_Mort2_timeout():
	queue_free()
