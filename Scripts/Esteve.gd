extends Node2D

var velocitat_base = 170
var velocitat = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("Mov_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
		$AnimatedSprite.play("caminant")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("Mov_esq"):
		velocitat += Vector2.LEFT * velocitat_base
		$AnimatedSprite.play("caminant")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("quiet")
	velocitat = $KinematicBody2D.move_and_slide(velocitat, Vector2.UP)
