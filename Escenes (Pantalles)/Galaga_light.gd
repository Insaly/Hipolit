extends Light2D

func _ready():
	pass 
func _process(delta):
	if Global.galaga:
		self.enabled = true
	else:
		self.enabled = false
