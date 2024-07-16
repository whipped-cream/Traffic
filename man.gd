extends Node2D

@export var speed = 1
@export var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	if direction == -1:
		$Marker2D/AnimatedSprite2D.flip_h = true
	speed = randfn(1, 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Marker2D.position.x += direction * speed




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
