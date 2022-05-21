extends Node2D



func _on_Adalt_area_entered(area):
	area.queue_free()


func _on_Abaix_area_entered(area):
	if not area.is_in_group("enemics"):
		area.quere_free()

