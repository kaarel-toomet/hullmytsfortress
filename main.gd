extends Node2D


# Declare member variables here. Examples:
# var a = 2
var paused = false
var bandit = preload("res://bandit.tscn")
var tick = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("p"):
		paused = !paused
	if paused:return
	tick += 1
	if rand_range(0,1) < 0.005+tick*0.000005:
		var spawn = bandit.instance()
		spawn.position = Vector2(1024,randi()%640)
		$bandits.add_child(spawn)	
