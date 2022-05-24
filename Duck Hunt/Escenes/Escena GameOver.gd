extends Node2D


func _ready():
	$Timer.start()
	
func _process(delta):
	if Input.is_action_just_pressed("Tecla_enter"):
		get_tree().change_scene("res://Duck Hunt/Escenes/Escena Inicial.tscn")


func _on_Timer_timeout():
	Global.duck = true
	Global.posicio = Vector2(4380, 650)
	get_tree().change_scene("res://Escenes (Pantalles)/Menú Principal.tscn")
