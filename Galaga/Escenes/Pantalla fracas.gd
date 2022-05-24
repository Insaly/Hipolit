extends Control


func _process(delta):
	if Input.is_action_just_pressed("Tecla_z"):
		get_tree().change_scene("res://Escenes (Pantalles)/Galaga.tscn")
	
	if Input.is_action_just_pressed("Tecla_esc"):
		Global.posicio = Vector2(1615, 650)
		get_tree().change_scene("res://Escenes (Pantalles)/Menú Principal.tscn")

