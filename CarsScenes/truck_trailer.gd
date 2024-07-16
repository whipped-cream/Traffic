extends "res://vehicle.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	if randf() < 0.2:
		$Marker2D/VehicleBody/Trailer.texture = null
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
