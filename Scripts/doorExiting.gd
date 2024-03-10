extends Area3D

var is_player_near_door = false

func _ready():
	connect("body_entered", _on_player_entered)
	connect("body_exited", _on_player_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	print(is_player_near_door)
	if event.is_action_pressed("Interact") && is_player_near_door:
		get_tree().change_scene_to_file("res://rooms/corridor.tscn")

func _on_player_entered(body):
	if body.is_in_group("Player"):
		is_player_near_door = true
		
func _on_player_exited(body):
	if body.is_in_group("Player"):
		is_player_near_door = false
