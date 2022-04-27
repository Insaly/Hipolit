extends Area2D

export var velocitat = 200
var direccio = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	direccio = Vector2.ZERO
	
	if Input.is_action_pressed("Mov_dreta"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("Mov_esq"):
		direccio += Vector2.LEFT
		
	position += direccio.normalized() * velocitat * delta
	


func _on_Player_area_entered(area):
	$AnimatedSprite.play("Detonació")


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop()
	$AnimatedSprite.set_visible(false)
