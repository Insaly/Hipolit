extends Node2D

var ronda = 0
var vides = 3
var bales_restants = 3
var anecs_morts = 0
var i = 0

export var Duck2 : PackedScene

func _ready():
	randomize()
	ronda = 1000
	for i in range(ronda):
		var anec = Duck2.instance()
		anec.global_position = Vector2(rand_range(40, 700), 300)
		$Anecs.add_child(anec)
		
func _process(delta):
	pass
