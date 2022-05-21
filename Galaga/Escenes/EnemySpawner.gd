extends Node2D

var spawn_positions = null

var Abella = preload("res://Galaga/Escenes/Abella.tscn")
var Papallona = preload("res://Galaga/Escenes/Papallona.tscn")
var Tocacampanes = preload("res://Galaga/Escenes/Tocacampanes.tscn")

onready var timer = get_node("SpawnTimer")

func _ready():
	timer.set_wait_time(3)
	timer.start()
	timer.set_wait_time(0.3)
	randomize()
	spawn_positions = $SpawnPositions.get_children()

	
func spawn_enemy(enemy):
	var index = randi () % spawn_positions.size()
	var Enemy = enemy.instance()
	Enemy.global_position = spawn_positions[index].global_position
	add_child(Enemy)

func _on_SpawnTimer_timeout():
	var num = randi() % 3
	if num == 0:
		spawn_enemy(Abella)
	if num == 1:
		spawn_enemy(Papallona)
	if num == 2:
		spawn_enemy(Tocacampanes)




func _on_Player_nau_rebre_mal():
	timer.stop()
