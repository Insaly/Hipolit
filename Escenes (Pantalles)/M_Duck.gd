extends Area2D

var dins = false

func _ready():
	dins = false

func _process(delta):
	if dins and Input.is_action_just_pressed("Tecla_x") and not Global.duck:
		get_tree().change_scene("res://Duck Hunt/Escenes/Escena Inicial.tscn")

func _on_Area2D_body_entered(body):
	dins = true


func _on_Area2D_body_exited(body):
	dins = false
