extends Area2D


func _ready():
	pass


func _on_CanviDir_body_entered(body):
	body.velocitat.x = (-1)*(body.velocitat.x)
