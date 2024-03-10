extends CharacterBody3D

@export var is_active = false
@onready var label = $Label

func _ready():
	label.visible = false
	
func dialog():
	label.visible = true
	
func close_dialog():
	label.visible = false
