extends KinematicBody2D


var velocitat_base = 50
var velocitat = Vector2.ZERO

var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 980

func _process(delta):
	pass

func _physics_process(delta):
	velocitat.x = 50
	velocitat = move_and_slide(velocitat, Vector2.UP)
	velocitat += gravetat * delta

	if velocitat.x > 0:
		$AnimatedSprite.play("mou_dreta")
	if velocitat.x < 0:
		$AnimatedSprite.play("mou_esquerr")
