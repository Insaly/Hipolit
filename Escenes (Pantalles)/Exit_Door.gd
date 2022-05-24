extends Area2D

var dins = false

func _ready():
	dins = false

func _process(delta):
	if dins and Input.is_action_just_pressed("Tecla_x"):
		get_tree().change_scene("res://Galaga/Escenes/Pantalla fracas.tscn")

func _on_Area2D_body_entered(body):
	dins = true


func _on_Area2D_body_exited(body):
	dins = false
