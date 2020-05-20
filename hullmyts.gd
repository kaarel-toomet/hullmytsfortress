extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screen_size  # Size of the game window.
var speed = 4


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if not get_parent().paused:
		if Input.is_action_pressed("ui_right"):
# warning-ignore:return_value_discarded
			move_and_slide(Vector2(60,0)*speed)
		if Input.is_action_pressed("ui_left"):
# warning-ignore:return_value_discarded
			move_and_slide(Vector2(-60,0)*speed)
		if Input.is_action_pressed("ui_down"):
# warning-ignore:return_value_discarded
			move_and_slide(Vector2(0,60)*speed)
		if Input.is_action_pressed("ui_up"):
# warning-ignore:return_value_discarded
			move_and_slide(Vector2(0,-60)*speed)
		position.x = clamp(position.x, 0, screen_size.x-32)
		position.y = clamp(position.y, 0, screen_size.y-32)

