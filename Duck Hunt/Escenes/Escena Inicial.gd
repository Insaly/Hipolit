extends Node2D

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("Tecla_enter"):
		get_tree().change_scene("res://Duck Hunt/Escenes/Escena principal.tscn")

	if Input.is_action_just_pressed("Tecla_esc"):
			Global.posicio = Vector2(4380, 650)
			get_tree().change_scene("res://Escenes (Pantalles)/Menú Principal.tscn")
