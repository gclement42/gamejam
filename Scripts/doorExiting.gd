extends Area3D

var is_player_near_door = false
var rooms = {
	"corridorDoor": "res://rooms/corridor.tscn",
	"bathroomDoor": "res://rooms/bathroom.tscn",
	"kitchenDoor": "res://rooms/kitchen.tscn",
	"wcDoor": "res://rooms/wc.tscn",
	"mainRoomDoor": "res://rooms/Main_room.tscn"
}

func _ready():
	connect("body_entered", _on_player_entered)
	connect("body_exited", _on_player_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("Interact") && is_player_near_door:
		get_tree().change_scene_to_file(rooms[get_parent().name])

func _on_player_entered(body):
	if body.is_in_group("Player"):
		is_player_near_door = true
		
func _on_player_exited(body):
	if body.is_in_group("Player"):
		is_player_near_door = false
