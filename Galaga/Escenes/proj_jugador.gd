extends Area2D

var velocitat = 1000

func _process(delta):
	global_position.y -= velocitat * delta


func _on_proj_jugador_area_entered(area):
	if area.is_in_group('enemics'):
		area.rebre_mal(1)
		queue_free()
