extends Node2D

var vehicles = [
	load("res://CarsScenes/ambulance.tscn"),
	load("res://CarsScenes/buggy.tscn"),
	load("res://CarsScenes/bus_school.tscn"),
	load("res://CarsScenes/bus.tscn"),
	load("res://CarsScenes/convertible.tscn"),
	load("res://CarsScenes/cycle_low.tscn"),
	load("res://CarsScenes/cycle.tscn"),
	load("res://CarsScenes/firetruck.tscn"),
	load("res://CarsScenes/formula.tscn"),
	load("res://CarsScenes/hotdog.tscn"),
	load("res://CarsScenes/kart.tscn"),
	load("res://CarsScenes/police.tscn"),
	load("res://CarsScenes/riot.tscn"),
	load("res://CarsScenes/rounded_green.tscn"),
	load("res://CarsScenes/rounded_red.tscn"),
	load("res://CarsScenes/rounded_yellow.tscn"),
	load("res://CarsScenes/scooter.tscn"),
	load("res://CarsScenes/sedan_blue.tscn"),
	load("res://CarsScenes/sedan.tscn"),
	load("res://CarsScenes/sedan_vintage.tscn"),
	load("res://CarsScenes/sports_convertible.tscn"),
	load("res://CarsScenes/sports_green.tscn"),
	load("res://CarsScenes/sports_race.tscn"),
	load("res://CarsScenes/sports_yellow.tscn"),
	load("res://CarsScenes/station.tscn"),
	load("res://CarsScenes/suv_closed.tscn"),
	load("res://CarsScenes/suv_green.tscn"),
	load("res://CarsScenes/suv_large.tscn"),
	load("res://CarsScenes/suv_military.tscn"),
	load("res://CarsScenes/suv_travel.tscn"),
	load("res://CarsScenes/suv.tscn"),
	load("res://CarsScenes/taxi.tscn"),
	load("res://CarsScenes/tow_truck.tscn"),
	load("res://CarsScenes/tractor.tscn"),
	load("res://CarsScenes/transport.tscn"),
	load("res://CarsScenes/truck_dark.tscn"),
	load("res://CarsScenes/truck_delivery.tscn"),
	load("res://CarsScenes/truck_tank.tscn"),
	load("res://CarsScenes/truck_trailer_tank.tscn"),
	load("res://CarsScenes/truck_trailer_tank_vintage.tscn"),
	load("res://CarsScenes/truck_trailer.tscn"),
	load("res://CarsScenes/truck_trailer_vintage.tscn"),
	load("res://CarsScenes/truck.tscn"),
	load("res://CarsScenes/van_flat.tscn"),
	load("res://CarsScenes/van_large.tscn"),
	load("res://CarsScenes/van_small.tscn"),
	load("res://CarsScenes/van.tscn"),
	load("res://CarsScenes/vendor.tscn"),
	load("res://CarsScenes/vintage.tscn")
]

var last_vehicle
var wait: bool = false

@export var density = 5

var following_distance = 100

@export var speed = 1

var lane_group

# Called when the node enters the scene tree for the first time.
func _ready():
	lane_group = str(ResourceUID.create_id())
	speed = randfn(1, 0.5)
	new_vehicle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): # I should use references here or pointers of some ckind that can be checked to still be valid but for now 
	if not wait and (not is_instance_valid(last_vehicle) or last_vehicle.end_position >= following_distance):
		new_vehicle()
	elif wait and (not is_instance_valid(last_vehicle) or last_vehicle.end_position < following_distance):
		wait = false


func new_vehicle():
	last_vehicle = vehicles.pick_random().instantiate()
	last_vehicle.add_to_group(lane_group)
	last_vehicle.speed = speed
	$Temp.add_child(last_vehicle)
	following_distance = (11 - density) * (10 + (randfn(70, 30))) 
	wait = true
	
