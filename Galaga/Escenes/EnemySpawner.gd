extends Node2D

var spawn_positions = null

var Abella = preload("res://Galaga/Escenes/Abella.tscn")
var Papallona = preload("res://Galaga/Escenes/Papallona.tscn")

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()
	
func spawn_enemy(enemy):
	var index = randi () % spawn_positions.size()
	var Enemy = enemy.instance()
	Enemy.global_position = spawn_positions[index].global_position
	add_child(Enemy)

func _on_SpawnTimer_timeout():
	spawn_enemy(Abella)
