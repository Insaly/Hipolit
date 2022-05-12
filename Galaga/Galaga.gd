extends Node2D

var proj = preload("res://Galaga/Escenes/proj_jugador.tscn")
var proj_enemic = preload("res://Galaga/Escenes/proj_enemic.tscn")


func _on_Player_generar_proj(location):
	var p = proj.instance()
	p.global_position = location
	add_child(p)



func _on_Abella_generar_proj_enemic(location):
	var pe = proj_enemic.instance()
	pe.global_position = location
	add_child(pe)
