extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerpos
var speed = 4
var life = 1200
var health = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if get_parent().get_parent().paused: return
	playerpos = get_parent().get_parent().get_node("player").position
	var vel = Vector2(sign(playerpos.x-position.x),sign(playerpos.y-position.y))
	if health <= 0:
		queue_free()
		get_parent().get_parent().get_node("TileMap").score += 5
	move_and_slide(vel*speed*60)
	life -= 1
	if life <= 0: queue_free()
	for i in get_slide_count():
		var c = get_slide_collision(i)
		var pos = Vector2(floor(position.x/32+0.5),floor(position.y/32+0.5)) - c.normal
		if rand_range(0,1) < 0.02:
			get_parent().get_parent().get_node("TileMap/breaking").breaktile(pos)
	


func _on_Area2D_body_entered(body):
	if body.get_parent() == get_parent().get_parent().get_node("bullets"):
		health -= 1
		body.queue_free()
	elif body == get_parent().get_parent().get_node("player"):get("").d=1
