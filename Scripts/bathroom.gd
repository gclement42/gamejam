extends Node3D

var global = preload("res://Scripts/global.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("Interact") && global.instance.is_player_near_door:
		get_tree().change_scene_to_file("res://rooms/corridor.tscn")
	
