extends Area2D

export var velocitat = 200
var direccio = Vector2(0,0)
var vides = 3


func _process(delta):
	direccio = Vector2.ZERO
	
	if Input.is_action_pressed("Mov_dreta") and vides != 0:
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("Mov_esq") and vides != 0:
		direccio += Vector2.LEFT
		
	position += direccio.normalized() * velocitat * delta
	


func _on_Player_area_entered(area):
	vides += -1
	if vides == 0:
		$AnimatedSprite.play("Detonació")


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop()
	$AnimatedSprite.set_visible(false)
