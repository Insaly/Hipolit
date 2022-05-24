extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("Tecla_z"):
		get_tree().change_scene("res://Escenes (Pantalles)/Donkey Kong.tscn")
	
	if Input.is_action_just_pressed("Tecla_esc"):
		Global.posicio = Vector2(2750, 650)
		get_tree().change_scene("res://Escenes (Pantalles)/Menú Principal.tscn")
