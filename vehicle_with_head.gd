extends "res://vehicle.gd"

@export var heads = [
	preload("res://Characters/man_kart.png"),
	preload("res://Characters/woman_kart.png")
]

#@export var heads = [
#	preload("res://Characters/man_kart.png"),
#	preload("res://Characters/woman_kart.png")
#]

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	$Marker2D/VehicleBody/Head.texture = heads.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
