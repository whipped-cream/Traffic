extends Node2D

var people = [
	load("res://man.tscn"),
	load("res://woman.tscn")
]

var vehicles = [
	load("res://CarsScenes/cycle_low.tscn"),
	load("res://CarsScenes/scooter.tscn")
]

var wait: bool = false

@export var density = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	# new_vehicle()
	new_person()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func new_vehicle():
	var vehicle = vehicles.pick_random().instantiate()
	$Temp/Path2D/PathFollow2D.progress_ratio = randf()
	
	vehicle.position = $Temp/Path2D/PathFollow2D.position
	vehicle.z_index = $Temp/Path2D/PathFollow2D.progress_ratio * 1000
	vehicle.speed = randfn(1, 0.6)
	
	$Temp.add_child(vehicle)
	wait = true
	$Temp/DelayTimerVehicle.wait_time = (1 + (11 - density) * 0.5 + randf()) * 5
	$Temp/DelayTimerVehicle.start()


func new_person():
	var person = people.pick_random().instantiate()
	$Temp/Path2D/PathFollow2D.progress_ratio = randf()
	
	person.position = $Temp/Path2D/PathFollow2D.position
	person.z_index = $Temp/Path2D/PathFollow2D.progress_ratio * 1000
	
	$Temp.add_child(person)
	$Temp/DelayTimerPerson.wait_time = 0.5 + (11 - density) * 0.5 + randf()
	$Temp/DelayTimerPerson.start()


func _on_delay_timer_person_timeout():
	new_person()


func _on_delay_timer_vehicle_timeout():
	new_vehicle()
