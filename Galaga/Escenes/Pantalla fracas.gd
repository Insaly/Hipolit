extends Control


func _process(delta):
	if Input.is_action_just_pressed("Tecla_z"):
		get_tree().change_scene("res://Escenes (Pantalles)/Galaga.tscn")

