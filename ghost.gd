extends Area2D

const width = 640
const height = 480

var side = 0
var velocity = Vector2.ZERO
var y = 0
var x = 0
var speed = 46

var active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	side = randi_range(1,4)
	if side==1:
		# spawn top
		y = 0
		x = randf_range(0,width)
		$AnimatedSprite2D.animation = "Down"
		velocity.y = 1
	if side==2:
		# spawn left
		y = randf_range(0,height)
		x = 0
		$AnimatedSprite2D.animation = "Right"
		velocity.x = 1
	if side==3:
		# spawn right
		y = randf_range(0,height)
		x = width
		$AnimatedSprite2D.animation = "Left"
		velocity.x = -1
	if side==4:
		# spawn bottom
		y = height
		x = randf_range(0,width)
		$AnimatedSprite2D.animation = "Up"
		velocity.y = -1
	position = Vector2(x,y)
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		position += velocity*delta*speed
		# position.x = clamp(position.x,0,width)
		# position.y = clamp(position.y,0,height)
		if position.x > width:
			position.x = 0
		elif position.x < 0:
			position.x = width
		if position.y > height:
			position.y = 0
		elif position.y < 0:
			position.y = height

func _on_end():
	active = false
	$AnimatedSprite2D.stop()
