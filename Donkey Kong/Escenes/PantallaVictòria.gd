extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


func _on_Timer_timeout():
	$Timer.stop()
	Global.posicio = Vector2(2750, 650)
	Global.donkey = true
	get_tree().change_scene("res://Escenes (Pantalles)/Menú Principal.tscn")
