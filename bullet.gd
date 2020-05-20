extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel = Vector2(5,0)
var life = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_parent().paused: return
	life -= 1
	position += vel
	if life <= 0: queue_free()
