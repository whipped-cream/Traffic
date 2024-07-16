extends Node

var lane_scene = load("res://lane.tscn")
var sidewalk_scene = load("res://sidewalk.tscn")

var lane_holders
var sidewalk

# Called when the node enters the scene tree for the first time.
func _ready():
	lane_holders = [
		$ColorRect/LaneHolder3,
		$ColorRect/LaneHolder2,
		$ColorRect/LaneHolder4,
		$ColorRect/LaneHolder1,
		$ColorRect/LaneHolder5,
		$ColorRect/LaneHolder6
	]
	new_lane(0)
	new_sidewalk(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_controls_lane_count_changed():
	var index = $ColorRect/Controls.lane_count - 1
	if lane_holders[index].lane == null:
		new_lane(index)
	else:
		lane_holders[index + 1].lane.queue_free()
		lane_holders[index + 1].lane = null
	if $ColorRect/Controls.sidewalk_enable:
		if $ColorRect/Controls.lane_count == 1 or $ColorRect/Controls.lane_count == 2:
			sidewalk.reparent(lane_holders[2])
			sidewalk.position = Vector2.ZERO
		elif $ColorRect/Controls.lane_count == 3 or $ColorRect/Controls.lane_count == 4:
			sidewalk.reparent(lane_holders[4])
			sidewalk.position = Vector2.ZERO
		else:
			sidewalk.reparent(lane_holders[5])
			sidewalk.position = Vector2.ZERO


func new_lane(index):
	var lane = lane_scene.instantiate()
	lane.density = $ColorRect/Controls.traffic_density
	lane_holders[index].add_child(lane)
	lane_holders[index].lane = lane


func new_sidewalk(index):
	sidewalk = sidewalk_scene.instantiate()
	sidewalk.density = $ColorRect/Controls.traffic_density
	lane_holders[index].add_child(sidewalk)


func _on_controls_sidewalk_enabled_changed():
	if $ColorRect/Controls.sidewalk_enable:
		if $ColorRect/Controls.lane_count == 1 or $ColorRect/Controls.lane_count == 2:
			new_sidewalk(2)
		elif $ColorRect/Controls.lane_count == 3 or $ColorRect/Controls.lane_count == 4:
			new_sidewalk(4)
		else:
			new_sidewalk(5)
	else:
		sidewalk.queue_free()
		sidewalk = null


func _on_controls_traffic_density_changed():
	for lane_holder in lane_holders:
		if lane_holder.lane != null:
			lane_holder.lane.density = $ColorRect/Controls.traffic_density
	if sidewalk != null:
		sidewalk.density = $ColorRect/Controls.traffic_density


func _on_controls_background_colour_changed():
	$ColorRect.color = $ColorRect/Controls.background_color
