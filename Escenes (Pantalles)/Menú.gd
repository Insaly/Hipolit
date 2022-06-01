extends Node2D



func _ready():
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Escenes (Pantalles)/Història.tscn")

func _on_Button2_pressed():
	get_tree().change_scene("res://Escenes (Pantalles)/Menú2.tscn")

func _on_Button3_pressed():
	get_tree().quit()

func _on_Button_mouse_entered():
	$AudioStreamPlayer.play()

func _on_Button2_mouse_entered():
	$AudioStreamPlayer.play()

func _on_Button3_mouse_entered():
	$AudioStreamPlayer.play()

func _on_Button4_mouse_entered():
	$AudioStreamPlayer.play()

func _on_Button4_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
