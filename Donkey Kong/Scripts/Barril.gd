extends KinematicBody2D

var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980

func _ready():
	velocitat.x = 70
	
func _process(delta):
	pass

func _physics_process(delta):
	velocitat = move_and_slide(velocitat, Vector2.UP)
	velocitat += gravetat * delta

	if velocitat.x > 0:
		$AnimatedSprite.play("mou_dreta")
	if velocitat.x < 0:
		$AnimatedSprite.play("mou_esquerr")

func _on_Area2D_area_entered(area):
	velocitat.x = -velocitat.x
