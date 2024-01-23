extends Area2D

const width = 640
const height = 480

var y = 0
var x = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var side = randi_range(1,4)
	if side==1:
		y = 0
		x = randf_range(0,width)
	if side==2:
		y = randf_range(0,height)
		x = 0
	if side==3:
		y = randf_range(0,height)
		x = width
	if side==4:
		y = height
		x = randf_range(0,width)
	position = Vector2(x,y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
