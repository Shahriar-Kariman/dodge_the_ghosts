extends Control

var active = true

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var msec: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		time += delta
		msec = fmod(time, 1) * 100
		seconds = fmod(time, 60)
		minutes = fmod(time, 3600) / 60
		$panel/minutes.text = "%02d:" % minutes
		$panel/seconds.text = "%02d." % seconds
		$panel/miliseconds.text = "%03d" % msec

func _on_player_end():
	active = false
	$AcceptDialog.title = "\nYou lasted %02d:%02d.%03d" % [minutes,seconds,msec]
	$AcceptDialog.visible = true

func _on_accept_dialog_confirmed():
	get_tree().reload_current_scene()
