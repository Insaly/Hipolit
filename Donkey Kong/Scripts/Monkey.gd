extends Node2D


var Barril = preload("res://Donkey Kong/Escenes/Barril.tscn")

func _ready():
	$Animacions.play("normal")
	$Timer.start()

func spawn_barril(Barril):
	var enemic = Barril.instance()
	add_child(enemic)
	enemic.position = $Position2D.position

func _on_Timer_timeout():
	$Animacions.play("barril")

func _on_Animacions_animation_finished():
	if $Animacions.animation == "barril":
		spawn_barril(Barril)
		$Animacions.play("normal")
		$Timer.set_wait_time(5)
