extends Area2D

var speed = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("player_move_right"):
		velocity.x += 1
		$AnimatedSprite2D.animation = "Right"
	if Input.is_action_pressed("player_move_left"):
		velocity.x -= 1
		$AnimatedSprite2D.animation = "Left"
	if Input.is_action_pressed("player_move_up"):
		velocity.y -= 1
		$AnimatedSprite2D.animation = "Up"
	if Input.is_action_pressed("player_move_down"):
		velocity.y += 1
		$AnimatedSprite2D.animation = "Down"
	
	if velocity.length()> 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity*delta
