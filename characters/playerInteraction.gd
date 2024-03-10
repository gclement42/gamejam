extends Area3D

var global = preload("res://Scripts/global.gd").new()

func _ready():
	global.instance.playerSpawnLocation = Vector3(0, 0, 0)
	connect("body_entered", _on_player_entered)
	connect("body_exited", _on_player_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_entered(body):
	if body.is_in_group("Door"):
		global.instance.is_player_near_door = true
		
func _on_player_exited(body):
	if body.is_in_group("Door"):
		global.instance.is_player_near_door = true
