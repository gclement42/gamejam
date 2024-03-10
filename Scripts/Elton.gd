extends CharacterBody3D

@onready var label = $Label

func dialog():
	label.visible = true
	
func close_dialog():
	label.visible = false
