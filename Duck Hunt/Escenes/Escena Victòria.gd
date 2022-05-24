extends Node2D


func _ready():
	$Timer.start()



func _on_Timer_timeout():
	Global.duck = true
	Global.posicio = Vector2(4380, 650)
	get_tree().change_scene("res://Escenes (Pantalles)/Menú Principal.tscn")
