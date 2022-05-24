extends Node2D


func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("Tecla_esc"):
		get_tree().change_scene("res://Escenes (Pantalles)/Menú.tscn")
