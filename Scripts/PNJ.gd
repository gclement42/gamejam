extends Node3D

@onready var animations = $rig/AnimationPlayer

func _ready():
	animations.play('idle')
