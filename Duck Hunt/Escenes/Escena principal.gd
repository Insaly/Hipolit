extends Node2D

var ronda = 0
var vides = 3
var bales_restants = 3
var anecs_morts = 0
var anecs_totals = 0
var i = 0
var ronda_over = true
var wait = false

export var Duck2 : PackedScene

func _ready():
	randomize()
	$Round_title.visible = false
	$Lives.value = 3
	$Control/Score.text = ""

func _process(delta):
	if ronda_over:
		if vides <= 0:
			get_tree().change_scene("res://Duck Hunt/Escenes/Escena GameOver.tscn")
		if ronda == 10:
			get_tree().change_scene("res://Duck Hunt/Escenes/Escena Victòria.tscn")
		ronda += 1
		anecs_morts = 0
		bales_restants = 3+ronda
		$Hits.value = 0
		$Bullets.value = 3
		
		$Round_title.visible = true
		$Round_title.text = "ROUND " + str(ronda)
		$Control/Round.text = str(ronda)
		
		$Start_timer.wait_time = 2
		$Start_timer.start()
		$Timeout_timer.start()				
		ronda_over = false
	elif wait:
		pass
	else:
		if Input.is_action_just_pressed("Clic"):
			bales_restants -= 1
			$Bullets.value = (bales_restants/(3.0+ronda))*3
			if bales_restants <= 0:
					var anecs = $Anecs.get_children()
					for anec in anecs:
						anec.queue_free()
					vides -= 1
					$Lives.value -= 1
					ronda_over = true
		
		$Control/Score.text = str(int(anecs_totals)*1000)
		$Hits.value = anecs_morts
		if anecs_morts == ronda:
			$Round_end_timer.start()
			wait = true


func start_round(ronda):
	i = 0
	for i in range(ronda):
		var anec = Duck2.instance()
		anec.global_position = Vector2(rand_range(40, 700), 300)
		$Anecs.add_child(anec)


func _on_Start_timer_timeout():
	$Round_title.visible = false
	start_round(ronda)
	$Start_timer.stop()



func _on_Round_end_timer_timeout():
	ronda_over = true
	wait = false
	$Round_end_timer.stop()


func _on_Timeout_timer_timeout():
	var anecs = $Anecs.get_children()
	for anec in anecs:
		anec.queue_free()
	vides -= 1
	$Lives.value -= 1
	ronda_over = true
	$Timeout_timer.stop()
