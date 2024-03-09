extends CharacterBody3D
#Move speed in m/s
@export var speed = 5
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("moveForward"):
		direction.x += 1
	if Input.is_action_pressed("moveBackward"):
		direction.x -= 1
	if Input.is_action_pressed("moveLeft"):
		direction.z -= 1
	if Input.is_action_pressed("moveRight"):
		direction.z += 1
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)
		
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	velocity = target_velocity
	move_and_slide()
	
	if direction != Vector3.ZERO:
		$Pivot/DamianCooper/AnimationPlayer.play("Armature|mixamo_com|Layer0")
	
