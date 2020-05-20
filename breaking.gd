extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func breaktile(pos):
	if get_parent().get_cellv(pos) == -1: return
	set_cellv(pos,get_cellv(pos)+1)
	if get_cellv(pos) > 3:
		set_cellv(pos,-1)
		get_parent().set_cellv(pos,-1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_parent().paused: return
	for cell in get_used_cells():
		if rand_range(0,1) < 0.01:
			set_cellv(cell,-1)
