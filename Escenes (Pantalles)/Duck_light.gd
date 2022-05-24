extends Light2D

func _ready():
	pass 
func _process(delta):
	if Global.duck:
		self.enabled = true
	else:
		self.enabled = false

