extends Node2D

@export var ghost_template : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _spawn():
	pass

func _on_spawn_timer_timeout():
	var ghost = ghost_template.instantiate()
	add_child(ghost)
