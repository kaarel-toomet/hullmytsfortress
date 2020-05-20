extends TileMap

# Declare member variables here.
var mxy = Vector2()
var bullet = preload("res://bullet.tscn")
var build = 0
var score = 50

var costs = {-1:0, 0:1, 1:20, 2:100}
#-1:none, 0:brick, 1:cannon, 2:gold
#

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().paused: return
	get_parent().get_node("hud/Label").text = str(score)
	score = min(score,100)
	mxy = get_global_mouse_position()
	if Input.is_action_pressed("build"):
		if score >= costs[build] and get_cellv(mxy/32) == -1:
			set_cellv(mxy/32,build)
			$breaking.set_cellv(mxy/32,-1)
			$states.set_cellv(mxy/32,0)
			score -= costs[build]
	if Input.is_action_pressed("break"):
		score += costs[get_cellv(mxy/32)]
		set_cellv(mxy/32,-1)
		$states.set_cellv(mxy/32,0)
		$breaking.set_cellv(mxy/32,-1)
	if Input.is_action_pressed("1"): build = 0
	if Input.is_action_pressed("2"): build = 1
	if Input.is_action_pressed("3"): build = 2
	for cell in get_used_cells():
		if get_cellv(cell) == 1:
			$states.set_cellv(cell,$states.get_cellv(cell)+1)
			if $states.get_cellv(cell) >= 60:
				$states.set_cellv(cell,0)
				var pew = bullet.instance()
				pew.position = cell*32 + Vector2(16,16)
				pew.vel = Vector2(4,0)
				get_parent().get_node("bullets").add_child(pew)
