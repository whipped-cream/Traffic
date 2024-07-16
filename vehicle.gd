extends Node2D

@export var speed = 1
@export var end_position: int

# Called when the node enters the scene tree for the first time.
func _ready():
	# $Marker2D.position.x -= $Marker2D/VehicleBody.texture.get_width() # Honestly Im probably just gonna do all these manually anyway so this is a bit of a useless thing
	# Choose a vehicle sprite randomly
	# Set the width of the onscreennotifier
	# Set the bounce height and speed
	# WE may want to move the sprite backwards so that the node is at the front of the sprite for spawning reasons
	end_position = $Marker2D/VisibleOnScreenNotifier2D.position.x
	$Marker2D/AnimationPlayer.speed_scale = randf() * 3 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Marker2D.position.x += speed
	end_position = $Marker2D.position.x + $Marker2D/EndMarker.position.x


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
