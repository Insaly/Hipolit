extends KinematicBody2D

var vel = Vector2()
var speed = 300
var dir := Vector2.DOWN

func _ready():
	randomize()
	dir = dir.rotated(rand_range(0,2*PI))
	$moviment.wait_time = rand_range(1, 2)
	$moviment.start()

func _process(delta):
	if is_on_wall():
		dir.x *-1
	if is_on_ceiling() or is_on_floor():
		dir.y *-1
		
	
	move_and_slide(dir * speed)


func change_dir():
	dir = dir.rotated(rand_range(0,2*PI))
	$moviment.wait_time = rand_range(0.4, 2)
func _on_moviment_timeout():
	change_dir()
