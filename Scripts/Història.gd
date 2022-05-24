extends Node2D

var i = 0

func _ready():
	i = 0
	$Timer.wait_time = 3
	$Label.text = "Era un càlid dilluns de juliol."
	$Timer.start()
	i += 1

func _on_Timer_timeout():
	if i == 1:
		$Timer.stop()
		$Timer.wait_time = 8
		$Label.text = "La sala de recreatius més famosa del poble estava tancada a causa de una recent falla elèctrica causada per l'incrèdul del Miquelet, que intentava hackejar una de les nostres màquines."
		$Timer.start()
		i += 1
	elif i == 2:
		$Timer.stop()
		$Timer.wait_time = 8
		$Label.text = "És per això que l'Arnau (un electricista d'èxit) ha sigut enviat durant la nit per a arreglar aquesta màquina."
		$Timer.start()
		i += 1
	elif i == 3:
		$Timer.stop()
		$Timer.wait_time = 6
		$Label.text = "Havent realitzat la seva tasca, es disposa a marxar quan de sobte s'adona que la porta està tancada."
		$Timer.start()
		i += 1
	elif i == 4:
		$Timer.stop()
		$Timer.wait_time = 6
		$Label.text = "Fixant-s'hi millor, veu que hi ha tres llums de colors apagades, i tres màquines enceses dels colors corresponents."
		$Timer.start()
		i += 1
	elif i == 5:
		$Timer.stop()
		$Timer.wait_time = 6
		$Label.text = "El seu objectiu serà passar-se el joc d'aquestes màquines per a poder sortir de l'edifici."
		$Timer.start()
		i += 1
	elif i == 6:
		$Timer.stop()
		$Timer.wait_time = 5
		$Label.text = "Bona sort, Arnau!"
		$Timer.start()
		i += 1
	elif i == 7:
		$Timer.stop()
		$Timer.wait_time = 3
		$Label.text = ""
		$Timer.start()
		i += 1
	elif i == 8:
		$Timer.stop()
		get_tree().change_scene("res://Escenes (Pantalles)/Menú Principal.tscn")
	
