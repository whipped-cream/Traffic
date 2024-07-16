extends "res://vehicle_with_head.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	if randf() > 0.7:
		$Marker2D/VehicleBody/PassengerHead.texture = heads.pick_random()
	else:
		$Marker2D/VehicleBody/PassengerHead.texture = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
