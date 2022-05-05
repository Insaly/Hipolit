extends KinematicBody2D

var vel = Vector2()
var speed = 300
var dir := Vector2.RIGHT
var angle = 0

func _ready():
	randomize()
	angle = rand_range((-1.0/3)*PI,(1.0/3)*PI)*((randi() % 2) * 2 - 1)
	dir = Vector2.RIGHT
	dir = dir.rotated(angle)
	$moviment.wait_time = rand_range(1, 2)
	$moviment.start()

func _process(delta):
	if is_on_wall():
		dir.x *= -1
	if is_on_ceiling() or is_on_floor():
		dir.y *= -1
	
	
	
	vel = move_and_slide(dir * speed, Vector2.UP)
	anima(vel)

func anima(vel):
	if vel.x > 0:
		$AnimatedSprite.flip_h = false
	elif vel.x < 0:
		$AnimatedSprite.flip_h = true
	
	if rad2deg(angle) > 30 or rad2deg(angle) < -30:
		$AnimatedSprite.play("Vol amunt")
	elif rad2deg(angle) <= 30 and rad2deg(angle) >= -30:
		$AnimatedSprite.play("Vol horitzontal")

func change_dir():
	angle = rand_range((-1.0/3)*PI,(1.0/3)*PI)*((randi() % 2) * 2 - 1)
	dir = Vector2.RIGHT
	dir = dir.rotated(angle)
	$moviment.wait_time = rand_range(1, 2)
func _on_moviment_timeout():
	change_dir()
