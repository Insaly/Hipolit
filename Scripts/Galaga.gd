extends Node2D

var proj = preload("res://Galaga/Escenes/proj_jugador.tscn")

func _on_Player_generar_proj(location):
	var p = proj.instance()
	p.global_position = location
	add_child(p)

func _on_Duraciojoc_timeout():
	get_tree().change_scene("res://Galaga/Escenes/Pantalla fracas.tscn")
