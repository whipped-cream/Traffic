extends Control

signal lane_count_changed
signal traffic_density_changed
signal sidewalk_enabled_changed
signal background_colour_changed

@export var lane_count = 1
@export var traffic_density = 5
@export var sidewalk_enable = true
@export var background_color = 0x92d2e8


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lane_count_button_up_pressed():
	lane_count += 1
	$LaneControl/Value.text = str(lane_count)
	
	if lane_count >= 5:
		$LaneControl/ButtonUp.disabled = true
	$LaneControl/ButtonDown.disabled = false
	
	emit_signal("lane_count_changed")


func _on_lane_count_button_down_pressed():
	lane_count -= 1
	$LaneControl/Value.text = str(lane_count)
	
	if lane_count <= 1:
		$LaneControl/ButtonDown.disabled = true
	$LaneControl/ButtonUp.disabled = false
	
	emit_signal("lane_count_changed")


func _on_traffic_density_button_down_pressed():
	traffic_density -= 1
	$DensityControl/Value.text = str(traffic_density)
	emit_signal("traffic_density_changed")
	
	if traffic_density <= 1:
		$DensityControl/ButtonDown.disabled = true
	$DensityControl/ButtonUp.disabled = false


func _on_button_up_pressed():
	traffic_density += 1
	$DensityControl/Value.text = str(traffic_density)
	emit_signal("traffic_density_changed")
	
	if traffic_density >= 10:
		$DensityControl/ButtonUp.disabled = true
	$DensityControl/ButtonDown.disabled = false


func _on_check_button_toggled(toggled_on):
	sidewalk_enable = toggled_on
	emit_signal("sidewalk_enabled_changed")


func _on_color_picker_button_color_changed(color):
	background_color = color
	emit_signal("background_colour_changed")
