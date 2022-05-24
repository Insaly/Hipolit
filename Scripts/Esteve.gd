extends KinematicBody2D

var velocitat_base = 400
var velocitat = Vector2.ZERO
var direccio = Vector2.DOWN
var gravetat = Vector2.DOWN * 1200

func _ready():
	self.position = Global.posicio

func _physics_process(delta):
	velocitat.x = 0
	velocitat += gravetat * delta
	if Input.is_action_pressed("Mov_dreta"):
		velocitat += Vector2.RIGHT * velocitat_base

	if Input.is_action_pressed("Mov_esq"):
		velocitat += Vector2.LEFT * velocitat_base
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)

func anima(velocitat):
	if velocitat.x > 0:
		$AnimatedSprite.flip_h = false
	elif velocitat.x < 0:
		$AnimatedSprite.flip_h = true
	
	if abs(velocitat.x) > 0.1:
		$AnimatedSprite.play("caminant")
	elif abs(velocitat.x) < 0.1:
		$AnimatedSprite.play("quiet")
