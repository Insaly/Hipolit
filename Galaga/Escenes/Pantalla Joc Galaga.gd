extends Node2D

var proj = preload("res://Galaga/Escenes/proj_jugador.tscn")



func _on_Player_generar_proj(location):
	var p = proj.instance()
	p.global_position = location
	add_child(p)
